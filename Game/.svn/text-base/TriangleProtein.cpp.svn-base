#include "TriangleProtein.hpp"

TriangleProtein::TriangleProtein(double length) {
  this->length = length;
  this->size = 0.25;
}

TriangleProtein::~TriangleProtein() {

}

void TriangleProtein::render() {
  glLineWidth(1.0);
  
  glBegin(GL_LINES);
  glVertex3f(0.0, 0.0, 0.0);
  glVertex3f(0.0, length, 0.0);
  glEnd();
  
  glBegin(GL_TRIANGLES);
  glVertex3f(-size / 1.5, length, 0.0);
  glVertex3f(size / 1.5, length, 0.0);
  glVertex3f(0.0, length + size, 0.0); 
  glEnd();
}
