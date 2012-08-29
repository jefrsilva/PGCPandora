#include "Region.hpp"

Region::Region() {
  this->x = 0.0;
  this->y = 0.0;
  this->width = 0.0;
  this->height = 0.0;
  this->zoom = 0.0;
}

Region::Region(double x, double y, double width, double height) {
  this->x = x;
  this->y = y;
  this->width = width;
  this->height = height;
}

Region::Region(double x, double y, double width, double height, 
	       double zoom) {
  this->x = x;
  this->y = y;
  this->width = width;
  this->height = height;
  this->zoom = zoom;
}

Region::~Region() {

}

bool Region::contains(const Vector &position) const {
  bool result = false;

  if (x <= position.x && position.x <= x + width &&
      y - height <= position.y && position.y <= y) {
    result = true;
  }

  return result;
}

bool Region::contains(const BoundingCircle &circle) const {
  bool result = true;

  Vector center = circle.getCenter();
  double radius = circle.getRadius();

  double top = center.y + radius;
  double bottom = center.y - radius;
  double left = center.x - radius;
  double right = center.x + radius;

  if (top < y - height || bottom > y ||
      right < x || left > x + width) {
    result = false;
  }

  return result;
}
