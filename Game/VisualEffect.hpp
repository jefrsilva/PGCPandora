#ifndef _INC_VISUALEFFECT_HPP
#define _INC_VISUALEFFECT_HPP

#include "Region.hpp"
#include "BoundingCircle.hpp"

class VisualEffect {
public:
  virtual ~VisualEffect() {};

  virtual bool isDead() = 0;
  virtual void update() = 0;
  virtual void render(const Region &view) = 0;

  virtual BoundingCircle getBoundingCircle() = 0;
};

#endif

