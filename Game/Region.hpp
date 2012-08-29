#ifndef _INC_REGION_HPP
#define _INC_REGION_HPP

#include "Vector.hpp"
#include "BoundingCircle.hpp"

class Region {
public:
  double x;
  double y;
  double width;
  double height;
  double zoom;
 
  Region();
  Region(double x, double y, double width, double height);
  Region(double x, double y, double width, double height, double zoom);
  ~Region();

  bool contains(const Vector &position) const;
  bool contains(const BoundingCircle &circle) const;
};

#endif


