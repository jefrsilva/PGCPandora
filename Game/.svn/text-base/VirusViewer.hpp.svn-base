#ifndef _INC_VIRUSVIEWER_HPP
#define _INC_VIRUSVIEWER_HPP

#include <Engine/Mantis.hpp>

#include "Entity.hpp"
#include "Virus.hpp"
#include "Cell.hpp"
#include "Map.hpp"
#include "Region.hpp"
#include "GameCamera.hpp"
#include "Tile.hpp"

#include <vector>
#include <stack>

class VirusViewer : public Mantis::State {
private:
  bool running;
  bool done;
  bool paused;

  Mantis::RandomNumberGenerator *randomGenerator;

  Map *map;
  GameCamera *camera;

public:
  VirusViewer();
  ~VirusViewer();

  void start();
  void update();
  void render();
  void stop();

  void handleKeyboardEvent(SDL_Event *event);
  void handleMouseEvent(SDL_Event *event);

  bool isRunning();
  bool isDone();

  void debugCreateVirus(Vector position);
  void debugMove(Vector position);
};

#endif

