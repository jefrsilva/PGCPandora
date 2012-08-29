#include "Tile.hpp"

unsigned int Tile::logicGameFrame = 0;

Tile::Tile(int hx, int hy, int type) {
  this->hx = hx;
  this->hy = hy;
  this->type = type;
  this->ownerFaction = 0;
  this->allyFrameStamp = 0;
  this->enemyFrameStamp = 0;

  cell = 0;

  hexRadius = CELL_RADIUS * sqrt(4.0 / 3.0);
}

Tile::~Tile() {
  if (cell) {
    delete cell;
    cell = 0;
  }
}

void Tile::setPosition(Vector position) {
  this->position = position;
}

Vector Tile::getPosition() {
  return position;
}

void Tile::setType(int type) {
  this->type = type;
}

int Tile::getType() {
  return type;
}

void Tile::setCell(Cell *cell) {
  this->cell = cell;
}

Cell *Tile::getCell() {
  return cell;
}

void Tile::addEntity(Entity *entity) {
  entities.push_back(entity);
}

void Tile::removeEntity(Entity *entity) {
  entities.erase(find(entities.begin(), entities.end(), entity));
}

void Tile::render(const Region &view) {
  double t = 1.0;
  if (view.zoom < 10.0) {
    t = 1.0 - ((10.0 - view.zoom) / 6.0);
  } else if (view.zoom == 4.0) {
    return;
  }
  
  glLoadIdentity();
  
  //if (entities.size() < 0) {
  //  glLineWidth(4.0);
  //
  //  glColor4f(0.5, 0.5, 1.0, 0.0);
  //} else {
  glLineWidth(1.0);
  
  glColor4f(0.75, 0.75, 0.75, t * 0.05);
  //}
  
  glBegin(GL_LINES);
  for (int k = 0; k < 6; k++) {
    int l = (k + 1) % 6;
    
    glVertex3f(position.x + hexRadius * cos(k * (M_PI / 3.0)),
	       position.y + hexRadius * sin(k * (M_PI / 3.0)),
	       0.0);
    glVertex3f(position.x + hexRadius * cos(l * (M_PI / 3.0)),
	       position.y + hexRadius * sin(l * (M_PI / 3.0)),
	       0.0);
  }
  glEnd();

  Faction faction = getOwnerFaction();
  if (faction != FACTION_NEUTRAL) {
    if (faction == FACTION_ENEMY) {
      double t = 
	(double)(ownerFaction - FACTION_LOWER) / 
	(double)(FACTION_MIN - FACTION_LOWER);

      glColor4f(0.75, 0.0, 0.0, t * 0.25);
    } else {
      double t = 
	(double)(ownerFaction - FACTION_UPPER) / 
	(double)(FACTION_MAX - FACTION_UPPER);

      glColor4f(0.0, 0.75, 0.0, t * 0.25);      
    }

    glBegin(GL_POLYGON);
    for (int k = 0; k < 6; k++) {
      glVertex3f(position.x + 0.95 * hexRadius * cos(k * (M_PI / 3.0)),
		 position.y + 0.95 * hexRadius * sin(k * (M_PI / 3.0)),
		 0.0);
    }
    glEnd();
  }
}

BoundingCircle Tile::getBoundingCircle() {
  return BoundingCircle(position, hexRadius);
}

bool Tile::hasEntities() {
  return !entities.empty();
}

std::list<Entity *> &Tile::getEntities() {
  return entities;
}

void Tile::notifyMovement(const std::deque<Tile *> &path, int delay) {
  std::list<Entity *>::iterator it;
  for (it = entities.begin(); it != entities.end(); it++) {
    Entity *entity = (*it);
    if (entity->isVirus()) {
      Virus *virus = (Virus *)entity;
      virus->setPath(path, delay);
    }
  }
}

Faction Tile::getOwnerFaction() {
  Faction faction = FACTION_NEUTRAL;

  if (ownerFaction < FACTION_LOWER) {
    faction = FACTION_ENEMY;
  } else if (ownerFaction > FACTION_UPPER) {
    faction = FACTION_ALLY;
  }

  return faction;
}

void Tile::changeOwnerFactionTo(int value, unsigned int frameStamp) {
  logicGameFrame = frameStamp + 1;

  if (value == FACTION_NEUTRAL &&
      ownerFaction != FACTION_MAX &&
      ownerFaction != FACTION_MIN) {
    if (ownerFaction > 0) {
      ownerFaction--;
    } else if (ownerFaction < 0) {
      ownerFaction++;
    }
  } else {
    if (value > 0 && ownerFaction < FACTION_MAX) {
      ownerFaction += value;
      if (ownerFaction >= FACTION_MAX) {
	ownerFaction = FACTION_MAX;
	allyFrameStamp = frameStamp;
      }
    }

    if (value < 0 && ownerFaction > FACTION_MIN) {
      ownerFaction += value;
      if (ownerFaction <= FACTION_MIN) {
	ownerFaction = FACTION_MIN;
	enemyFrameStamp = frameStamp;
      }
    }
  }
}

unsigned int Tile::getFrameStamp(Faction faction) {
  int frameStamp;

  if (getOwnerFaction() == faction) {
    if (faction == FACTION_ALLY) {
      frameStamp = allyFrameStamp;
    } else {
      frameStamp = enemyFrameStamp;
    }
  } else {
    frameStamp = logicGameFrame;
  }

  return frameStamp;
}
