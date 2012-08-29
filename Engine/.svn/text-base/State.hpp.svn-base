#ifndef _INC_STATE_HPP
#define _INC_STATE_HPP

#include <SDL/SDL.h>
#include <SDL/SDL_opengl.h>

namespace Mantis {
  class State {
  public:
    virtual ~State() {};
    
    virtual void start() = 0;
    virtual void update() = 0;
    virtual void render() = 0;
    virtual void stop() = 0;

    virtual void handleKeyboardEvent(SDL_Event *event) = 0;
    virtual void handleMouseEvent(SDL_Event *event) = 0;

    virtual bool isRunning() = 0;
    virtual bool isDone() = 0;
  };
}

#endif

