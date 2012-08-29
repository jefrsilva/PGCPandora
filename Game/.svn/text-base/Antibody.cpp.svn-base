#include "Antibody.hpp"
#include "Virus.hpp"
#include "Map.hpp"

Antibody::Antibody(DamageInfo damage, Vector position, 
		   Virus *target, int frame) {
  this->damage = DamageInfo(damage);
  this->position = position;
  this->map = 0;
  this->orientation = (double)(frame % 360);
  this->lifetime = ((damage.getRange()) / CELL_RADIUS) * 90;

  this->target = target;
  this->target->addToNotifyOnDeath(this);

  this->dead = false;

  switch (damage.getDamageColor()) {
  case VIRUS_COLOR_RED:
    this->color = Color(1.0, 0.0, 0.0);
    break;

  case VIRUS_COLOR_GREEN:
    this->color = Color(0.0, 1.0, 0.0);
    break;

  case VIRUS_COLOR_BLUE:
    this->color = Color(0.0, 0.0, 1.0);
    break;

  case VIRUS_COLOR_YELLOW:
    this->color = Color(1.0, 1.0, 0.0);
    break;
  }
}

Antibody::~Antibody() {
  if (target) {
    target->notifyDeath(this);
  }
}

bool Antibody::isDead() {
  return dead;
}

void Antibody::update() {
  if (!target) {
    dead = true;
    createDeathEffect();

    return;
  }

  Vector direction = Vector(position, target->getPosition());
  direction = direction.normalize();
  
  Vector speed = direction.mult(damage.getSpeed());

  setPosition(position.translate(speed));

  orientation += 5.0;
  if (orientation >= 360.0) {
    orientation = 0.0;
  }

  lifetime--;
  if (!lifetime) {
    dead = true;

    createDeathEffect();
  } else if (getBoundingCircle().overlaps(target->getBoundingCircle())) {
    target->dealDamage(damage);
    dead = true;

    createDeathEffect();
  }
}

void Antibody::createDeathEffect() {
  Mantis::RandomNumberGenerator *randomGenerator = 
    Mantis::RandomNumberGenerator::instance();
  
  unsigned int numDebris = 3;
  double size = 2.0;
  int duration = 30;
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
    
    map->addVisualEffect(debrisEffect);
  }
}

void Antibody::render(const Region &view) {
  if (!view.contains(getBoundingCircle())) {
    return;
  }

  glLoadIdentity();
  glTranslatef(position.x, position.y, 0.0);
  glRotatef(orientation, 0.0, 0.0, 1.0);

  glColor3f(color.r, color.g, color.b);

  if (view.zoom < 8.0) {
    lowRender();
  } else {
    glLineWidth(2.0);
    
    switch (damage.getDamageType()) {
    case ANTIBODYTYPE_SQUARE:
      renderSquareAntibody(view);
      break;
      
    case ANTIBODYTYPE_CIRCLE:
      renderCircleAntibody(view);
      break;
      
    case ANTIBODYTYPE_TRIANGLE:
      renderTriangleAntibody(view);
      break;
    }
  }
}

void Antibody::renderSquareAntibody(const Region &view) {
  double size = 0.30;

  glBegin(GL_LINES);
  glVertex3f(0.0, -size, 0.0);
  glVertex3f(0.0, 0.0, 0.0);

  glVertex3f(-size / 2.0, 0.0, 0.0);
  glVertex3f(size / 2.0, 0.0, 0.0);

  glVertex3f(-size / 2.0, 0.0, 0.0);
  glVertex3f(-size / 2.0, size, 0.0);

  glVertex3f(size / 2.0, 0.0, 0.0);
  glVertex3f(size / 2.0, size, 0.0);
  glEnd();
}

void Antibody::renderCircleAntibody(const Region &view) {
  double radius = 0.20;

  glBegin(GL_LINES);
  glVertex3f(0.0, -radius, 0.0);
  glVertex3f(0.0, 0.0, 0.0);

  glVertex3f(0.0, 0.0, 0.0);
  glVertex3f(radius * 0.7, radius - (radius * 0.7), 0.0);

  glVertex3f(radius * 0.7, radius - (radius * 0.7), 0.0);
  glVertex3f(radius, 1.25 * radius, 0.0); 

  glVertex3f(0.0, 0.0, 0.0);
  glVertex3f(-radius * 0.7, radius - (radius * 0.7), 0.0);

  glVertex3f(-radius * 0.7, radius - (radius * 0.7), 0.0);
  glVertex3f(-radius, 1.25 * radius, 0.0); 
  glEnd();
}

void Antibody::renderTriangleAntibody(const Region &view) {
  double size = 0.30;

  glBegin(GL_LINES);
  glVertex3f(0.0, -size, 0.0);
  glVertex3f(0.0, 0.0, 0.0);
  
  glVertex3f(0.0, 0.0, 0.0);
  glVertex3f(-size / 1.5, size, 0.0);
  
  glVertex3f(0.0, 0.0, 0.0);
  glVertex3f(size / 1.5, size, 0.0);
  glEnd();
}

void Antibody::lowRender() {
  double size = 0.3;

  glBegin(GL_LINES);
  glVertex3f(0.0, -size, 0.0);
  glVertex3f(0.0, size, 0.0);
  glEnd();
}

BoundingCircle Antibody::getBoundingCircle() {
  return BoundingCircle(position, 0.0);
}

void Antibody::addToNotifyOnDeath(Entity *entity) {

}

void Antibody::notifyDeath(Entity *deadEntity) {
  target = 0;
}
