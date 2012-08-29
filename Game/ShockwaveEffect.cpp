#include "ShockwaveEffect.hpp"

ShockwaveEffect::ShockwaveEffect(Vector position, double size, int duration,
				 Color color) {
  this->position = position;
  this->finalSize = size;
  this->size = 0.0;
  this->finalDuration = duration;
  this->duration = 0;
  this->color = color;

  this->dead = false;

  Mantis::RandomNumberGenerator *randomGenerator = 
    Mantis::RandomNumberGenerator::instance();

  unsigned int numDebris = 32;
  int orientation = randomGenerator->getIntNumberBetween(0, 359);
  for (unsigned int i = 0; i < numDebris; i++) {
    double angle = randomGenerator->getRealNumberBetween(0, 2.0 * M_PI);
    double radius = randomGenerator->getRealNumberBetween(0.35 * size,
							  size);

    Vector destination = Vector(position.x + radius * cos(angle),
				position.y + radius * sin(angle),
				0.0);

    VisualEffect *debrisEffect = 
      new DebrisEffect(position, destination, orientation + ((i * 16) % 360), 
		       duration, color);

    debris.push_back(debrisEffect);
  }
}

ShockwaveEffect::~ShockwaveEffect() {
  for (unsigned int i = 0; i < debris.size(); i++) {
    delete debris[i];
  }
}

bool ShockwaveEffect::isDead() {
  return dead;
}

void ShockwaveEffect::update() {
  double g = 3.0;
  double t = pow((double)duration / (double)finalDuration, 1.0 / g);
  size = (t * finalSize);

  duration++;
  if (duration > finalDuration) {
    dead = true;
  }

  for (unsigned int i = 0; i < debris.size(); i++) {
    if (!debris[i]->isDead()) {
      debris[i]->update();
    }
  }
}

void ShockwaveEffect::render(const Region &view) {
  if (!view.contains(getBoundingCircle())) {
    return;
  }
  
  glLoadIdentity();

  unsigned int numSides = 16;
  double dAngle = (2.0 * M_PI) / numSides;

  glColor4f(color.r, color.g, color.b, 0.0);
  glBegin(GL_TRIANGLE_FAN);
  glVertex3f(position.x, position.y, 0.0);

  double t = (double)duration / (double)finalDuration;
  
  glColor4f(color.r, color.g, color.b, (1.0 - t) * 1.0);
  for (unsigned int i = 0; i <= numSides; i++) {
    unsigned int j = (i % numSides);
    glVertex3f(position.x + size * cos(j * dAngle),
	       position.y + size * sin(j * dAngle),
	       0.0);
  }
  glEnd();

  for (unsigned int i = 0; i < debris.size(); i++) {
    if (!debris[i]->isDead()) {
      debris[i]->render(view);
    }
  }
}

BoundingCircle ShockwaveEffect::getBoundingCircle() {
  return BoundingCircle(position, size);
}
