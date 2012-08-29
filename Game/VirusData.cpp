#include "VirusData.hpp"

VirusData::VirusData(unsigned int id) {
  this->id = id;
  this->sequence = "";
}

VirusData::~VirusData() {
  for (unsigned int i = 0; i < proteins.size(); i++) {
    delete proteins[i];
  }
}

std::string VirusData::getSequence() {
  if (sequence == "") {
    sequence = "RRRRRRRR";
    
    unsigned int denominator = id;
    unsigned int i = 0;
    while (denominator != 0) {
      unsigned int value = denominator % 4;
      denominator = denominator / 4;
      
      unsigned int index = ID2SEQUENCE[i++];
      if (value == 0) {
	sequence[index] = 'R';
      } else if (value == 1) {
	sequence[index] = 'G';
      } else if (value == 2) {
	sequence[index] = 'B';
      } else if (value == 3) {
	sequence[index] = 'Y';
      }
    }
  }

  return sequence;
}

void VirusData::setVirusColor(VirusColor color) {
  this->virusColor = color;
  switch (virusColor) {
  case VIRUS_COLOR_RED:
    this->color = Color(1.0, 0.0, 0.0);
    break;

  case VIRUS_COLOR_GREEN:
    this->color = Color(0.0, 1.0, 0.0);
    break;

  case VIRUS_COLOR_BLUE:
    this->color = Color(0.0, 0.0, 1.0);
    break;

  case VIRUS_COLOR_YELLOW:
    this->color = Color(1.0, 1.0, 0.0);
    break;
  }  
}

VirusColor VirusData::getVirusColor() {
  return this->virusColor;
}

Color VirusData::getColor() {
  return this->color;
}

void VirusData::setBodyType(VirusBodyType bodyType) {
  this->bodyType = bodyType;
}

VirusBodyType VirusData::getBodyType() {
  return this->bodyType;
}

void VirusData::setNumSegments(unsigned char numSegments) {
  this->numSegments = numSegments;
}

unsigned char VirusData::getNumSegments() {
  return this->numSegments;
}

void VirusData::setSize(double size) {
  this->size = size;
}

double VirusData::getSize() {
  return this->size;
}

void VirusData::setLength(double length) {
  this->length = length;
}

double VirusData::getLength() {
  return this->length;
}

void VirusData::setProteinDensity(unsigned char proteinDensity) {
  this->proteinDensity = proteinDensity;
}

unsigned char VirusData::getProteinDensity() {
  return this->proteinDensity;
}

void VirusData::setProteinTypes(unsigned char proteinTypes) {
  this->proteinTypes = proteinTypes;

  if (proteinTypes & PROTEINTYPE_SQUARE) {
    proteins.push_back(new SquareProtein(proteinLength));
  }
  if (proteinTypes & PROTEINTYPE_CIRCLE) {
    proteins.push_back(new CircleProtein(proteinLength));
  }
  if (proteinTypes & PROTEINTYPE_TRIANGLE) {
    proteins.push_back(new TriangleProtein(proteinLength));
  }
}

unsigned char VirusData::getProteinTypes() {
  return this->proteinTypes;
}

void VirusData::setProteinLength(double proteinLength) {
  this->proteinLength = proteinLength;
}

double VirusData::getProteinLength() {
  return this->proteinLength;
}

void VirusData::setBodyProfile(std::vector<Vector> profile) {
  this->bodyProfile = profile;
}

std::vector<Vector> VirusData::getBodyProfile() {
  return this->bodyProfile;
}

void VirusData::outputDescription() {
  std::cout << "Sequence : " << getSequence() << std::endl;
  
  switch (virusColor) {
  case VIRUS_COLOR_RED:
    std::cout << " Red";
    break;

  case VIRUS_COLOR_GREEN:
    std::cout << " Green";
    break;

  case VIRUS_COLOR_BLUE:
    std::cout << " Blue";
    break;

  case VIRUS_COLOR_YELLOW:
    std::cout << " Yellow";
    break;
  }

  switch (bodyType) {
  case VIRUS_BODYTYPE_WORM:
    std::cout << " Ellipsoid";
    break;

  case VIRUS_BODYTYPE_AMOEBA:
    std::cout << " Star-shaped";
    break;

  case VIRUS_BODYTYPE_SPHERE:
    std::cout << " Spheroid";
    break;
  }

  std::cout << " Virus" << std::endl;

  if (bodyType == VIRUS_BODYTYPE_SPHERE) {
    std::cout << (int)numSegments << " sides" << std::endl;
  }

  std::cout << "Protein Density : " << (int)proteinDensity << std::endl;
  std::cout << "Protein Length  : " << proteinLength << std::endl;
  std::cout << "Protein types   : " << (int)proteinTypes << std::endl;
  
  if (proteinTypes & PROTEINTYPE_SQUARE) {
    std::cout << "-- Square" << std::endl;
  }
  if (proteinTypes & PROTEINTYPE_CIRCLE) {
    std::cout << "-- Circle" << std::endl;
  }
  if (proteinTypes & PROTEINTYPE_TRIANGLE) {
    std::cout << "-- Triangle" << std::endl;
  }

  std::cout << "Size : " << size << std::endl << std::endl;
  std::cout << "Max HP : " << maxHP << std::endl;
  std::cout << "Speed  : " << movementSpeed << std::endl;
}

void VirusData::buildShapeWorm() {
  for (unsigned int i = 0; i < bodyProfile.size(); i++) {
    shape.push_back(bodyProfile[i]);
  }

  for (int i = bodyProfile.size() - 1; i >=  0; i--) {
    Vector mirror = Vector(bodyProfile[i].x, 
			   -bodyProfile[i].y,
			   0.0);
    shape.push_back(mirror);
  }
}

void VirusData::buildShapeSphere() {
  double dAngle = (2.0 * M_PI) / (double)numSegments;
  double angle = 0.0;
  for (unsigned int k = 0; k < numSegments; k++, angle -= dAngle) {
    Vector start = Vector(size * cos(angle), size * sin(angle), 0.0);
    shape.push_back(start);
  }
}

void VirusData::buildShapeAmoeba() {
  double dAngle = (2.0 * M_PI) / (double)numSegments;
  double angle = 0.0;
  for (unsigned int k = 0; k < numSegments; k++, angle -= dAngle) {
    Vector start = Vector(0.0, 0.0, 0.0);
    Vector end = Vector(cos(angle), sin(angle), 0.0);

    Vector direction = Vector(start, end);
    direction = direction.normalize();
    
    Vector normal = direction.cross(Vector(0.0, 0.0, 1.0));

    for (unsigned int i = 0; i < bodyProfile.size(); i++) {
      Vector point = start.translate(direction.mult(bodyProfile[i].x));
      point = point.translate(normal.mult(-bodyProfile[i].y));

      shape.push_back(point);
    }

    for (int i = bodyProfile.size() - 1; i >= 0; i--) {
      Vector point = start.translate(direction.mult(bodyProfile[i].x));
      point = point.translate(normal.mult(bodyProfile[i].y));

      shape.push_back(point);
    }
  }  
}

void VirusData::buildDisplayLists() {
  VirusCache *cache = VirusCache::instance();

  if (!shape.size()) {
    switch (bodyType) {
    case VIRUS_BODYTYPE_WORM:
      buildShapeWorm();
      break;
      
    case VIRUS_BODYTYPE_AMOEBA:
      buildShapeAmoeba();
      break;
      
    case VIRUS_BODYTYPE_SPHERE:
      buildShapeSphere();
      break;
    }
  }

  cache->beginSaveShape(id);

  glLineWidth(3.0);
  glBegin(GL_LINES);
  for (unsigned int i = 0; i < shape.size(); i++) {
    unsigned int j = (i + 1) % shape.size();
    Vector start = shape[i];
    Vector end = shape[j];

    glVertex3f(start.x, start.y, start.z);
    glVertex3f(end.x, end.y, end.z);
  }
  glEnd();

  unsigned int currentProtein = 0;
  for (unsigned int i = 0; i < shape.size(); i++) {
    glPushMatrix();

    unsigned int j = (i + 1) % shape.size();
    Vector start = shape[i];
    Vector end = shape[j];

    Vector direction = Vector(end.x - start.x,
			      end.y - start.y,
			      end.z - start.z);
    double sideLength = direction.length();
    direction = direction.normalize();

    double angle = atan2(direction.y, direction.x) - atan2(0.0, 1.0);
    angle = angle * 180.0 / M_PI;
    
    Vector normal = direction.cross(Vector(0.0, 0.0, 1.0));

    double deltaK = 1.0 / (double)(proteinDensity + 1); 
    for (unsigned int numProteins = 0; 
	 numProteins < proteinDensity; numProteins++) {
      glPushMatrix();
      
      Vector position = start;
      position = 
	position.translate(direction.mult((numProteins + 1) * deltaK * sideLength));
      glTranslatef(position.x, position.y, position.z);
      glRotatef(angle, 0.0, 0.0, 1.0);
      proteins[currentProtein]->render();
      currentProtein = (currentProtein + 1) % proteins.size();
      
      glPopMatrix();
    }
    
    glPopMatrix();
  }

  cache->endSave();

  GLUtesselator *tess = gluNewTess();

  gluTessCallback(tess, GLU_TESS_BEGIN, (GLvoid (*) ()) &glBegin);
  gluTessCallback(tess, GLU_TESS_END, (GLvoid (*) ()) &glEnd);
  gluTessCallback(tess, GLU_TESS_VERTEX, (GLvoid (*) ()) &glVertex3dv); 
  
  gluTessProperty(tess, GLU_TESS_WINDING_RULE, GLU_TESS_WINDING_ODD);   
  gluTessNormal(tess, 0, 0, 1);

  cache->beginSaveCore(id);

  gluTessBeginPolygon(tess, NULL);
  gluTessBeginContour(tess);

  GLdouble *vertices = new GLdouble[shape.size() * 3];
  for (unsigned int i = 0; i < shape.size(); i++) {
    vertices[(i * 3) + 0] = shape[i].x;
    vertices[(i * 3) + 1] = shape[i].y;
    vertices[(i * 3) + 2] = shape[i].z;

    gluTessVertex(tess, vertices + (i * 3), vertices + (i * 3));
  }

  gluTessEndContour(tess);
  gluTessEndPolygon(tess);

  cache->endSave();

  delete [] vertices;
  gluDeleteTess(tess);
}

void VirusData::render(int frame, double flash, Color flashColor,
		       double zoom) {
  VirusCache *cache = VirusCache::instance();

  /*
  double dAngle = (2.0 * M_PI) / 16;
  glColor4f(1.0, 1.0, 1.0, 0.15);
  glBegin(GL_POLYGON);
  for (unsigned int i = 0; i < 16; i++) {
    glVertex3f(getTakeoverRadius() * cos(i * dAngle),
	       getTakeoverRadius() * sin(i * dAngle),
	       0.0);

  }
  glEnd();
  */

  double p = ((double)frame / 120.0) * M_PI * 2.0;
  if (bodyType == VIRUS_BODYTYPE_WORM) {
    glScalef(1.0 + 0.10 * sin(p), 1.0 + 0.10 * cos(p + M_PI/2.0), 0.0);
  } else if (bodyType == VIRUS_BODYTYPE_AMOEBA) {
    glScalef(1.0 + 0.05 * sin(p), 1.0 + 0.05 * sin(p), 0.0);
    glScalef(size, size, 0.0);
  }

  double coreAlpha = flash > 0.35 ? flash : 0.35;
  if (zoom < 10.0) {
    double t = 1.0 - ((10.0 - zoom) / 4.0);
    coreAlpha *= t;
  }

  glColor4f((1.0 - flash) * color.r + flash * flashColor.r, 
	    (1.0 - flash) * color.g + flash * flashColor.g, 
	    (1.0 - flash) * color.b + flash * flashColor.b, 
	    coreAlpha);

  cache->renderCore(id);

  double t = 1.0;
  if (zoom > 8.0) {
    t = 1.0 - ((16.0 - zoom) / 8.0);
  }

  glColor4f((1.0 - flash) * color.r + flash * flashColor.r, 
	    (1.0 - flash) * color.g + flash * flashColor.g, 
	    (1.0 - flash) * color.b + flash * flashColor.b,
	    t);

  if (zoom > 8.0) {
    glEnable(GL_LINE_SMOOTH);
    
    cache->renderShape(id);
    
    glDisable(GL_LINE_SMOOTH);
  }
}

void VirusData::lowRender(double zoom) {
  double t = (10.0 - zoom) / 4.0;

  double radius = getRadius();
  if (bodyType == VIRUS_BODYTYPE_WORM) {
    radius *= 0.75;
  }

  glColor4f(color.r, color.g, color.b, t);
  glBegin(GL_TRIANGLES);
  for (unsigned int i = 0; i < 3; i++) {
    if (bodyType == VIRUS_BODYTYPE_WORM) {
      if (i == 0) {
	glVertex3f(1.5 * radius * cos(i * (2.0 * M_PI) / 3.0),
		   1.5 * radius * sin(i * (2.0 * M_PI) / 3.0),
		   0.0);
      } else {
	glVertex3f(-(radius / 2.0) + radius * cos(i * (2.0 * M_PI) / 3.0),
		   radius * sin(i * (2.0 * M_PI) / 3.0),
		   0.0);
      }
    } else {
      glVertex3f(radius * cos(i * (2.0 * M_PI) / 3.0),
		 radius * sin(i * (2.0 * M_PI) / 3.0),
		 0.0);
    }
  }
  glEnd();
}

void VirusData::setMaxHP(double value) {
  this->maxHP = value;
}

double VirusData::getMaxHP() {
  return this->maxHP;
}

void VirusData::setRegeneration(double value) {
  this->regeneration = value;
}

double VirusData::getRegeneration() {
  return this->regeneration;
}

void VirusData::setMovementSpeed(double value) {
  this->movementSpeed = value;
}

double VirusData::getMovementSpeed() {
  return this->movementSpeed;
}

void VirusData::setDamageInfo(DamageInfo damage) {
  this->damage = DamageInfo(damage);
}

DamageInfo VirusData::getDamageInfo() {
  return this->damage;
}

void VirusData::setNumClones(int value) {
  this->numClones = value;
}

int VirusData::getNumClones() {
  return this->numClones;
}

void VirusData::setCloningTime(int value) {
  this->cloningTime = value;
}

int VirusData::getCloningTime() {
  return this->cloningTime;
}

double VirusData::getRadius() {
  double radius = 0.0;

  switch (bodyType) {
  case VIRUS_BODYTYPE_SPHERE:
    radius = 0.8 * size;
    break;

  case VIRUS_BODYTYPE_AMOEBA:
    radius = 0.8 * (1.5 * size);
    break;

  case VIRUS_BODYTYPE_WORM:
    radius = 0.8 * length;
    break;
  }

  return radius;
}

double VirusData::getTakeoverRadius() {
  double radius = 0.0;

  switch (bodyType) {
  case VIRUS_BODYTYPE_SPHERE:
    radius = size + 1.80;
    break;

  case VIRUS_BODYTYPE_AMOEBA:
    radius = (1.5 * size) + 2.0;
    break;

  case VIRUS_BODYTYPE_WORM:
    radius = length + 1.5;
    break;
  }

  return radius;
}

