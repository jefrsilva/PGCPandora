#include "GameCamera.hpp"

GameCamera::GameCamera() {
  windowWidth = 0.0;
  windowHeight = 0.0;

  position = Vector(0.0, 0.0, 0.0);
  ratio = 0.0;
  zoom = 0.0;
  zoomingTo = 0.0;

  stepZoomIn = 0;
  stepZoomOut = 0;
  zoomingIn = false;
  zoomingOut = false;
  curZoomVel = 0.0;
  tgtZoomVel = 0.0;

  movingLeft = false;
  curLeftVel = 0.0;
  tgtLeftVel = 0.0;

  movingRight = false;
  curRightVel = 0.0;
  tgtRightVel = 0.0;

  movingUp = false;
  curUpVel = 0.0;
  tgtUpVel = 0.0;

  movingDown = false;
  curDownVel = 0.0;
  tgtDownVel = 0.0;
}

GameCamera::~GameCamera() {

}

void GameCamera::setWindowSize(double width, double height) {
  windowWidth = width;
  windowHeight = height;
}

double GameCamera::getWindowWidth() {
  return windowWidth;
}

double GameCamera::getWindowHeight() {
  return windowHeight;
}

Vector GameCamera::convertScreenToWorld(Vector position) {
  Vector world;

  Region region = getViewingRegion();
  
  world.x = (position.x / (windowWidth - 1.0));
  world.x = region.x + world.x * region.width;
  
  world.y = 1.0 - (position.y / (windowHeight - 1.0));
  world.y = (region.y - region.height) + world.y * region.height;

  return world;
}

void GameCamera::setPosition(Vector position) {
  this->position = position;
}

void GameCamera::setZoom(double zoom) {
  this->zoom = zoom;
}

void GameCamera::setMovingLeft(bool value) {
  movingLeft = value;
}

void GameCamera::setMovingRight(bool value) {
  movingRight = value;
}

void GameCamera::setMovingUp(bool value) {
  movingUp = value;
}

void GameCamera::setMovingDown(bool value) {
  movingDown = value;
}

void GameCamera::setZoomingIn(bool value) {
  zoomingIn = value;
}

void GameCamera::setZoomingOut(bool value) {
  zoomingOut = value;
}

void GameCamera::increaseZoom() {
  stepZoomIn = 1;
}

void GameCamera::decreaseZoom() {
  stepZoomOut = 1;
}

void GameCamera::update() {
  double zoomSpeed = 0.5;

  if (zoomingIn || stepZoomIn) {
    zoomingTo += zoomSpeed;
    stepZoomIn--;
    if (stepZoomIn < 0) {
      stepZoomIn = 0;
    }
  } else if (zoomingOut || stepZoomOut) {
    zoomingTo -= zoomSpeed;
    stepZoomOut--;
    if (stepZoomOut < 0) {
      stepZoomOut = 0;
    }
  } else {
    curZoomVel = 0.0;
  }

  if (zoomingTo > 16.0) {
    zoomingTo = 16.0;
  } else if (zoomingTo < 4.0) {
    zoomingTo = 4.0;
  }

  if (zoom < zoomingTo) {
    double distance = zoomingTo - zoom;
    if (distance > 0.5) {
      curZoomVel = 0.2;
    } else if (distance > 0.3) {
      curZoomVel = 0.1;
    } else if (distance > 0.1) { 
      curZoomVel = 0.05;
    } else {
      curZoomVel = 0.0;
      zoomingTo = zoom;
    }
  }

  if (zoom > zoomingTo) {
    double distance = zoom - zoomingTo;
    if (distance > 0.5) {
      curZoomVel = -0.2;
    } else if (distance > 0.3) {
      curZoomVel = -0.1;
    } else if (distance > 0.1) { 
      curZoomVel = -0.05;
    } else {
      curZoomVel = 0.0;
      zoomingTo = zoom;
    }
  }

  zoom += curZoomVel;
  if (zoom > 16.0) {
    zoom = 16.0;
  }
  if (zoom < 4.0) {
    zoom = 4.0;
  }

  double zoomFactor = getZoomFactor();

  double moveSpeed = 15.0 / zoomFactor;
  double accel = 1.0 / zoomFactor;

  if (movingLeft) {
    tgtLeftVel = -moveSpeed;
  } else {
    tgtLeftVel = 0.0;
  }
  if (movingRight) {
    tgtRightVel = moveSpeed;
  } else {
    tgtRightVel = 0.0;
  }
  if (movingUp) {
    tgtUpVel = moveSpeed;
  } else {
    tgtUpVel = 0.0;
  }
  if (movingDown) {
    tgtDownVel = -moveSpeed;
  } else {
    tgtDownVel = 0.0;
  }

  curLeftVel = calcSpeed(curLeftVel, tgtLeftVel, accel);
  curRightVel = calcSpeed(curRightVel, tgtRightVel, accel);
  curUpVel = calcSpeed(curUpVel, tgtUpVel, accel); 
  curDownVel = calcSpeed(curDownVel, tgtDownVel, accel);

  position = position.translate(Vector(curLeftVel + curRightVel,
				       curUpVel + curDownVel,
				       0.0));

  Region view = getViewingRegion();

  if (view.x < boundary.x) {
    position.x += (boundary.x - view.x);
  } else if (view.x + view.width >
	     boundary.x + boundary.width) {
    position.x -= (view.x + view.width -
		   boundary.x - boundary.width);
  }
  
  
  if (view.y > boundary.y) {
    position.y -= (view.y - boundary.y);
  } else if (view.y - view.height < 
	     boundary.y - boundary.height) {
    position.y += (boundary.y - boundary.height -
		   view.y + view.height);
  }
}
  
double GameCamera::calcSpeed(double curSpeed, double tgtSpeed, double accel) {
  double newSpeed = curSpeed;

  if (curSpeed > tgtSpeed) {
    newSpeed -= accel;
    if (newSpeed < tgtSpeed) {
      newSpeed = tgtSpeed;
    }
  } else if (curSpeed < tgtSpeed) {
    newSpeed += accel;
    if (newSpeed > tgtSpeed) {
      newSpeed = tgtSpeed;
    }    
  }  

  return newSpeed;
}

Region GameCamera::getViewingRegion() {
  double zoomFactor = getZoomFactor();

  Region region = Region(position.x - (windowWidth / 2.0) / zoomFactor, 
			 position.y + (windowHeight / 2.0) / zoomFactor, 
			 windowWidth / zoomFactor, windowHeight / zoomFactor,
			 zoom);

  return region;
}

double GameCamera::getZoomFactor() {
  double zoomFactor = pow(1.25, zoom);

  return zoomFactor;
}

void GameCamera::setBoundary(Region boundary) {
  this->boundary = boundary;

  double cx = (2.0 * boundary.x + boundary.width) / 2.0;
  double cy = (2.0 * boundary.y - boundary.height) / 2.0;

  this->position = Vector(cx, cy, 0.0);
}
