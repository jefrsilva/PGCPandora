#include "BubbleEffect.hpp"

BubbleEffect::BubbleEffect(Vector position, Vector destination,
			   double size, int duration, Color color) {
  this->position = position;
  this->start = position;
  this->end = destination;
  this->size = size;
  this->finalSize = size;
  this->duration = 0;
  this->finalDuration = duration;
  this->color = color;

  this->dead = false;
}

BubbleEffect::~BubbleEffect() {
  
}

bool BubbleEffect::isDead() {
  return dead;
}

void BubbleEffect::update() {
  double t = (double)duration / (double)finalDuration;
  position = Vector(start.x * (1.0 - t) + end.x * t,
		    start.y * (1.0 - t) + end.y * t,
		    0.0);

  t = pow((double)duration / (double)finalDuration, 1.0 / 4.0);
  size = (1.0 - t) * finalSize;

  duration++;
  if (duration > finalDuration) {
    dead = true;
  }
}

void BubbleEffect::render(const Region &view) {
  if (!view.contains(getBoundingCircle())) {
    return;
  }

  glLoadIdentity();
  glTranslatef(position.x, position.y, 0.0);

  double t = (double)duration / (double)finalDuration;
  glColor4f(color.r, color.g, color.b, (1.0 - t) * color.a);

  unsigned int numSides = 12;
  double dAngle = (2.0 * M_PI) / numSides;

  glBegin(GL_POLYGON);
  for (unsigned int i = 0; i < numSides; i++) {
    glVertex3f(size * cos(i * dAngle),
	       size * sin(i * dAngle),
	       0.0);
  }
  glEnd();
}

BoundingCircle BubbleEffect::getBoundingCircle() {
  return BoundingCircle(position, size);
}
