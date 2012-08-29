#ifndef _INC_ANTIBODY_HPP
#define _INC_ANTIBODY_HPP

#include "Vector.hpp"
#include "Region.hpp"
#include "BoundingCircle.hpp"
#include "Entity.hpp"
#include "DamageInfo.hpp"
#include "VisualEffect.hpp"
#include "DebrisEffect.hpp"
#include "Color.hpp"

class Virus;

class Antibody : public Entity {
protected:
  DamageInfo damage;
  Virus *target;
  double orientation;
  bool dead;
  int lifetime;

  Color color;
  
  void renderSquareAntibody(const Region &view);
  void renderCircleAntibody(const Region &view);
  void renderTriangleAntibody(const Region &view);

  void createDeathEffect();

public:
  Antibody(DamageInfo damage, Vector position, Virus *target, int frame);
  ~Antibody();

  bool isDead();
  void update();
  void render(const Region &view);
  void lowRender();

  BoundingCircle getBoundingCircle();

  void addToNotifyOnDeath(Entity *entity);
  void notifyDeath(Entity *deadEntity);
};

#endif
