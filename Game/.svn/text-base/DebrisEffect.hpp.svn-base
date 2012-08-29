#ifndef _INC_DEBRISEFFECT_HPP
#define _INC_DEBRISEFFECT_HPP

#include "VisualEffect.hpp"
#include "Region.hpp"
#include "BoundingCircle.hpp"
#include "Color.hpp"

#include <Engine/Mantis.hpp>

class DebrisEffect : public VisualEffect {
private:
  bool dead;

  Vector position;
  Vector start;
  Vector end;

  int finalDuration;
  int duration;

  int orientation;

  Color color;

public:
  DebrisEffect(Vector position, Vector destination, int orientation, 
	       int duration, Color color);
  ~DebrisEffect();

  bool isDead();
  void update();
  void render(const Region &view);

  BoundingCircle getBoundingCircle();
};

#endif
