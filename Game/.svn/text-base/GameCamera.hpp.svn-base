#ifndef _INC_GAMECAMERA_HPP
#define _INC_GAMECAMERA_HPP

#include "Vector.hpp"
#include "Region.hpp"

#include <iostream>

class GameCamera {
private:
  Region boundary;

  double windowWidth;
  double windowHeight;

  double ratio;
  Vector position;
  double zoom;
  double zoomingTo;

  int stepZoomIn;
  int stepZoomOut;
  bool zoomingIn;
  bool zoomingOut;
  double curZoomVel;
  double tgtZoomVel;  

  bool movingLeft;
  double curLeftVel;
  double tgtLeftVel;
  
  bool movingRight;
  double curRightVel;
  double tgtRightVel;

  bool movingUp;
  double curUpVel;
  double tgtUpVel;

  bool movingDown;
  double curDownVel;
  double tgtDownVel;

  double calcSpeed(double curSpeed, double tgtSpeed, double accel);
  double getZoomFactor();

public:
  GameCamera();
  ~GameCamera();

  void setWindowSize(double width, double height);
  double getWindowWidth();
  double getWindowHeight();

  Vector convertScreenToWorld(Vector position);

  void setPosition(Vector position);
  void setZoom(double zoom);

  void setMovingLeft(bool value);
  void setMovingRight(bool value);
  void setMovingUp(bool value);
  void setMovingDown(bool value);

  void setZoomingIn(bool value);
  void setZoomingOut(bool value);

  void increaseZoom();
  void decreaseZoom();

  void update();

  Region getViewingRegion();
  void setBoundary(Region boundary);
};

#endif

