#include "VirusFilter.hpp"
#include "Tile.hpp"

VirusFilter::VirusFilter() {

}

VirusFilter::~VirusFilter() {

}

void VirusFilter::setOwnerFaction(Faction faction) {
  this->ownerFaction = faction;
}

void VirusFilter::setPosition(Vector position) {
  this->position = position;
}

Vector VirusFilter::getPosition() {
  return position;
}

std::vector<Virus *> *VirusFilter::filter(const std::vector<Tile *> &tiles,
					  double range) {
  std::vector<Virus *> *viruses = new std::vector<Virus *>();

  for (unsigned int i = 0; i < tiles.size(); i++) {
    std::list<Entity *> &entityList = tiles[i]->getEntities();
    std::list<Entity *>::const_iterator it;
    for (it = entityList.begin(); it != entityList.end(); it++) {
      Entity *entity = (*it);
      if (entity->isVirus()) {
	Virus *virus = (Virus *)entity;
	if (virus->isActive() &&
	    virus->getOwnerFaction() * ownerFaction == FACTION_ENEMY) {
	  if (Vector(position, virus->getPosition()).length() <= range) {
	    viruses->push_back((Virus *)entity);
	  }
	}
      }
    }
  }

  sort(viruses->begin(), viruses->end(), SortByDistance(this));

  return viruses;
}

bool SortByDistance::operator()(Virus *a, Virus *b) const {
  double distanceToA = Vector(self->getPosition(), a->getPosition()).length();
  double distanceToB = Vector(self->getPosition(), b->getPosition()).length();
  return (distanceToA < distanceToB);
}
