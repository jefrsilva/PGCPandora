#ifndef _INC_BUBBLEEFFECT_HPP
#define _INC_BUBBLEEFFECT_HPP

#include "VisualEffect.hpp"
#include "Region.hpp"
#include "BoundingCircle.hpp"
#include "Color.hpp"

#include <Engine/Mantis.hpp>

class BubbleEffect : public VisualEffect {
private:
  bool dead;

  Vector position;
  Vector start;
  Vector end;

  int finalDuration;
  int duration;

  double size;
  double finalSize;

  Color color;

public:
  BubbleEffect(Vector position, Vector destination, double size, 
	       int duration, Color color);
  ~BubbleEffect();

  bool isDead();
  void update();
  void render(const Region &view);

  BoundingCircle getBoundingCircle();
};

#endif
