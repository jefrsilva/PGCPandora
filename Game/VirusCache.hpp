#ifndef _INC_VIRUSCACHE_HPP
#define _INC_VIRUSCACHE_HPP

class VirusData;
class VirusGenerator;

#include "VirusGenerator.hpp"

#include <map>

#include <SDL/SDL.h>
#include <SDL/SDL_opengl.h>

class VirusCache {
private:
  static VirusCache *_instance;
  VirusGenerator *virusGenerator;

  std::map<unsigned int, VirusData *> virusData;
  std::map<unsigned int, GLuint> displayListsShape;
  std::map<unsigned int, GLuint> displayListsCore;

  VirusCache();
  ~VirusCache();

public:
  static VirusCache *instance();
  static void destroy();

  void clear();
  bool exists(unsigned int id);

  void generateVirus(unsigned int id);

  VirusData *getVirusData(unsigned int id);

  void beginSaveShape(unsigned int id);
  void beginSaveCore(unsigned int id);
  void endSave();

  void renderShape(unsigned int id);
  void renderCore(unsigned int id);
};

class VirusCacheDestroyer {
public:
  ~VirusCacheDestroyer();
};

#endif
