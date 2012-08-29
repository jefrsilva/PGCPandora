#include "ModelCache.hpp"

ModelCache *ModelCache::_instance = 0;

ModelCache::ModelCache() {

}

ModelCache::~ModelCache() {
  clear();
}

ModelCache *ModelCache::instance() {
  if (!_instance) {
    _instance = new ModelCache();
  }

  return _instance;
}

void ModelCache::destroy() {
  if (_instance) {
    delete _instance;
  }
}

void ModelCache::clear() {
  std::map<unsigned int, GLuint>::iterator it;

  for (it = displayListsShape.begin(); it != displayListsShape.end(); it++) {
    std::pair<unsigned int, GLuint> p = *it;
    glDeleteLists(p.second, 1);
  }
  displayListsShape.clear();

  for (it = displayListsCore.begin(); it != displayListsCore.end(); it++) {
    std::pair<unsigned int, GLuint> p = *it;
    glDeleteLists(p.second, 1);
  }
  displayListsCore.clear();
}

bool ModelCache::exists(unsigned int id) {
  bool found = true;
  std::map<unsigned int, GLuint>::iterator it;

  it = displayListsShape.find(id);

  if (it == displayListsShape.end()) {
    found = false;
  }

  return found;
}

void ModelCache::beginSaveShape(unsigned int id) {
  GLuint listId = glGenLists(1);

  displayListsShape[id] = listId;

  glNewList(listId, GL_COMPILE);
}

void ModelCache::beginSaveCore(unsigned int id) {
  GLuint listId = glGenLists(1);

  displayListsCore[id] = listId;

  glNewList(listId, GL_COMPILE);
}

void ModelCache::endSave() {
  glEndList();
}

void ModelCache::renderShape(unsigned int id) {
  GLuint shapeListId = displayListsShape[id];

  glCallList(shapeListId);
}

void ModelCache::renderCore(unsigned int id) {
  GLuint coreListId = displayListsCore[id];

  glCallList(coreListId);
}

ModelCacheDestroyer::~ModelCacheDestroyer() {
  ModelCache::destroy();
}

ModelCacheDestroyer modelCacheDestroyer;
