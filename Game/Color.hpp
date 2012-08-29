#ifndef _INC_COLOR_HPP
#define _INC_COLOR_HPP

class Color {
public:
  Color();
  Color(double r, double g, double b);
  Color(double r, double g, double b, double a);
  ~Color();

  double r;
  double g;
  double b;
  double a;
};

#endif
