#include "Virus.hpp"
#include "Map.hpp"
#include "Tile.hpp"
#include "VirusFilter.hpp"
#include "ShockwaveEffect.hpp"
#include "Cell.hpp"

int Virus::currentAiGroup = 0;

Virus::Virus(Faction faction, unsigned int id, bool active) {
  this->owner = faction;
  this->id = id;
  this->map = 0;
  this->dead = false;
  this->reproduceCooldown = 600;
  this->takenCell = 0;
  this->data = 0;

  if (active) {
    state = VIRUSSTATE_IDLE;
  } else {
    state = VIRUSSTATE_INACTIVE;
  }
  this->command = VIRUSCOMMAND_EXPAND;

  gotDestination = false;
  destination = Vector(0.0, 0.0, 0.0);

  position = Vector(0.0, 0.0, 0.0);
  orientation = 0.0;
  speed = Vector(0.0, 0.0, 0.0);
  rotateSpeed = 0.0;

  frame = 0;
  aiGroup = currentAiGroup;
  currentAiGroup = (currentAiGroup + 1) % 30;

  moveDelay = 0;
  timeOnDestination = 0;
  attackCooldown = 0;

  flash = 0;

  cache = VirusCache::instance();

  if (!cache->exists(id)) {
    cache->generateVirus(id);
  }

  virusData = cache->getVirusData(id);

  this->hp = virusData->getMaxHP();
}

Virus::~Virus() {
  for (unsigned int i = 0; i < notifyOnDeath.size(); i++) {
    notifyOnDeath[i]->notifyDeath(this);
  }
}

bool Virus::isDead() {
  return dead;
}

void Virus::update() {
  double maxSpeed = 0.2;
  double maxAccel = 0.1;

  switch (virusData->getBodyType()) {
  case VIRUS_BODYTYPE_WORM:
    maxSpeed = virusData->getMovementSpeed();
    maxAccel = 0.012;
    if (gotDestination && state == VIRUSSTATE_MOVING) {
      Vector direction = Vector(position, destination);
      direction = direction.normalize();

      double angle = atan2(direction.y, direction.x) - atan2(0.0, 1.0);
      angle = angle * 180.0 / M_PI;

      double turnSpeed = 0.0;
      double turnTo = angle;
      double distanceAdd;
      double distanceSub;
      if (orientation < turnTo) {
	distanceAdd = turnTo - orientation;
	distanceSub = turnTo + 360.0 - orientation;
      } else {
	distanceAdd = turnTo + 360.0 - orientation;
	distanceSub = orientation - turnTo;
      }

      double distance = std::min(distanceAdd, distanceSub);
      
      if (fabs(distance) > 50.0) {
	turnSpeed = 10.0;
      } else if (fabs(distance) > 10.0) {
	turnSpeed = 5.0;
      } else if (fabs(distance) > 5.0) {
	turnSpeed = 2.5;
      } else if (fabs(distance) > 1.0) {
	turnSpeed = 1.0;
      } else {
	turnSpeed = 0.0;
      }
      
      if (distanceSub < distanceAdd) {
	orientation -= turnSpeed;
      } else {
	orientation += turnSpeed;
      }
      
      if (orientation >= 360.0) {
	orientation -= 360.0;
      }
    }
    break;

  case VIRUS_BODYTYPE_AMOEBA:
    maxSpeed = virusData->getMovementSpeed();
    maxAccel = 0.008;
    orientation += (rotateSpeed / 2.0);
    if (orientation >= 360.0) {
      orientation -= 360.0;
    }
    break;

  case VIRUS_BODYTYPE_SPHERE:
    maxSpeed = virusData->getMovementSpeed();
    maxAccel = 0.2;
    orientation += rotateSpeed;
    if (orientation >= 360.0) {
      orientation -= 360.0;
    }
    break;
  }

  frame++;

  // Virus being cloned inside cell
  if (state == VIRUSSTATE_INACTIVE) {
    Vector speed = Vector(position, destination);
    if (speed.length() > getBoundingCircle().getRadius() / 5.0) {
      speed = speed.normalize();
      speed = speed.mult(0.1);
      position = position.translate(speed);
    }
    return;
  }

  // Virus entering cell
  if (state == VIRUSSTATE_TAKINGCELL) {
    Vector speed = Vector(position, destination);
    if (speed.length() > getBoundingCircle().getRadius() / 5.0) {
      speed = speed.normalize();
      speed = speed.mult(0.05);
      position = position.translate(speed);
    } else {
      dead = true;
      takenCell->startCloning(owner, id);
    }
    return;
  }

  // Virus moving
  if (state == VIRUSSTATE_MOVING) {
    if (!gotDestination) {
      getDestination();
    } else if (reachedDestination()) {
      if (!moveDelay) {
	currentPath.pop_front();
	if (!currentPath.empty()) {
	  getDestination();
	} else {
	  gotDestination = false;
	  state = VIRUSSTATE_IDLE;
	}
      } else {
	gotDestination = false;
	destination = position;
      }
    }
  }

  Vector accel = Vector(0.0, 0.0, 0.0);
  if (gotDestination) {
    accel = Vector(position, destination);
    accel = accel.normalize();
    accel = accel.mult(maxAccel);
  } else {
    speed = Vector(0.0, 0.0, 0.0);
  }

  if (timeOnDestination) {
    double t = (double)timeOnDestination / 60.0;
    maxSpeed *= (0.5) * (1.0 - t);
  }
  speed = speed.translate(accel);
  if (speed.length() > maxSpeed) {
    speed = speed.normalize();
    speed = speed.mult(maxSpeed);
  }

  setPosition(position.translate(speed));

  if (moveDelay) {
    moveDelay--;
  }
  if (attackCooldown) {
    attackCooldown--;
  }
  if (flash) {
    flash--;
  }
  if (reproduceCooldown) {
    reproduceCooldown--;
  }
}

void Virus::render(const Region &view) {
  if (!view.contains(getBoundingCircle())) {
    return;
  }

  glLoadIdentity();
  glTranslatef(position.x, position.y, position.z);
  glRotatef(orientation, 0.0, 0.0, 1.0);

  if (view.zoom < 6.0) {
    virusData->lowRender(view.zoom);
  } else {
    if (view.zoom < 10.0) {
      virusData->lowRender(view.zoom);
    }
    virusData->render(frame, (double)flash / 45.0, flashColor, view.zoom);
  }
}

void Virus::setOrientation(double orientation) {
  this->orientation = orientation;
}

double Virus::getOrientation() {
  return this->orientation;
}

void Virus::setSpeed(Vector speed) {
  this->speed = speed;
}

void Virus::setRotateSpeed(double speed) {
  this->rotateSpeed = speed;
}

BoundingCircle Virus::getBoundingCircle() {
  return BoundingCircle(position, virusData->getRadius());
}

BoundingCircle Virus::getTakeoverCircle() {
  return BoundingCircle(position, virusData->getTakeoverRadius());
}

bool Virus::isVirus() {
  return true;
}

void Virus::clearPath() {
  currentPath.clear();
}

void Virus::setPath(const std::deque<Tile *> &path, int distance) {
  moveDelay = (distance * 15) + (frame % 60);
  currentPath = std::deque<Tile *>(path);
}

void Virus::setAIData(AIData *data) {
  this->data = data;
}

void Virus::updateAI() {
  if (!data) {
    return;
  }

  if (!attackCooldown) {
    DamageInfo damage = virusData->getDamageInfo();

    VirusFilter targetFilter;
    targetFilter.setOwnerFaction(owner);
    targetFilter.setPosition(position);
    std::vector<Virus *> *targets = targetFilter.filter(data->nearbyEntities,
							damage.getRange());
    
    if (targets->size() > 0) {
      Entity *antibody = new Antibody(damage, position, (*targets)[0], frame);
      
      map->addEntity(antibody);
      
      attackCooldown = damage.getDamageCooldown();
    }

    delete targets;
  }

  if (state == VIRUSSTATE_IDLE) {
    executeCurrentCommand();
  }

  if (currentPath.empty()) {
    state = VIRUSSTATE_IDLE;
  } else {
    state = VIRUSSTATE_MOVING;
  }
}

void Virus::executeCurrentCommand() {
  bool success = false;

  switch (command) {
  case VIRUSCOMMAND_EXPAND:
    if (owner == FACTION_ENEMY) {
      if (data->neutralCandidates.size() > 0) { 
	chooseDestination(data->neutralCandidates, data->parent);
      } else if (data->enemyCandidates.size() > 0) {
	chooseDestination(data->enemyCandidates, data->parent);
      }
    } else if (owner == FACTION_ALLY) {
      if (data->neutralCandidates.size() > 0) { 
	chooseDestination(data->neutralCandidates, data->parent);
      } else if (data->allyCandidates.size() > 0) {
	chooseDestination(data->allyCandidates, data->parent);
      }
    }
    success = true;
    break;

  case VIRUSCOMMAND_WAIT:
    if (owner == FACTION_ENEMY) {
      if (data->enemyCandidates.size() > 0) {
	chooseDestination(data->enemyCandidates, data->parent);
	success = true;
      }
    } else if (owner == FACTION_ALLY) {
      if (data->allyCandidates.size() > 0) {
	chooseDestination(data->allyCandidates, data->parent);
	success = true;
      }
    }    
    break;
    
  case VIRUSCOMMAND_ATTACK:
    if (owner == FACTION_ENEMY) {
      if (data->allyCandidates.size() > 0) { 
	chooseDestination(data->allyCandidates, data->parent);
      } else if (data->neutralCandidates.size() > 0) {
	chooseDestination(data->neutralCandidates, data->parent);
      } else if (data->enemyCandidates.size() > 0) {
	chooseDestination(data->enemyCandidates, data->parent);
      }
    } else if (owner == FACTION_ALLY) {
      if (data->enemyCandidates.size() > 0) { 
	chooseDestination(data->enemyCandidates, data->parent);
      } else if (data->neutralCandidates.size() > 0) {
	chooseDestination(data->neutralCandidates, data->parent);
      } else if (data->allyCandidates.size() > 0) {
	chooseDestination(data->allyCandidates, data->parent);
      }
    }
    success = true;
    break;

  case VIRUSCOMMAND_ADVANCE:
  case VIRUSCOMMAND_RETREAT:
    success = chooseDestination();
    break;
  }

  if (!success) {
    command = VIRUSCOMMAND_EXPAND;
  }
}

bool Virus::chooseDestination() {
  bool success = false;

  Tile *myTile = map->getTile(position);
  unsigned int myFrameStamp = myTile->getFrameStamp(owner);

  std::vector<Tile *> candidates;

  for (unsigned int i = 0; i < data->allyCandidates.size(); i++) {
    if (data->allyCandidates[i] != myTile) {
      unsigned int frameStamp = data->allyCandidates[i]->getFrameStamp(owner);
      
      if (command == VIRUSCOMMAND_ADVANCE) {
	if (frameStamp >= myFrameStamp) {
	  candidates.push_back(data->allyCandidates[i]);
	}
      } else if (command == VIRUSCOMMAND_RETREAT) {
	if (frameStamp <= myFrameStamp) {
	  candidates.push_back(data->allyCandidates[i]);
	}
      }
    }
  }

  for (unsigned int i = 0; i < data->neutralCandidates.size(); i++) {
    if (data->neutralCandidates[i] != myTile) {
      unsigned int frameStamp = 
	data->neutralCandidates[i]->getFrameStamp(owner);
      
      if (command == VIRUSCOMMAND_ADVANCE) {
	if (frameStamp >= myFrameStamp) {
	  candidates.push_back(data->neutralCandidates[i]);
	}
      } else if (command == VIRUSCOMMAND_RETREAT) {
	if (frameStamp <= myFrameStamp) {
	  candidates.push_back(data->neutralCandidates[i]);
	}
      }
    }
  }

  for (unsigned int i = 0; i < data->enemyCandidates.size(); i++) {
    if (data->enemyCandidates[i] != myTile) {
      unsigned int frameStamp = data->enemyCandidates[i]->getFrameStamp(owner);
      
      if (command == VIRUSCOMMAND_ADVANCE) {
	if (frameStamp >= myFrameStamp) {
	  candidates.push_back(data->enemyCandidates[i]);
	}
      } else if (command == VIRUSCOMMAND_RETREAT) {
	if (frameStamp <= myFrameStamp) {
	  candidates.push_back(data->enemyCandidates[i]);
	}
      }
    }
  }

  if (candidates.size() > 0) {
    chooseDestination(candidates, data->parent);
    success = true;
  }

  return success;
}

void Virus::chooseDestination(const std::vector<Tile *> &candidates,
			      const std::map<std::pair<int, int>, Tile *> &parent) {
  Mantis::RandomNumberGenerator *randomGenerator = 
    Mantis::RandomNumberGenerator::instance();
  
  rotateSpeed = randomGenerator->getRealNumberBetween(-4, 4);

  int choice = 
    randomGenerator->getIntNumberBetween(0, candidates.size() - 1);
  
  std::deque<Tile *> path;
  
  Tile *tile = candidates[choice];
  int tx = tile->hx;
  int ty = tile->hy;
  
  path.push_front(tile);
  
  std::map<std::pair<int, int>, Tile *>::const_iterator it;
  it = parent.find(std::make_pair(tx, ty));
  while (it != parent.end()) {
    tile = (*it).second;
    path.push_front(tile);
    
    tx = tile->hx;
    ty = tile->hy;
    
    it = parent.find(std::make_pair(tx, ty));
  }
  
  setPath(path, 0);
}

void Virus::getDestination() {
  Mantis::RandomNumberGenerator *randomGenerator = 
    Mantis::RandomNumberGenerator::instance();

  Vector tilePos = currentPath.front()->getPosition();
  double myRadius = virusData->getRadius();

  double r = randomGenerator->getRealNumberBetween(0.0, CELL_RADIUS - myRadius);
  double a = randomGenerator->getRealNumberBetween(0.0, 2.0 * M_PI);

  destination = Vector(tilePos.x + r * cos(a), 
		       tilePos.y + r * sin(a), 0.0);

  gotDestination = true;
}

bool Virus::reachedDestination() {
  bool reached = false;
  double distance = Vector(position, destination).length();

  if (distance <= getTakeoverCircle().getRadius()) {
    timeOnDestination++;
  }

  if (distance <= 1.0) {
    reached = true;
    timeOnDestination = 0;
  }

  if (timeOnDestination == 90) {
    reached = true;
    timeOnDestination = 0;
  }

  return reached;
}

std::vector<Entity *> Virus::getNearbyEntities(int distance) {
  std::vector<Entity *> entities;

  std::map<std::pair<int, int>, bool> visited;

  std::queue<SearchNode> search;
  Tile *source = map->getTile(position);
  search.push(SearchNode(source->hx, source->hy, 0));
  visited[std::make_pair(source->hx, source->hy)] = true;

  while (!search.empty()) {
    SearchNode cur = search.front();
    search.pop();

    Tile *tile = map->getTile(cur.x, cur.y);
    if (tile->hasEntities()) {
      std::list<Entity *> toAdd = tile->getEntities();

      entities.insert(entities.begin(), toAdd.begin(), toAdd.end());
    }

    if (cur.distance + 1 <= distance) {
      for (int i = 0; i < 6; i++) {
	int nx = cur.x + dirX[i];
	int ny = cur.y + dirY[i];
	
	if (!visited[std::make_pair(nx, ny)] &&
	    map->getTile(nx, ny)->getType() == TILE_EMPTY) {
	  search.push(SearchNode(nx, ny, cur.distance + 1));
	  visited[std::make_pair(nx, ny)] = true;
	}
      }
    }
  }

  entities.erase(find(entities.begin(), entities.end(), this));

  return entities;
}

void Virus::addToNotifyOnDeath(Entity *entity) {
  notifyOnDeath.push_back(entity);
}

void Virus::notifyDeath(Entity *deadEntity) {
  notifyOnDeath.erase(find(notifyOnDeath.begin(), notifyOnDeath.end(),
			   deadEntity));
}

void Virus::dealDamage(const DamageInfo &damage) {
  if (!isActive()) {
    return;
  }

  double modifier = 0.0;

  unsigned char proteinTypes = virusData->getProteinTypes();
  if (proteinTypes & damage.getDamageType()) {
    modifier = 1.0;
  }

  VirusColor color = virusData->getVirusColor();
  if (color == damage.getDamageColor()) {
    modifier *= 2.0;
  }

  if (modifier > 1.0) {
    flash = 45;
    flashColor = Color(1.0, 1.0, 1.0);
  } else if (modifier > 0.0) {
    flash = 22;
    flashColor = Color(1.0, 1.0, 1.0);
  }
  
  this->hp -= (modifier * damage.getDamageValue());
  if (hp <= 0.0) {
    hp = 0.0;
    dead = true;

    VisualEffect *effect = new ShockwaveEffect(position, 10.0, 60, 
					       virusData->getColor());
    map->addVisualEffect(effect);

    effect = new BubbleEffect(position, position, CELL_RADIUS / 3.0,
			      60, virusData->getColor());
    map->addVisualEffect(effect);
  }
}

void Virus::activate() {
  state = VIRUSSTATE_IDLE;
}

void Virus::goTo(Vector destination) {
  this->destination = destination;
}

Faction Virus::getOwnerFaction() {
  return owner;
}

bool Virus::tryTakeoverCell(Cell *cell) {
  bool success = false;

  if (!reproduceCooldown) {
    Mantis::RandomNumberGenerator *randomGenerator =
      Mantis::RandomNumberGenerator::instance();
    
    if (!cell->isTaken()) {
      unsigned char proteinTypes = virusData->getProteinTypes();
      if (proteinTypes & cell->getProteinType()) {
	double p = randomGenerator->getProbability();
	if (p < 0.75) {
	  takenCell = cell;
	  takenCell->notifyInvasion();
	  state = VIRUSSTATE_TAKINGCELL;

	  Tile *previous = map->getTile(position);
	  Tile *current = map->getTile(takenCell->getPosition());
	  previous->removeEntity(this);
	  current->addEntity(this);

	  goTo(takenCell->getPosition());
	  success = true;
	} else {
	  reproduceCooldown = 300;
	}
      }
    }
  }

  return success;
}

bool Virus::isActive() {
  return (state != VIRUSSTATE_INACTIVE &&
	  state != VIRUSSTATE_TAKINGCELL);
}

int Virus::getAIGroup() {
  return aiGroup;
}

void Virus::issueCommand(VirusCommand command) {
  if (isActive()) {
    this->command = command;
  }
}
