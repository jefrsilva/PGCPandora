#ifndef _INC_BOUNDINGCIRCLE_HPP
#define _INC_BOUNDINGCIRCLE_HPP

#include "Vector.hpp"

class BoundingCircle {
private:
  Vector center;
  double radius;

public:
  BoundingCircle(Vector center, double radius);
  ~BoundingCircle();

  Vector getCenter() const;
  double getRadius() const;
  bool overlaps(BoundingCircle circle);
};

#endif
