#ifndef _INC_MAP_HPP
#define _INC_MAP_HPP

#include <algorithm>
#include <vector>
#include <list>
#include <string>
#include <map>
#include <stack>
#include <iostream>
#include <queue>

#include <Engine/Mantis.hpp>

#include "Constants.hpp"
#include "Tile.hpp"
#include "Cell.hpp"
#include "Region.hpp"
#include "Entity.hpp"
#include "SearchNode.hpp"
#include "VisualEffect.hpp"
#include "AIData.hpp"

class Tile;

class Map {
private:
  int aiGameFrame;
  unsigned int logicGameFrame;

  Mantis::LogSystem *log;

  std::list<VisualEffect *> visualEffects;

  std::list<Entity *> queuedEntities;
  std::list<Entity *> entities;
  std::vector<std::vector<Tile *> > tiles;
  std::vector<Cell *> cells;
  std::vector<AIData *> aiData;
  Mantis::RandomNumberGenerator *randomGenerator;

  void prepareTiles(unsigned int width, unsigned int height);
  void carvePaths(double branchingFactor);
  void generateCells(double squareCells, double circleCells,
		     double triangleCells);

  void gatherSurroundingsInfo(AIData *data, Tile *tile);

  double hexRadius;

public:
  Map();
  ~Map();

  void generate(unsigned int width, unsigned int height,
		double branchingFactor,
		double squareCells, double circleCells,
		double triangleCells);

  void update();
  void render(Region view);

  void addEntity(Entity *entity);
  void addVisualEffect(VisualEffect *effect);

  Region getBoundary();

  Tile *getTile(int hx, int hy);
  Tile *getTile(const Vector &position);
  void findAllPathsTo(int x, int y, int maxDistance);
  int getAiGameFrame();
  void issueCommand(Faction faction, VirusCommand command);
};

#endif

