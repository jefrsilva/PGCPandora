#include "SquareProtein.hpp"

SquareProtein::SquareProtein(double length) {
  this->length = length;
  this->size = 0.25;
}

SquareProtein::~SquareProtein() {

}

void SquareProtein::render() {
  glLineWidth(1.0);
  
  glBegin(GL_LINES);
  glVertex3f(0.0, 0.0, 0.0);
  glVertex3f(0.0, length, 0.0);
  glEnd();
  
  glBegin(GL_QUADS);
  glVertex3f(-size / 2.0, length, 0.0);
  glVertex3f(size / 2.0, length, 0.0);
  glVertex3f(size / 2.0, length + size, 0.0); 
  glVertex3f(-size / 2.0, length + size, 0.0);
  glEnd();
}
