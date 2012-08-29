#ifndef _INC_MODELCACHE_HPP
#define _INC_MODELCACHE_HPP

#include <map>

#include <SDL/SDL.h>
#include <SDL/SDL_opengl.h>

class ModelCache {
private:
  static ModelCache *_instance;

  std::map<unsigned int, GLuint> displayListsShape;
  std::map<unsigned int, GLuint> displayListsCore;

  ModelCache();
  ~ModelCache();

public:
  static ModelCache *instance();
  static void destroy();

  void clear();
  bool exists(unsigned int id);

  void beginSaveShape(unsigned int id);
  void beginSaveCore(unsigned int id);
  void endSave();

  void renderShape(unsigned int id);
  void renderCore(unsigned int id);
};

class ModelCacheDestroyer {
public:
  ~ModelCacheDestroyer();
};

#endif
