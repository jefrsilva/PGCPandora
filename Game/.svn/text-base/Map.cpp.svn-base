#include "Map.hpp"

Map::Map() {
  randomGenerator = Mantis::RandomNumberGenerator::instance();
  randomGenerator->setSeed(SDL_GetTicks());

  hexRadius = CELL_RADIUS * sqrt(4.0 / 3.0);

  aiGameFrame = 0;
  logicGameFrame = 0;

  log = Mantis::LogSystem::instance();
  log->output(Mantis::LOG_GAME, "Map :: constructor");
}

Map::~Map() {
  std::list<Entity *>::iterator it;
  for (it = entities.begin(); it != entities.end(); it++) {
    delete (*it);
  }
  for (it = queuedEntities.begin(); it != queuedEntities.end(); it++) {
    delete (*it);
  }

  std::list<VisualEffect *>::iterator itA;
  for (itA = visualEffects.begin(); itA != visualEffects.end(); itA++) {
    delete (*itA);
  }

  for (unsigned int i = 0; i < tiles.size(); i++) {
    for (unsigned int j = 0; j < tiles[0].size(); j++) {
      delete tiles[i][j];

      int tileId = (i * tiles[0].size()) + j;
      delete aiData[tileId];
    }
  }
}

void Map::generate(unsigned int width, unsigned int height,
		   double branchingFactor,
		   double squareCells, double circleCells, 
		   double triangleCells) {
  prepareTiles(width, height);
  carvePaths(branchingFactor);
  generateCells(squareCells, circleCells, triangleCells);
}

void Map::prepareTiles(unsigned int width, unsigned int height) {
  width = std::max(5, (int)width + 2);
  height = std::max(2 * ((width - 1) / 2) + 1, height + 2);

  for (unsigned int i = 0; i < height; i++) {
    std::vector<Tile *> tilesRow;
    for (unsigned int j = 0; j < width; j++) {
      tilesRow.push_back(new Tile(j, i, TILE_BORDER));
    }
    tiles.push_back(tilesRow);
  }

  int row = 1;
  for (unsigned int i = ((width - 3) / 2); i > 0; i--) {
    for (unsigned int j = 0; j < (width - 2) - (i * 2); j++) {
      tiles[row][tiles[0].size() - j - 2]->setType(TILE_CELL);
    }
    row++;
  }

  for (unsigned int i = 0; i < height - 2 * ((width - 1) / 2); i++) {
    for (unsigned int j = 0; j < (width-2); j++) {
      tiles[row][j+1]->setType(TILE_CELL);
    }
    row++;
  }

  for (unsigned int i = 1; i <= ((width - 3) / 2); i++) {
    for (unsigned int j = 0; j < (width-2) - (i * 2); j++) {
      tiles[row][j+1]->setType(TILE_CELL);
    }
    row++;
  }

  for (unsigned int i = 0; i < tiles.size(); i++) {
    for (unsigned int j = 0; j < tiles[0].size(); j++) {
      aiData.push_back(new AIData());
    }
  }
}

void Map::carvePaths(double branchingFactor) {
  int width = tiles[0].size();
  int height = tiles.size();

  int maxRow = height - (2 * ((width - 1) / 2)) +
    ((width - 3) / 2);
  int maxCol = (width - 2);

  int sx = randomGenerator->getIntNumberBetween(1, maxCol);
  int sy = tiles.size() - 1 - randomGenerator->getIntNumberBetween(1, maxRow) - (sx - 1) / 2;

  sx = (maxCol + 1) / 2;
  sy = tiles.size() / 2;

  int id = randomGenerator->getIntNumberBetween(0, 5);

  tiles[sy][sx]->setType(TILE_EMPTY);

  std::map<std::pair<std::pair<int, int>, int>, bool> visited;
  std::stack<std::pair<std::pair<int, int>, int> > toCarve;

  std::pair<std::pair<int, int>, int> start;
  start = std::make_pair(std::make_pair(sx+dirX[id], sy+dirY[id]), id);
  
  toCarve.push(start);
  visited[start] = true;

  id = (id + 3) % 6;
  start = std::make_pair(std::make_pair(sx+dirX[id], sy+dirY[id]), id);

  toCarve.push(start);
  visited[start] = true;

  while (!toCarve.empty()) {
    std::pair<std::pair<int, int>, int> cur;
    cur = toCarve.top();
    toCarve.pop();

    int i = cur.first.second;
    int j = cur.first.first;
    int dir = cur.second;
    
    tiles[i][j]->setType(TILE_EMPTY);
    
    int cd = (randomGenerator->getIntNumberBetween(0, 4) - 2) / 2;
    int nd = (dir + 6 + cd) % 6;

    if (tiles[i+dirY[nd]][j+dirX[nd]]->getType() != TILE_BORDER) {
      std::pair<std::pair<int, int>, int> pos =
	std::make_pair(std::make_pair(j+dirX[nd], i+dirY[nd]), nd);

      if (!visited[pos]) {
	visited[pos] = true;

	toCarve.push(pos);
      }
    }

    double p = randomGenerator->getProbability();
    if (p < branchingFactor) {
      cd = randomGenerator->getIntNumberBetween(0, 4) - 2;
      nd = (dir + 6 + cd) % 6;
      
      if (tiles[i+dirY[nd]][j+dirX[nd]]->getType() != TILE_BORDER) {
	std::pair<std::pair<int, int>, int> pos;
	pos = std::make_pair(std::make_pair(j+dirX[nd], i+dirY[nd]), nd);
	
	if (!visited[pos]) {
	  visited[pos] = true;
	  
	  toCarve.push(pos);
	}
      }      
    }
  }
}

void Map::generateCells(double squareCells, double circleCells,
			double triangleCells) {
  Vector axisX = Vector(cos(M_PI / 6.0), sin(M_PI / 6.0), 0.0);
  Vector axisY = Vector(0.0, 1.0, 0.0);

  int adjY = (tiles[0].size() - 1) / 2;
  Vector origin = Vector(0.0, -adjY * CELL_RADIUS * 2.0, 0.0);
  origin = origin.translate(Vector(hexRadius, 
				   cos(M_PI / 6.0) * hexRadius, 0.0));

  for (unsigned int i = 0; i < tiles.size(); i++) {
    for (unsigned int j = 0; j < tiles[0].size(); j++) {
      Vector pos = origin;
      pos = pos.translate(axisX.mult(2.0 * CELL_RADIUS * j));
      pos = pos.translate(axisY.mult(2.0 * CELL_RADIUS * i));

      tiles[i][j]->setPosition(pos);

      if (tiles[i][j]->getType() == TILE_CELL) {
	Cell *cell = 0;
	
	double p = randomGenerator->getProbability();
	if (p <= squareCells) {
	  cell = new Cell(PROTEINTYPE_SQUARE, pos);
	} else if (p <= squareCells + circleCells) {
	  cell = new Cell(PROTEINTYPE_CIRCLE, pos);
	} else if (p <= squareCells + circleCells + triangleCells) {
	  cell = new Cell(PROTEINTYPE_TRIANGLE, pos);
	} else {
	  cell = new Cell(PROTEINTYPE_NONE, pos);
	}

	cell->setMap(this);
	tiles[i][j]->setCell(cell);
      } else if (tiles[i][j]->getType() == TILE_BORDER) {
	Cell *cell = new Cell(PROTEINTYPE_NONE, pos);

	cell->setMap(this);
	tiles[i][j]->setCell(cell);
      }
    } 
  }
}

void Map::update() {
  // Add all queued entities to main entity list
  if (queuedEntities.size() > 0) {
    std::list<Entity *>::const_iterator it;
    for (it = queuedEntities.begin(); it != queuedEntities.end(); it++) {
      Entity *entity = (*it);
      entities.push_back(entity);
      
      Vector position = entity->getPosition();
      Tile *tile = getTile(position);
      tile->addEntity(entity);

      entity->setMap(this);
    }

    queuedEntities.clear();
  }

  // Updates main entities and remove the dead ones
  std::list<Entity *>::iterator it = entities.begin();
  while (it != entities.end()) {
    Entity *entity = (*it);
    if (entity->isDead()) {
      Tile *tile = getTile(entity->getPosition());
      tile->removeEntity(entity);
      
      delete entity;
      it = entities.erase(it);
      continue;
    }

    it++;
    entity->update();
      
    if (entity->isVirus()) {
      int tx = getTile(entity->getPosition())->hx;
      int ty = getTile(entity->getPosition())->hy;
      
      for (int i = 0; i < 7; i++) {
	Tile *tile;
	Virus *virus = (Virus *)entity;
	if (!virus->isActive()) {
	  break;
	}
	
	if (i == 0) { // Current tile
	  tile = tiles[ty][tx];
	  
	  if (tile->getType() == TILE_EMPTY) {
	    tile->changeOwnerFactionTo(2.0 * virus->getOwnerFaction(),
				       logicGameFrame);
	  }
	} else { // Adjacent tiles
	  int adjX = tx + dirX[i - 1];
	  int adjY = ty + dirY[i - 1];

	  if (adjX < 0 || (adjX > (int)tiles[0].size() - 1) ||
	      adjY < 0 || (adjY > (int)tiles.size() - 1)) {
	    continue;
	  }

	  tile = tiles[adjY][adjX];
	}
	
	// Handles cell collision
	if (tile->getType() == TILE_CELL ||
	    tile->getType() == TILE_BORDER) {
	  Vector direction = 
	    Vector(tile->getPosition(), entity->getPosition());
	  double dist = direction.length();

	  // Check for reproduction
	  bool takeoverSuccess = false;
	  if (tile->getType() == TILE_CELL) {
	    if (dist <= CELL_RADIUS +
		virus->getTakeoverCircle().getRadius()) {
	      Cell *cell = tile->getCell();
	      takeoverSuccess = virus->tryTakeoverCell(cell);
	    }
	  }
	  
	  if (!takeoverSuccess) {
	    // Check for collision
	    if (dist < CELL_RADIUS + virus->getBoundingCircle().getRadius()) {
	      direction = direction.normalize();
	      direction = 
		direction.mult(0.1 + CELL_RADIUS + 
			       virus->getBoundingCircle().getRadius() - dist);
	      
	      entity->setPosition(entity->getPosition().translate(direction));

	      tx = getTile(entity->getPosition())->hx;
	      ty = getTile(entity->getPosition())->hy;
	      i = -1;
	    }
	  }
	}
      }
    }
  }

  // Update all cells and tiles
  for (unsigned int i = 0; i < tiles.size(); i++) {
    for (unsigned int j = 0; j < tiles[0].size(); j++) {
      if (tiles[i][j]->getType() == TILE_EMPTY) {
	tiles[i][j]->changeOwnerFactionTo(FACTION_NEUTRAL, logicGameFrame);
      }

      Cell *cell = tiles[i][j]->getCell();
      if (cell) {
	cell->update();
      }
    }
  }

  // Update visual effects and remove dead ones
  std::list<VisualEffect *>::iterator itA = visualEffects.begin();
  while (itA != visualEffects.end()) {
    VisualEffect *effect = (*itA);
    if (effect->isDead()) {
      delete effect;
      itA = visualEffects.erase(itA);
      continue;
    }

    itA++;
    effect->update();
  }

  // Updates AI for entities
  for (unsigned int i =  0; i < tiles.size(); i++) {
    for (unsigned int j = 0; j < tiles[0].size(); j++) {
      int tileId = (i * tiles[0].size()) + j;
      Tile *tile = tiles[i][j];
      if (tile->getType() != TILE_BORDER) {
	if (tile->hasEntities()) {
	  bool hasData = false;
	  
	  std::list<Entity *> tileEntities = tile->getEntities();
	  for (it = tileEntities.begin(); it != tileEntities.end(); it++) {
	    Entity *entity = (*it);
	    if (entity->isVirus()) {
	      Virus *virus = (Virus *)entity;
	      if (virus->isActive()) {
		if (aiGameFrame == 0) {
		  if (!hasData) {
		    gatherSurroundingsInfo(aiData[tileId], tile);
		    hasData = true;
		  } 
		  
		  virus->setAIData(aiData[tileId]);
		}
		
		if (virus->getAIGroup() == aiGameFrame) {
		  virus->updateAI();
		}
	      }
	    }
	  }
	}
      }
    }
  }

  if (aiGameFrame == 0) {
    logicGameFrame++;
  }
  aiGameFrame = (aiGameFrame + 1) % 30;
}

void Map::render(Region view) {
  for (unsigned int i = 0; i < tiles.size(); i++) {
    for (unsigned int j = 0; j < tiles[0].size(); j++) {
      Vector pos = tiles[i][j]->getPosition();

      if (view.contains(tiles[i][j]->getBoundingCircle())) {
	tiles[i][j]->render(view);
      }

      std::list<Entity *> entities = tiles[i][j]->getEntities();
      std::list<Entity *>::iterator it;
      for (it = entities.begin(); it != entities.end(); it++) {
	Entity *entity = (*it);
	entity->render(view);
      }      

      Cell *cell = tiles[i][j]->getCell();
      if (cell) {
	cell->render(view);
      }
    }
  }

  std::list<VisualEffect *>::iterator it;
  for (it = visualEffects.begin(); it != visualEffects.end(); it++) {
    VisualEffect *effect = (*it);
    effect->render(view);
  }
}

void Map::addEntity(Entity *entity) {
  queuedEntities.push_back(entity);
}

void Map::addVisualEffect(VisualEffect *effect) {
  visualEffects.push_back(effect);
}

Region Map::getBoundary() {
  int adjY = tiles.size() - (tiles[0].size() - 1) / 2;
  double minX = hexRadius;
  double maxX = hexRadius + ((int)tiles[0].size() - 1) * cos(M_PI / 6.0) * 2.0 * CELL_RADIUS;
  double minY = 0.0;
  double maxY = adjY * 2.0 * CELL_RADIUS + CELL_RADIUS;
    
  Region region = Region(minX, maxY, maxX - minX, maxY - minY);

  return region;
}

Tile *Map::getTile(int hx, int hy) {
  return tiles[hy][hx];
}

Tile *Map::getTile(const Vector &position) {
  double s = hexRadius;
  double h = sin(M_PI / 6.0) * s;
  double r = cos(M_PI / 6.0) * s;

  int xSection = position.x / (h + s);
  int ySection = position.y / (2.0 * r);

  double x = position.x - (xSection * (s + h));
  double y = position.y - (ySection * (2.0 * r));

  int xHexagon = 0;
  int yHexagon = 0;

  if (xSection % 2 == 0) { // Type A Section
    if (x <= h) {
      if (y < r - ((r * x) / h)) {
	xHexagon = xSection - 1;
	yHexagon = ySection;
      } else if (y > r + ((r * x) / h)) {
	xHexagon = xSection - 1;
	yHexagon = ySection + 1;
      } else {
	xHexagon = xSection;
	yHexagon = ySection;
      }
    } else {
      xHexagon = xSection;
      yHexagon = ySection;
    }
  } else { // Type B Section
    if (x <= h) {
      if (y > 2.0 * r - ((r * x) / h)) {
	xHexagon = xSection;
	yHexagon = ySection;
      } else if (y < ((r * x) / h)) {
	xHexagon = xSection;
	yHexagon = ySection - 1;
      } else {
	xHexagon = xSection - 1;
	yHexagon = ySection;
      }
    } else {
      if (y > r) {
	xHexagon = xSection;
	yHexagon = ySection;
      } else {
	xHexagon = xSection;
	yHexagon = ySection - 1;
      }
    }
  }

  yHexagon -= xSection / 2;
  int adj = (tiles[0].size() - 1) / 2;

  return tiles[yHexagon + adj][xHexagon];
}

void Map::findAllPathsTo(int x, int y, int maxDistance) {
  std::map<std::pair<int, int>, bool> visited;
  std::vector<std::vector<Tile *> > paths;  
  std::queue<SearchNode> search;

  for (unsigned int i = 0; i < tiles.size(); i++) {
    paths.push_back(std::vector<Tile *>(tiles[0].size(), 0));
  }

  visited[std::make_pair(x, y)] = true;
  search.push(SearchNode(x, y, 0));

  if (tiles[y][x]->hasEntities()) {
    std::deque<Tile *> path;
    path.push_back(tiles[y][x]);
    tiles[y][x]->notifyMovement(path, 0);
  }

  while (!search.empty()) {
    SearchNode cur = search.front();
    search.pop();

    if (cur.distance + 1 <= maxDistance ) {
      for (int i = 0; i < 6; i++) {
	if (!visited[std::make_pair(cur.x + dirX[i], cur.y + dirY[i])] &&
	    tiles[cur.y + dirY[i]][cur.x + dirX[i]]->getType() == TILE_EMPTY) {
	  visited[std::make_pair(cur.x + dirX[i], cur.y + dirY[i])] = true;
	  search.push(SearchNode(cur.x + dirX[i], cur.y + dirY[i],
				 cur.distance + 1));
	  paths[cur.y + dirY[i]][cur.x + dirX[i]] = tiles[cur.y][cur.x];
	  
	  if (tiles[cur.y + dirY[i]][cur.x + dirX[i]]->hasEntities()) {
	    std::deque<Tile *> reversePath;

	    int cx = cur.x + dirX[i];
	    int cy = cur.y + dirY[i];
	    reversePath.push_back(tiles[cy][cx]);

	    while (paths[cy][cx]) {
	      reversePath.push_back(paths[cy][cx]);
	      
	      int nx, ny;
	      nx = paths[cy][cx]->hx;
	      ny = paths[cy][cx]->hy;
	      
	      cx = nx;
	      cy = ny;
	    }
	    
	    reversePath.push_back(tiles[y][x]);
	    
	    tiles[cur.y+dirY[i]][cur.x+dirX[i]]->notifyMovement(reversePath, cur.distance + 1);
	  }
	}
      }
    }
  }
}

int Map::getAiGameFrame() {
  return aiGameFrame;
}

void Map::gatherSurroundingsInfo(AIData *data, Tile *tile) {
  int distance = 3;

  data->nearbyEntities.clear();
  data->allyCandidates.clear();
  data->neutralCandidates.clear();
  data->enemyCandidates.clear();
  data->parent.clear();

  std::map<std::pair<int, int>, bool> visited;

  std::queue<SearchNode> search;
  Tile *source = tile;
  search.push(SearchNode(source->hx, source->hy, 0));
  visited[std::make_pair(source->hx, source->hy)] = true;

  while (!search.empty()) {
    SearchNode cur = search.front();
    search.pop();

    Tile *tile = tiles[cur.y][cur.x];
    if (tile->getOwnerFaction() == FACTION_ALLY) {
      data->allyCandidates.push_back(tile);
    } else if (tile->getOwnerFaction() == FACTION_ENEMY) {
      data->enemyCandidates.push_back(tile);
    } else if (tile->getOwnerFaction() == FACTION_NEUTRAL) {
      data->neutralCandidates.push_back(tile);
    }

    if (tile->hasEntities()) {
      data->nearbyEntities.push_back(tile);
    }

    if (cur.distance + 1 <= distance) {
      for (int i = 0; i < 6; i++) {
	int nx = cur.x + dirX[i];
	int ny = cur.y + dirY[i];
	
	if (tiles[ny][nx]->getType() == TILE_EMPTY &&
	    !visited[std::make_pair(nx, ny)]) {
	  search.push(SearchNode(nx, ny, cur.distance + 1));
	  visited[std::make_pair(nx, ny)] = true;
	  data->parent[std::make_pair(nx, ny)] = tile;
	}
      }
    }
  }
}

void Map::issueCommand(Faction faction, VirusCommand command) {
  std::list<Entity *>::iterator it;
  for (it = entities.begin(); it != entities.end(); it++) {
    Entity *entity = (*it);
    if (entity->isVirus()) {
      Virus *virus = (Virus *)entity;
      if (virus->getOwnerFaction() == faction) {
	virus->issueCommand(command);
      }
    }
  }
}
