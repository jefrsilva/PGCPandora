#ifndef _INC_AIDATA_HPP
#define _INC_AIDATA_HPP

#include <vector>
#include <map>

class Entity;
class Tile;

class AIData {
public:
  AIData() {};
  ~AIData() {};

  std::vector<Tile *> nearbyEntities;
  std::vector<Tile *> allyCandidates;
  std::vector<Tile *> neutralCandidates;
  std::vector<Tile *> enemyCandidates;

  std::map<std::pair<int, int>, Tile *> parent;
};

#endif
