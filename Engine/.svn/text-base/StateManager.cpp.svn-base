#include "StateManager.hpp"

namespace Mantis {
  StateManager *StateManager::_instance = 0;
  
  StateManager::StateManager() {
    if (SDL_InitSubSystem(SDL_INIT_TIMER) != 0) {
      std::cout << "Unable to start SDL timer subsystem: " 
		<< SDL_GetError() << std::endl;
      
      exit(1);
    }

    lastTime = SDL_GetTicks();
    elapsedTime = 0;

    currentState = 0;
  }
  
  StateManager::~StateManager() {
    while (!states.empty()) {
      State *state = states.top();
      delete state;
      states.pop();
    }
  }
  
  StateManager *StateManager::instance() {
    if (!_instance) {
      _instance = new StateManager();
    }
    
    return _instance;
  }
  
  void StateManager::destroy() {
    if (_instance) {
      delete _instance;
      _instance = 0;
    }
  }

  void StateManager::push(State *state) {
    states.push(state);
  }

  void StateManager::pop() {
    states.pop();
  }

  void StateManager::run() {
    LogSystem::instance()->output(LOG_ENGINE, "StateManager :: run");

    bool finished = false;
    bool capturing = false;
    int movieNumber = 0;
    int movieFrame = 0;

    frameNumber = 0;
    while (!finished) {
      if (states.empty()) {
	finished = true;
	continue;
      } else {
	currentState = states.top();
	if (!currentState->isRunning()) {
	  currentState->start();
	}
	if (currentState->isDone()) {
	  currentState->stop();
	  states.pop();
	  continue;
	}
      }

      SDL_Event event;
      while (SDL_PollEvent(&event)) {
	switch (event.type) {
	case SDL_KEYUP:
	  if (event.key.keysym.sym == SDLK_TAB) {
	    if (capturing) {
	      capturing = false;
	    } else {
	      movieNumber++;
	      movieFrame = 0;
	      capturing = true;
	    }
	  }
	case SDL_KEYDOWN:
	  if (event.key.keysym.sym == SDLK_ESCAPE) {
	    finished = true;
	  } else {
	    currentState->handleKeyboardEvent(&event);
	  }
	  break;

	case SDL_MOUSEMOTION:
	case SDL_MOUSEBUTTONUP:
	case SDL_MOUSEBUTTONDOWN:
	  currentState->handleMouseEvent(&event);
	  break;

	case SDL_QUIT:
	  finished = true;
	  break;
	}
      }

      unsigned int currentTime = SDL_GetTicks();
      elapsedTime += (currentTime - lastTime);
      lastTime = currentTime;
      
      bool updated = false;
      while (elapsedTime >= FRAME_DURATION[frameNumber]) {
	currentState->update();
	updated = true;

	if (!capturing) {
	  elapsedTime -= FRAME_DURATION[frameNumber];
	} else {
	  elapsedTime = 0;
	}
	frameNumber = (frameNumber + 1) % 3;
      }
      
      if (updated) {
	currentState->render();
	VideoSystem::instance()->flip();

	if (capturing) {
	  std::stringstream filename;
	  filename << "./movie/" 
		   << movieNumber << "_" << movieFrame++ << ".bmp";
	  
	  VideoSystem::instance()->saveScreenshot(filename.str());
	}
      }
    }
  }

  StateManagerDestroyer::~StateManagerDestroyer() {
    StateManager::destroy();
  }

  StateManagerDestroyer stateManagerDestroyer;
}

