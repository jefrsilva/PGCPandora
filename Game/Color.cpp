#include "Color.hpp"

Color::Color() {
  this->r = 0.0;
  this->g = 0.0;
  this->b = 0.0;
  this->a = 1.0;
}

Color::Color(double r, double g, double b) {
  this->r = r;
  this->g = g;
  this->b = b;
  this->a = 1.0;
}

Color::Color(double r, double g, double b, double a) {
  this->r = r;
  this->g = g;
  this->b = b;
  this->a = a;
}

Color::~Color() {

}
