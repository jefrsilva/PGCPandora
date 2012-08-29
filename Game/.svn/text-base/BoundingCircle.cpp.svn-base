#include "BoundingCircle.hpp"

BoundingCircle::BoundingCircle(Vector center, double radius) {
  this->center = center;
  this->radius = radius;
}

BoundingCircle::~BoundingCircle() {

}

Vector BoundingCircle::getCenter() const {
  return center;
}

double BoundingCircle::getRadius() const {
  return radius;
}

bool BoundingCircle::overlaps(BoundingCircle circle) {
  bool overlap = false;
  double distance = Vector(center, circle.getCenter()).length();

  if (distance < radius + circle.getRadius()) {
    overlap = true;
  }
  
  return overlap;
}



