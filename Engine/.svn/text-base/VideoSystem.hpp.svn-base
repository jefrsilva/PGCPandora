#ifndef _INC_VIDEOSYSTEM_HPP
#define _INC_VIDEOSYSTEM_HPP

#include "LogSystem.hpp"

#include <SDL/SDL.h>
#include <SDL/SDL_opengl.h>

#include <iostream>
#include <string>

namespace Mantis {
  class VideoSystem {
  private:
    static VideoSystem *_instance;
    
    LogSystem *log;

    int width;
    int height;
    int depth;
    bool fullscreen;
    
    SDL_Surface *screen;
    SDL_Surface *screenshot;
    unsigned char *screenPixels;
    
    VideoSystem();
    ~VideoSystem();

  public:
    static VideoSystem *instance();
    static void destroy();

    void setVideoMode(int width, int height, int depth, bool fullscreen);
    void setWindowTitle(std::string title);
    void setOrthoView(double top, double left, double bottom, double right);
    void flip();
    void saveScreenshot(std::string filename);
  };

  class VideoSystemDestroyer {
  public:
    ~VideoSystemDestroyer();
  };
}

#endif
