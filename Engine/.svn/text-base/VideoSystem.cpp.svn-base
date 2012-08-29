#include "VideoSystem.hpp"

namespace Mantis {
  VideoSystem *VideoSystem::_instance = 0;
  
  VideoSystem::VideoSystem() {
    log = LogSystem::instance();
    screen = 0;
    
    if (SDL_InitSubSystem(SDL_INIT_VIDEO) != 0) {
      std::cout << "Unable to start SDL video subsystem: \n" 
		<< SDL_GetError() << std::endl;
      
      exit(1);
    }
    
    SDL_GL_SetAttribute(SDL_GL_DOUBLEBUFFER, 1);

    screenshot = 0;
    screenPixels = 0;
  }
  
  VideoSystem::~VideoSystem() {
    if (screenshot) {
      SDL_FreeSurface(screenshot);
    }

    if (screenPixels) {
      delete screenPixels;
    }
  }
  
  VideoSystem *VideoSystem::instance() {
    if (!_instance) {
      _instance = new VideoSystem();
    }
    
    return _instance;
  }
  
  void VideoSystem::destroy() {
    if (_instance) {
      delete _instance;
      _instance = 0;
    }
  }

  void VideoSystem::setVideoMode(int width, int height, int depth, 
			       bool fullscreen) {
    log->output(LOG_ENGINE, "VideoSystem :: setVideoMode");

    this->width = width;
    this->height = height;
    this->depth = depth;
    this->fullscreen = fullscreen;
    
    if (fullscreen) {
      screen = SDL_SetVideoMode(width, height, depth, 
				SDL_OPENGL | SDL_FULLSCREEN);
    } else {
      screen = SDL_SetVideoMode(width, height, depth, 
				SDL_OPENGL);
    }
    
    if (!screen) {
      std::cout << "Unable to set video mode: " << SDL_GetError() << std::endl;
      
      exit(1);
    }

    screenPixels = new unsigned char[width * height * 4];
  }

  void VideoSystem::setWindowTitle(std::string title) {
    SDL_WM_SetCaption(title.c_str(), 0);
  }

  void VideoSystem::setOrthoView(double top, double left, 
				 double bottom, double right) {
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    glOrtho(left, right, bottom, top, -1.0, 1.0);    
  }

  void VideoSystem::flip() {
    SDL_GL_SwapBuffers();
  }

  void VideoSystem::saveScreenshot(std::string filename) {
    glReadPixels(0, 0, width, height, GL_RGBA, GL_UNSIGNED_BYTE, 
		 (void *)screenPixels);

    screenshot = 
      SDL_CreateRGBSurfaceFrom((void *)screenPixels, width, height, depth, 
			       width * 4, 
			       0x00000ff, 0x0000ff00, 0x00ff0000, 0xff000000);
    SDL_SaveBMP(screenshot, filename.c_str());
  }

  VideoSystemDestroyer::~VideoSystemDestroyer() {
    VideoSystem::destroy();
  }

  VideoSystemDestroyer videoSystemDestroyer;
}
