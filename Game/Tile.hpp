#ifndef _INC_TILE_HPP
#define _INC_TILE_HPP

#include <list>
#include <deque>

#include "Entity.hpp"
#include "Cell.hpp"
#include "Vector.hpp"
#include "BoundingCircle.hpp"
#include "Virus.hpp"

class Tile {
private:
  static unsigned int logicGameFrame;

  Vector position;
  int type;
  Cell *cell;
  double hexRadius;

  int ownerFaction;
  unsigned int allyFrameStamp;
  unsigned int enemyFrameStamp;

  std::list<Entity *> entities;

public:
  int hx, hy;

  Tile(int hx, int hy, int type);
  ~Tile();

  void setPosition(Vector position);
  Vector getPosition();

  void setType(int type);
  int getType();
  
  void setCell(Cell *cell);
  Cell *getCell();

  void addEntity(Entity *entity);
  void removeEntity(Entity *entity);

  void render(const Region &view);
  BoundingCircle getBoundingCircle();

  bool hasEntities();
  std::list<Entity *> &getEntities();
  void notifyMovement(const std::deque<Tile *> &path, int delay);

  Faction getOwnerFaction();
  void changeOwnerFactionTo(int value, unsigned int frameStamp);
  unsigned int getFrameStamp(Faction faction);
};

#endif
