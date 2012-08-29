#include "VirusViewer.hpp"

VirusViewer::VirusViewer() {
  running = false;
  done = false;
  paused = false;

  randomGenerator = Mantis::RandomNumberGenerator::instance();
  randomGenerator->setSeed(SDL_GetTicks());

  map = new Map();
  map->generate(50, 40, 0.075, 0.27, 0.27, 0.27);
  
  camera = new GameCamera();
  camera->setWindowSize(1024.0, 768.0);
  camera->setBoundary(map->getBoundary());
}

VirusViewer::~VirusViewer() {
  delete map;
  delete camera;
} 

void VirusViewer::start() {
  running = true;
  done = false;

  glPolygonMode(GL_FRONT, GL_FILL);

  glEnable(GL_BLEND);
  glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);

  glClearColor(0.0, 0.0, 0.0, 0.0);
  glViewport(0, 0, 1024, 768);
  glClear(GL_COLOR_BUFFER_BIT);
}

void VirusViewer::update() {
  if (!paused) {
    map->update();
  }
  camera->update();
}

void VirusViewer::render() {
  glClearColor(0.0, 0.0, 0.0, 0.0);
  glViewport(0, 0, 1024.0, 768.0);
  glClear(GL_COLOR_BUFFER_BIT);

  Region region = camera->getViewingRegion();

  Mantis::VideoSystem::instance()->setOrthoView(region.y, 
						region.x,
						region.y - region.height,
						region.x + region.width);

  glMatrixMode(GL_MODELVIEW);
  glLoadIdentity();

  map->render(region);
 
  glLoadIdentity();

  glColor4f(0.5, 0.5, 1.0, 0.4);
  glBegin(GL_TRIANGLE_FAN);
  glVertex3f(region.x + region.width / 2.0,
	     region.y - region.height / 2.0,
	     0.0);

  glColor4f(0.0, 0.0, 0.0, 1.0);
  double dAngle = 2.0 * M_PI / 16.0;
  double radius = 1.30 * (region.width / 2.0);
  for (int i = 0; i < 17; i++) {
    int j = (i % 16);

    Vector point = 
      Vector((region.x + region.width / 2.0) + cos(dAngle * j) * radius,
	     (region.y - region.height / 2.0) + sin(dAngle * j) * radius,
	     0.0);
    
    glVertex3f(point.x, point.y, 0.0);
  }
  glEnd();
}

void VirusViewer::stop() {
  running = false;
  done = false;
}

void VirusViewer::handleKeyboardEvent(SDL_Event *event) {
  switch (event->type) {
  case SDL_KEYUP:
    if (event->key.keysym.sym == SDLK_UP) {
      camera->setMovingUp(false);
    } else if (event->key.keysym.sym == SDLK_RIGHT) {
      camera->setMovingRight(false);
    } else if (event->key.keysym.sym == SDLK_DOWN) {
      camera->setMovingDown(false);
    } else if (event->key.keysym.sym == SDLK_LEFT) {
      camera->setMovingLeft(false);
    } else if (event->key.keysym.sym == SDLK_PAGEUP) {
      camera->setZoomingIn(false);
    } else if (event->key.keysym.sym == SDLK_PAGEDOWN) {
      camera->setZoomingOut(false);
    } else if (event->key.keysym.sym == SDLK_a) {
      map->issueCommand(FACTION_ALLY, VIRUSCOMMAND_ATTACK);
    } else if (event->key.keysym.sym == SDLK_w) {
      map->issueCommand(FACTION_ALLY, VIRUSCOMMAND_WAIT);
    } else if (event->key.keysym.sym == SDLK_e) {
      map->issueCommand(FACTION_ALLY, VIRUSCOMMAND_EXPAND);    
    } else if (event->key.keysym.sym == SDLK_d) {
      map->issueCommand(FACTION_ALLY, VIRUSCOMMAND_ADVANCE);
    } else if (event->key.keysym.sym == SDLK_r) {
      map->issueCommand(FACTION_ALLY, VIRUSCOMMAND_RETREAT);
    } else if (event->key.keysym.sym == SDLK_p) {
      paused = paused ? false : true;
    }
    break;

  case SDL_KEYDOWN:
    if (event->key.keysym.sym == SDLK_UP) {
      camera->setMovingUp(true);
    } else if (event->key.keysym.sym == SDLK_RIGHT) {
      camera->setMovingRight(true);
    } else if (event->key.keysym.sym == SDLK_DOWN) {
      camera->setMovingDown(true);
    } else if (event->key.keysym.sym == SDLK_LEFT) {
      camera->setMovingLeft(true);
    } else if (event->key.keysym.sym == SDLK_PAGEUP) {
      camera->setZoomingIn(true);
    } else if (event->key.keysym.sym == SDLK_PAGEDOWN) {
      camera->setZoomingOut(true);
    } 
    break;
  }
}

void VirusViewer::handleMouseEvent(SDL_Event *event) {
  double mx;
  double my;

  switch (event->type) {
  case SDL_MOUSEMOTION:
    mx = event->motion.x;
    my = event->motion.y;
    break;
    
  case SDL_MOUSEBUTTONUP:
    break;

  case SDL_MOUSEBUTTONDOWN:
    if (event->button.button == 1) {
      Vector world = camera->convertScreenToWorld(Vector(event->motion.x,
							 event->motion.y,
							 0.0));

      debugCreateVirus(Vector(world.x, world.y, 0.0));
    } else if (event->button.button == 3) {
      Vector world = camera->convertScreenToWorld(Vector(event->motion.x,
							 event->motion.y,
							 0.0));

      debugMove(Vector(world.x, world.y, 0.0));
    } else if (event->button.button == 4) {
      camera->increaseZoom();
    } else if (event->button.button == 5) {
      camera->decreaseZoom();
    }
    break;
  }
}

bool VirusViewer::isRunning() {
  return running;
}

bool VirusViewer::isDone() {
  return done;
}

void VirusViewer::debugCreateVirus(Vector position) {
  //Virus *virus = new Virus(7);

  Tile *tile = map->getTile(position);
  if (tile->getType() != TILE_EMPTY) {
    Cell *cell = tile->getCell();
    if (cell) {
      cell->startCloning(FACTION_ALLY,
			 randomGenerator->getIntNumberBetween(0, 65535));
      //cell->startCloning(FACTION_ALLY, 5);
    }
  } else {
    /*
    Virus *virus = new Virus(FACTION_ENEMY,
			     randomGenerator->getIntNumberBetween(0, 65535),
			     true);
    */
    Virus *virus = new Virus(FACTION_ALLY,
			     919,
			     true);

    virus->setPosition(position);
    virus->setOrientation(0.0);
    
    double rotateSpeed = randomGenerator->getRealNumberBetween(-1.5, 1.5);
    virus->setRotateSpeed(rotateSpeed);
    
    Entity *entity = (Entity *)virus;
    
    map->addEntity(entity);
  }
}

void VirusViewer::debugMove(Vector position) {
  //Tile *tile = map->getTile(position);

  //map->findAllPathsTo(tile->hx, tile->hy, 10);

  Tile *tile = map->getTile(position);
  if (tile->getType() != TILE_EMPTY) {
    Cell *cell = tile->getCell();
    if (cell) {
      cell->startCloning(FACTION_ENEMY,
			 randomGenerator->getIntNumberBetween(0, 65535));
      //cell->startCloning(FACTION_ENEMY, 2);
    }
  } else {
    /*
    Virus *virus = new Virus(FACTION_ENEMY,
			     randomGenerator->getIntNumberBetween(0, 65535),
			     true);
    */
    Virus *virus = new Virus(FACTION_ENEMY,
			     920,
			     true);

    virus->setPosition(position);
    virus->setOrientation(0.0);
    
    double rotateSpeed = randomGenerator->getRealNumberBetween(-1.5, 1.5);
    virus->setRotateSpeed(rotateSpeed);
    
    Entity *entity = (Entity *)virus;
    
    map->addEntity(entity);
  }
}
