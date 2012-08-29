#include "VirusCache.hpp"

VirusCache *VirusCache::_instance = 0;

VirusCache::VirusCache() {
  virusGenerator = new VirusGenerator();
}

VirusCache::~VirusCache() {
  clear();

  delete virusGenerator;
}

VirusCache *VirusCache::instance() {
  if (!_instance) {
    _instance = new VirusCache();
  }

  return _instance;
}

void VirusCache::destroy() {
  if (_instance) {
    delete _instance;
  }
}

void VirusCache::clear() {
  std::map<unsigned int, VirusData *>::iterator itVirusData;

  for (itVirusData = virusData.begin(); itVirusData != virusData.end();
       itVirusData++) {
    VirusData *data = (*itVirusData).second;
    delete data;
  }
  virusData.clear();

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

bool VirusCache::exists(unsigned int id) {
  bool found = true;
  std::map<unsigned int, VirusData *>::iterator it;

  it = virusData.find(id);

  if (it == virusData.end()) {
    found = false;
  }

  return found;
}

void VirusCache::generateVirus(unsigned int id) {
  VirusData *virus = virusGenerator->generateVirus(id);

  virusData[id] = virus;
  virus->buildDisplayLists();
}

VirusData *VirusCache::getVirusData(unsigned int id) {
  return virusData[id];
}

void VirusCache::beginSaveShape(unsigned int id) {
  GLuint listId = glGenLists(1);

  displayListsShape[id] = listId;

  glNewList(listId, GL_COMPILE);
}

void VirusCache::beginSaveCore(unsigned int id) {
  GLuint listId = glGenLists(1);

  displayListsCore[id] = listId;

  glNewList(listId, GL_COMPILE);
}

void VirusCache::endSave() {
  glEndList();
}

void VirusCache::renderShape(unsigned int id) {
  GLuint shapeListId = displayListsShape[id];

  glCallList(shapeListId);
}

void VirusCache::renderCore(unsigned int id) {
  GLuint coreListId = displayListsCore[id];

  glCallList(coreListId);
}

VirusCacheDestroyer::~VirusCacheDestroyer() {
  VirusCache::destroy();
}

VirusCacheDestroyer virusCacheDestroyer;
