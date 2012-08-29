#ifndef _INC_VIRUSDATA_HPP
#define _INC_VIRUSDATA_HPP

#include "VirusCache.hpp"

#include "Constants.hpp"
#include "Entity.hpp"
#include "BoundingCircle.hpp"
#include "Region.hpp"
#include "Vector.hpp"
#include "Protein.hpp"
#include "SquareProtein.hpp"
#include "CircleProtein.hpp"
#include "TriangleProtein.hpp"
#include "Antibody.hpp"
#include "DamageInfo.hpp"
#include "Color.hpp"

#include <vector>
#include <string>
#include <iostream>

#include <Engine/Mantis.hpp>

const int ID2SEQUENCE[] = {6, 0, 7, 4, 3, 1, 5, 2};

class VirusData {
private:
  unsigned int id;
  std::string sequence;

  VirusColor virusColor;
  Color color;
  VirusBodyType bodyType;
  unsigned char numSegments;
  double size;
  double length;
  unsigned char proteinDensity;
  unsigned char proteinTypes;
  double proteinLength;
  std::vector<Vector> bodyProfile;
  std::vector<Protein *> proteins;

  std::vector<Vector> shape;

  double maxHP;
  double regeneration;
  double movementSpeed;

  DamageInfo damage;

  int numClones;
  int cloningTime;

  void buildShapeWorm();
  void buildShapeSphere();
  void buildShapeAmoeba();

public:
  VirusData(unsigned int id);
  ~VirusData();
  
  std::string getSequence();

  void setVirusColor(VirusColor color);
  VirusColor getVirusColor();
  Color getColor();

  void setBodyType(VirusBodyType bodyType);
  VirusBodyType getBodyType();

  void setNumSegments(unsigned char numSegments);
  unsigned char getNumSegments();

  void setSize(double size);
  double getSize();

  void setLength(double length);
  double getLength();

  void setProteinDensity(unsigned char proteinDensity);
  unsigned char getProteinDensity();

  void setProteinTypes(unsigned char proteinTypes);
  unsigned char getProteinTypes();

  void setProteinLength(double proteinLength);
  double getProteinLength();

  void setBodyProfile(std::vector<Vector> profile);
  std::vector<Vector> getBodyProfile();

  void setMaxHP(double value);
  double getMaxHP();
  
  void setRegeneration(double value);
  double getRegeneration();

  void setMovementSpeed(double value);
  double getMovementSpeed();

  void setDamageInfo(DamageInfo damage);
  DamageInfo getDamageInfo();

  void setNumClones(int value);
  int getNumClones();

  void setCloningTime(int value);
  int getCloningTime();

  void outputDescription();

  void buildDisplayLists();

  void render(int frame, double flash, Color flashColor, double zoom);
  void lowRender(double zoom);

  double getRadius();
  double getTakeoverRadius();
};

#endif

