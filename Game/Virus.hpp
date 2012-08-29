#ifndef _INC_VIRUS_HPP
#define _INC_VIRUS_HPP

#include "VirusCache.hpp"

#include "Constants.hpp"
#include "Entity.hpp"
#include "BoundingCircle.hpp"
#include "Region.hpp"
#include "Vector.hpp"
#include "SearchNode.hpp"
#include "Antibody.hpp"
#include "DamageInfo.hpp"
#include "AIData.hpp"

#include <vector>
#include <string>
#include <iostream>
#include <stack>
#include <queue>
#include <deque>
#include <map>

#include <Engine/Mantis.hpp>

class Map;
class Tile;
class VirusFilter;
class Cell;

class Virus : public Entity {
private:
  static int currentAiGroup;
  
  Faction owner;
  VirusCache *cache;
  VirusData *virusData;

  std::vector<Entity *> notifyOnDeath;

  std::deque<Tile *> currentPath;

  unsigned int id;

  VirusState state;
  VirusCommand command;

  Vector speed;

  double orientation;
  double rotateSpeed;

  bool dead;

  bool gotDestination;
  Vector destination;

  int frame;
  int aiGroup;
  int moveDelay;
  int timeOnDestination;

  double hp;
  int attackCooldown;

  int flash;
  Color flashColor;

  int reproduceCooldown;
  Cell *takenCell;

  AIData *data;

  void getDestination();
  bool reachedDestination();
  bool chooseDestination();
  void chooseDestination(const std::vector<Tile *> &candidates,
			 const std::map<std::pair<int, int>, Tile *> &parent);
  
  std::vector<Entity *> getNearbyEntities(int distance);

public:
  Virus(Faction faction, unsigned int id, bool active);
  ~Virus();
  
  bool isDead();
  void update();
  void render(const Region &view);

  void setOrientation(double orientation);
  double getOrientation();
  void setSpeed(Vector speed);
  void setRotateSpeed(double speed);

  BoundingCircle getBoundingCircle();
  BoundingCircle getTakeoverCircle();

  void addToNotifyOnDeath(Entity *entity);
  void notifyDeath(Entity *deadEntity);
  
  bool isVirus();

  void clearPath();
  void setPath(const std::deque<Tile *> &path, int moveDelay);

  void dealDamage(const DamageInfo &damage);

  void activate();
  void goTo(Vector destination);

  Faction getOwnerFaction();
  void executeCurrentCommand();

  bool tryTakeoverCell(Cell *cell);
  bool isActive();

  void setAIData(AIData *data);
  void updateAI();
  int getAIGroup();

  void issueCommand(VirusCommand command);
};

#endif

