#ifndef _INC_CELL_HPP
#define _INC_CELL_HPP

#include "ModelCache.hpp"

#include "Constants.hpp"
#include "Region.hpp"
#include "BoundingCircle.hpp"
#include "Vector.hpp"
#include "Protein.hpp"
#include "SquareProtein.hpp"
#include "CircleProtein.hpp"
#include "TriangleProtein.hpp"
#include "BubbleEffect.hpp"

#include <Engine/Mantis.hpp>

#include <vector>
#include <deque>

class Map;
class Virus;

class Cell {
private:
  static double lastZoom;

  bool dead;
  Map *map;
  ModelCache *cache;
  ModelId id;

  CellState state;
  Faction cloneFaction;
  unsigned int cloneId;
 
  std::vector<Vector> shape;
  std::vector<Vector> core;
  Vector position;
  double orientation;
  double rotateSpeed;

  ProteinType proteinType;

  int frame;
  unsigned int cloningTime;
  unsigned int cloningCooldown;
  unsigned int numClones;

  unsigned int deadCounter;

  std::vector<Virus *> viruses;

  void buildDisplayLists(unsigned int id);

public:
  Cell(ProteinType proteinType, Vector position);
  ~Cell();

  bool isDead();

  void setPosition(const Vector &position);
  Vector getPosition();
  void setOrientation(double orientation);
  void setRotateSpeed(double rotateSpeed);

  ProteinType getProteinType();

  void update();
  void render(Region view);

  BoundingCircle getBoundingCircle();

  void setMap(Map *map);
  void notifyInvasion();
  void startCloning(Faction faction, unsigned int id);

  bool isTaken();
};

#endif
