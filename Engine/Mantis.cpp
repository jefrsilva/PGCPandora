#include "Mantis.hpp"

namespace Mantis {
  void initialize() {
    if (SDL_Init(NULL) != 0) {
      std::cout << "Unable to start SDL: " 
		<< SDL_GetError() << std::endl;
      
      exit(1);
    }
  }

  void shutdown() {
    SDL_Quit();
  }
}
