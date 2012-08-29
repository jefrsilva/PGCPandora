#include "CircleProtein.hpp"

CircleProtein::CircleProtein(double length) {
  this->length = length;
  this->radius = 0.125;
}

CircleProtein::~CircleProtein() {

}

void CircleProtein::render() {
  glLineWidth(1.0);
  
  glBegin(GL_LINES);
  glVertex3f(0.0, 0.0, 0.0);
  glVertex3f(0.0, length, 0.0);
  glEnd();
  
  glBegin(GL_POLYGON);
  glVertex3f(0.0, length, 0.0);
  glVertex3f(radius * 0.7, length + radius - (radius * 0.7), 0.0);
  glVertex3f(radius, length + radius, 0.0); 
  glVertex3f(radius * 0.7, length + radius + (radius * 0.7), 0.0);
  glVertex3f(0.0, length + 2.0 * radius, 0.0);
  glVertex3f(-radius * 0.7, length + radius + (radius * 0.7), 0.0);
  glVertex3f(-radius, length + radius, 0.0);
  glVertex3f(-radius * 0.7, length + radius - (radius * 0.7), 0.0);
  glEnd();
}
