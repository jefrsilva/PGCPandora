#include "DebrisEffect.hpp"

DebrisEffect::DebrisEffect(Vector position, Vector destination,
			   int orientation, int duration, Color color) {
  this->position = position;
  this->start = position;
  this->end = destination;
  this->orientation = orientation;
  this->finalDuration = duration;
  this->duration = 0.0;
  this->color = color;

  this->dead = false;
}

DebrisEffect::~DebrisEffect() {
  
}

bool DebrisEffect::isDead() {
  return dead;
}

void DebrisEffect::update() {
  double t = (double)duration / (double)finalDuration;
  position = Vector(start.x * (1.0 - t) + end.x * t,
		    start.y * (1.0 - t) + end.y * t,
		    0.0);

  orientation = (orientation + 8) % 360;

  duration++;
  if (duration > finalDuration) {
    dead = true;
  }
}

void DebrisEffect::render(const Region &view) {
  if (!view.contains(getBoundingCircle())) {
    return;
  }

  glLoadIdentity();
  glTranslatef(position.x, position.y, 0.0);
  glRotatef((double)orientation, 0.0, 0.0, 1.0);

  double t = (double)duration / (double)finalDuration;
  glColor4f(color.r, color.g, color.b, (1.0 - t) * 1.0);

  double size = 0.5;
  glBegin(GL_POLYGON);
  glVertex3f(-size / 8.0, size / 2.0, 0.0);
  glVertex3f(-size / 8.0, -size / 2.0, 0.0);
  glVertex3f(size / 8.0, -size / 2.0, 0.0);
  glVertex3f(size / 8.0, size / 2.0, 0.0);
  glEnd();
}

BoundingCircle DebrisEffect::getBoundingCircle() {
  return BoundingCircle(position, 0.0);
}
