#include "Cell.hpp"
#include "Virus.hpp"
#include "Map.hpp"
#include "VirusCache.hpp"

double Cell::lastZoom = 4.0;

Cell::Cell(ProteinType proteinType, Vector position) {
  Mantis::RandomNumberGenerator *randomGenerator = 
    Mantis::RandomNumberGenerator::instance();

  this->state = CELLSTATE_IDLE;
  this->cloneId = 0;
  this->map = 0;
  this->dead = false;

  this->proteinType = proteinType;
  this->position = position;
  orientation = 0.0;
  rotateSpeed = randomGenerator->getRealNumberBetween(-0.08, 0.08);

  frame = randomGenerator->getIntNumberBetween(0, 239);
  cloningCooldown = 0;

  switch (proteinType) {
  case PROTEINTYPE_NONE:
    id = MODELID_NONE_CELL;
    break;

  case PROTEINTYPE_SQUARE:
    id = MODELID_SQUARE_CELL;
    break;

  case PROTEINTYPE_CIRCLE:
    id = MODELID_CIRCLE_CELL;
    break;

  case PROTEINTYPE_TRIANGLE:
    id = MODELID_TRIANGLE_CELL;
    break;
  }

  cache = ModelCache::instance();
  if (!cache->exists(id)) {
    buildDisplayLists(id);
  }
}

Cell::~Cell() {
  for (unsigned int i = 0; i < viruses.size(); i++) {
    delete viruses[i];
  }
}

bool Cell::isDead() {
  return dead;
}

void Cell::setPosition(const Vector &position) {
  this->position = position;
}

Vector Cell::getPosition() {
  return this->position;
}

void Cell::setOrientation(double orientation) {
  this->orientation = orientation;
}

void Cell::setRotateSpeed(double rotateSpeed) {
  this->rotateSpeed = rotateSpeed;
}

ProteinType Cell::getProteinType() {
  return this->proteinType;
}

void Cell::setMap(Map *map) {
  this->map = map;
}

void Cell::buildDisplayLists(unsigned int id) {
  shape.clear();
  core.clear();

  double t = 1.0 - ((16.0 - lastZoom) / 12.0);
  int numSides = 8 + (t * 8);
  double radius = CELL_RADIUS;

  double dAngle = (2.0 * M_PI) / numSides;
  for (int i = 0; i < numSides; i++) {
    Vector v = 
      Vector(radius * cos(i * -dAngle), radius * sin(i * -dAngle), 0.0);
    
    shape.push_back(v);
  }  
  
  Protein *protein = 0;
  switch (id) {
  case MODELID_NONE_CELL:
    protein = 0;
    numSides = 0;
    break;

  case MODELID_SQUARE_CELL:
    protein = new SquareProtein(0.0);
    numSides = 4;
    break;

  case MODELID_CIRCLE_CELL:
    protein = new CircleProtein(0.0);
    numSides = 12;
    break;

  case MODELID_TRIANGLE_CELL:
    protein = new TriangleProtein(0.0);
    numSides = 3;
    break;
  }

  dAngle = (2.0 * M_PI) / numSides;
  radius /= 5.0;
  for (int i = 0; i < numSides; i++) {
    Vector v = 
      Vector(radius * cos(i * -dAngle), radius * sin(i * -dAngle), 0.0);
    
    core.push_back(v);
  }  

  cache->beginSaveCore(id);

  glLineWidth(1.0);
  glBegin(GL_POLYGON);
  for (unsigned int i = 0; i < shape.size(); i++) {
    glVertex3f(shape[i].x, shape[i].y, 0.0);
  }
  glEnd();

  cache->endSave();

  cache->beginSaveShape(id);
  
  if (numSides > 0) {
    glBegin(GL_POLYGON);
    for (unsigned int i = 0; i < core.size(); i++) {
      glVertex3f(core[i].x, core[i].y, 0.0);
    }
    glEnd();
  }

  glEnable(GL_LINE_SMOOTH);

  glLineWidth(3.0);
  glBegin(GL_LINES);
  for (unsigned int i = 0; i < shape.size(); i++) {
    unsigned int j = (i + 1) % shape.size();
    glVertex3f(shape[i].x, shape[i].y, 0.0);
    glVertex3f(shape[j].x, shape[j].y, 0.0);
  }
  glEnd();

  if (protein && lastZoom > 8.0) {
    unsigned int proteinDensity = 5;
    glLineWidth(1.0);
    for (unsigned int i = 0; i < shape.size(); i++) {
      glPushMatrix();
      
      unsigned int j = (i + 1) % shape.size();
      Vector start = shape[i];
      Vector end = shape[j];
      
      Vector direction = Vector(end.x - start.x,
				end.y - start.y,
				end.z - start.z);
      double sideLength = direction.length();
      direction = direction.normalize();
      
      double angle = atan2(direction.y, direction.x) - atan2(0.0, 1.0);
      angle = angle * 180.0 / M_PI;
      
      Vector normal = direction.cross(Vector(0.0, 0.0, 1.0));
      
      double deltaK = 1.0 / (double)(proteinDensity); 
      for (unsigned int numProteins = 0; 
	   numProteins < proteinDensity; numProteins++) {
	glPushMatrix();
	
	Vector position = start;

	double offset = (deltaK * sideLength) / 2.0;

	position = 
	  position.translate(direction.mult(offset + numProteins * deltaK * sideLength));
	glTranslatef(position.x, position.y, position.z);
	glRotatef(angle, 0.0, 0.0, 1.0);
	protein->render();
	
	glPopMatrix();
      }
      
      glPopMatrix();
    }
  }

  glDisable(GL_LINE_SMOOTH);

  cache->endSave();
}

void Cell::update() {
  if (state == CELLSTATE_CLONING) {
    orientation += (rotateSpeed / fabs(rotateSpeed)) * 0.32;

    for (unsigned int i = 0; i < viruses.size(); i++) {
      viruses[i]->update();
    }

    if (cloningCooldown) {
      cloningCooldown--;

      if (cloningCooldown % 5 == 0) {
	Mantis::RandomNumberGenerator *randomGenerator =
	  Mantis::RandomNumberGenerator::instance();
	
	double angle = randomGenerator->getRealNumberBetween(0.0, 2.0 * M_PI);
	double radius = 
	  randomGenerator->getRealNumberBetween(CELL_RADIUS * 0.3,
						CELL_RADIUS * 0.9);
	
	Vector start = Vector(position.x + radius * cos(angle),
			      position.y + radius * sin(angle),
			      0.0);
	VisualEffect *effect = 
	  new DebrisEffect(start, position, frame,
			   30, Color(0.75, 0.75, 0.75, 0.75));
	
	map->addVisualEffect(effect);
      }
    } else {
      if (viruses.size() < numClones) {
	cloningCooldown = cloningTime;
	
	Virus *virus = new Virus(cloneFaction, cloneId, false);
	
	double dAngle = (2.0 * M_PI) / numClones;
	unsigned int k = viruses.size();
	Vector destination =
	  Vector(position.x + (CELL_RADIUS / 1.65) * cos(k * dAngle),
		 position.y + (CELL_RADIUS / 1.65) * sin(k * dAngle),
		 0.0);
	
	virus->setPosition(position);
	virus->goTo(destination);
	virus->setOrientation(0.0);
	
	Mantis::RandomNumberGenerator *randomGenerator =
	  Mantis::RandomNumberGenerator::instance();
	
	double rotateSpeed = randomGenerator->getRealNumberBetween(-1.5, 1.5);
	virus->setRotateSpeed(rotateSpeed);
	
	viruses.push_back(virus);
      } else {
	state = CELLSTATE_DEAD;
	deadCounter = 0;

	Mantis::RandomNumberGenerator *randomGenerator =
	  Mantis::RandomNumberGenerator::instance();

	unsigned int numBubbles = 16;
	for (unsigned int i = 0; i < numBubbles; i++) {
	  double angle = randomGenerator->getRealNumberBetween(0.0, 2.0 * M_PI);
	  double radius = 
	    randomGenerator->getRealNumberBetween(0.0, 0.8 * CELL_RADIUS);
	  
	  Vector start = Vector(position.x + radius * cos(angle),
				position.y + radius * sin(angle),
				0.0);
	  Vector end = Vector(position.x + 3.0 * radius * cos(angle),
			      position.y + 3.0 * radius * sin(angle),
			      0.0);
	  VisualEffect *effect = 
	    new BubbleEffect(start, end, CELL_RADIUS,
			     120, Color(0.75, 0.75, 0.75, 0.75));

	  map->addVisualEffect(effect);
	}

	unsigned int numDebris = 32;
	for (unsigned int i = 0; i < numDebris; i++) {
	  double angle = randomGenerator->getRealNumberBetween(0.0, 2.0 * M_PI);
	  double radius = CELL_RADIUS;
	  
	  Vector start = Vector(position.x + radius * cos(angle),
				position.y + radius * sin(angle),
				0.0);
	  Vector end = Vector(position.x + 1.5 * radius * cos(angle),
			      position.y + 1.5 * radius * sin(angle),
			      0.0);
	  VisualEffect *effect = 
	    new DebrisEffect(start, end, frame + i * 16,
			     120, Color(0.75, 0.75, 0.75, 0.75));

	  map->addVisualEffect(effect);
	}

	for (unsigned int i = 0; i < viruses.size(); i++) {
	  Tile *tile = map->getTile(position);
	  tile->setType(TILE_EMPTY);

	  map->addEntity(viruses[i]);
	  viruses[i]->activate();

	  std::deque<Tile *> path;
	  path.push_back(tile);
	  viruses[i]->setPath(path, 0);
	}

	viruses.clear();
      }
    }
  } else {
    orientation += rotateSpeed;
  }

  if (state == CELLSTATE_DEAD) {
    if (deadCounter < 120) {
      deadCounter++;
    } else {
      dead = true;
    }
  }

  if (orientation >= 360.0) {
    orientation -= 360.0;
  }

  frame++;
  frame = frame % 240;
}

void Cell::render(Region view) {
  if (!view.contains(getBoundingCircle())) {
    return;
  }

  if (lastZoom != view.zoom) {
    lastZoom = view.zoom;
    buildDisplayLists(MODELID_NONE_CELL);
    buildDisplayLists(MODELID_SQUARE_CELL);
    buildDisplayLists(MODELID_CIRCLE_CELL);
    buildDisplayLists(MODELID_TRIANGLE_CELL);
  }

  for (unsigned int i = 0; i < viruses.size(); i++) {
    viruses[i]->render(view);
  }

  glLoadIdentity();
  glTranslatef(position.x, position.y, position.z);
  glRotatef(orientation, 0.0, 0.0, 1.0);

  double p = ((double)frame / 240.0) * M_PI * 2.0;
  glScalef(1.0 + 0.025 * sin(p), 1.0 + 0.025 * cos(p + M_PI/2.0), 0.0);

  if (state != CELLSTATE_DEAD) {
    glColor4f(0.75, 0.75, 0.75, 0.5 + (sin(p) * 0.10));
    cache->renderCore(id);
    
    glColor4f(0.75, 0.75, 0.75, 1.0);
    cache->renderShape(id);
  } else {
    double t = pow((double)deadCounter / 120.0, 1.0 / 4.0);

    glScalef(1.0 + 0.5 * t, 1.0 + 0.5 * t, 0.0);
    glColor4f(0.75, 0.75, 0.75, (1.0 - t) * 0.5);
    cache->renderShape(id);

    glColor4f(0.75, 0.75, 0.75, (1.0 - t) * (0.5 + (sin(p) * 0.10)));
    cache->renderCore(id);
  }
}

BoundingCircle Cell::getBoundingCircle() {
  return BoundingCircle(position, CELL_RADIUS);
}

void Cell::notifyInvasion() {
  state = CELLSTATE_TAKEN;
}

void Cell::startCloning(Faction faction, unsigned int id) {
  VirusCache *virusCache = VirusCache::instance();
  if (!virusCache->exists(id)) {
    virusCache->generateVirus(id);
  }

  VirusData *virusData = virusCache->getVirusData(id);

  cloneFaction = faction;
  cloneId = id;
  state = CELLSTATE_CLONING;
  cloningTime = virusData->getCloningTime();
  cloningCooldown = cloningTime;
  numClones = virusData->getNumClones();
}

bool Cell::isTaken() {
  return (state == CELLSTATE_TAKEN || state == CELLSTATE_CLONING);
}
