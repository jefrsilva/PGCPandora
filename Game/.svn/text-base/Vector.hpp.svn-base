#ifndef _INC_VECTOR_HPP
#define _INC_VECTOR_HPP

#include "Constants.hpp"

#include <cmath>

class Vector {
public:
  Vector();
  Vector(double x, double y, double z);
  Vector(Vector a, Vector b);
  ~Vector();

  double x;
  double y;
  double z;

  double length();
  Vector normalize();
  Vector translate(Vector t);
  double dot(Vector other);
  Vector cross(Vector other);
  Vector normal();
  Vector mult(double s);
};

#endif
