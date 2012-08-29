#ifndef _INC_SHOCKWAVEEFFECT_HPP
#define _INC_SHOCKWAVEEFFECT_HPP

#include "VisualEffect.hpp"
#include "DebrisEffect.hpp"
#include "Color.hpp"

#include <Engine/Mantis.hpp>

#include <vector>

class ShockwaveEffect : public VisualEffect {
private:
  bool dead;

  Vector position;
  double finalSize;
  double size;
  int finalDuration;
  int duration;
  Color color;

  std::vector<VisualEffect *> debris;
  
public:
  ShockwaveEffect(Vector position, double size, int duration, Color color);
  ~ShockwaveEffect();

  bool isDead();
  void update();
  void render(const Region &view);

  BoundingCircle getBoundingCircle();
};

#endif

