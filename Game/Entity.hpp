#ifndef _INC_ENTITY_HPP
#define _INC_ENTITY_HPP

#include "Region.hpp"
#include "BoundingCircle.hpp"
#include "Vector.hpp"

class Map;

class Entity {
protected:
  Map *map;
  Vector position;

public:
  virtual ~Entity() {};

  virtual void setMap(Map *map);
  virtual void setPosition(const Vector &position);
  virtual Vector getPosition();

  virtual bool isDead() = 0;
  virtual void update() = 0;
  virtual void render(const Region &view) = 0;

  virtual BoundingCircle getBoundingCircle() = 0;

  virtual void addToNotifyOnDeath(Entity *entity) = 0;
  virtual void notifyDeath(Entity *deadEntity) = 0;

  virtual bool isVirus();
};

#endif
