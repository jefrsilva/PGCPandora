#include "Entity.hpp"
#include "Map.hpp"
#include "Tile.hpp"

void Entity::setMap(Map *map) {
  this->map = map;
}

void Entity::setPosition(const Vector &position) {
  if (map) {
    Tile *previous = map->getTile(this->position);
    Tile *current = map->getTile(position);

    this->position = position;
    
    if (previous != current) {
      previous->removeEntity(this);
      current->addEntity(this);
    }
  } else {
    this->position = position;
  }
}

Vector Entity::getPosition() {
  return position;
}

bool Entity::isVirus() {
  return false;
}
