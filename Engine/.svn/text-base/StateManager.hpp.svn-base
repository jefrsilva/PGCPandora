#ifndef _INC_STATEMANAGER_HPP
#define _INC_STATEMANAGER_HPP

#include "State.hpp"
#include "LogSystem.hpp"
#include "VideoSystem.hpp"

#include <SDL/SDL.h>

#include <stack>
#include <sstream>

namespace Mantis {
  const unsigned int FRAME_DURATION[] = {17, 17, 16};

  class StateManager {
  private:
    static StateManager *_instance;

    std::stack<State *> states;
    
    unsigned int frameNumber;
    unsigned int lastTime;
    unsigned int elapsedTime;
    
    StateManager();
    ~StateManager();

  public:
    State *currentState;

    static StateManager *instance();
    static void destroy();

    void push(State *state);
    void pop();

    void run();
  };

  class StateManagerDestroyer {
  public:
    ~StateManagerDestroyer();
  };
}

#endif
