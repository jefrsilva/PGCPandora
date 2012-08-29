#ifndef _INC_VIRUSFILTER_HPP
#define _INC_VIRUSFILTER_HPP

#include "Entity.hpp"
#include "Virus.hpp"
#include "Vector.hpp"

#include <vector>
#include <algorithm>

class Entity;
class Virus;

class VirusFilter {
private:
  Vector position;
  Faction ownerFaction;

public:
  VirusFilter();
  ~VirusFilter();

  void setOwnerFaction(Faction faction);
  void setPosition(Vector position);
  Vector getPosition();

  std::vector<Virus *> *filter(const std::vector<Tile *> &tiles,
			       double range);
};

class SortByDistance {
private:
  VirusFilter *self;
  
public:
  SortByDistance(VirusFilter *_self) : self(_self) {};
  
  bool operator ()(Virus *a, Virus *b) const;
};

#endif
