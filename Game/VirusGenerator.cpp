#include "VirusGenerator.hpp"

VirusGenerator::VirusGenerator() {
  randomGenerator = Mantis::RandomNumberGenerator::instance();
}

VirusGenerator::~VirusGenerator() {

}

VirusData *VirusGenerator::generateVirus(std::string sequence) {
  unsigned int id = 0;
  unsigned int multiplier = 1;

  for (unsigned int i = 0; i < sequence.size(); i++) {
    unsigned int value = 0;

    unsigned int index = SEQUENCE2ID[i];
    if (sequence[index] == 'R' || sequence[index] == 'r') {
      value = 0;
    } else if (sequence[index] == 'G' || sequence[index] == 'g') {
      value = 1;
    } else if (sequence[index] == 'B' || sequence[index] == 'b') {
      value = 2;
    } else if (sequence[index] == 'Y' || sequence[index] == 'y') {
      value = 3;
    }

    id += value * multiplier;
    multiplier *= 4;
  }

  return generateVirus(id);
}

VirusData *VirusGenerator::generateVirus(unsigned int id) {
  randomGenerator->setSeed(id);

  VirusData *virus = new VirusData(id);

  generateColor(virus);

  return virus;
}

void VirusGenerator::generateColor(VirusData *virus) {
  double p = randomGenerator->getProbability();

  if (p < 0.25) {
    virus->setVirusColor(VIRUS_COLOR_RED);
  } else if (p < 0.50) {
    virus->setVirusColor(VIRUS_COLOR_GREEN);
  } else if (p < 0.75) {
    virus->setVirusColor(VIRUS_COLOR_BLUE);
  } else if (p < 1.00) {
    virus->setVirusColor(VIRUS_COLOR_YELLOW);
  }
  
  generateBodyType(virus);
}

void VirusGenerator::generateBodyType(VirusData *virus) {
  double p = randomGenerator->getProbability();
  
  if (p < 0.33) {
    virus->setBodyType(VIRUS_BODYTYPE_WORM);
    virus->setNumSegments(1);
    double size = randomGenerator->getRealNumberBetween(1.25, 1.75);
    virus->setSize(size);

    generateWormBodyProfile(virus);
  } else if (p < 0.66) {
    virus->setBodyType(VIRUS_BODYTYPE_AMOEBA);
    double size = randomGenerator->getRealNumberBetween(1.5, 2.0);
    virus->setSize(size);

    generateAmoebaBodyProfile(virus);
  } else if (p < 1.00) {
    virus->setBodyType(VIRUS_BODYTYPE_SPHERE);
    unsigned char numSegments = randomGenerator->getIntNumberBetween(3, 12);
    virus->setNumSegments(numSegments);
    double size = randomGenerator->getRealNumberBetween(0.75, 1.25);
    virus->setSize(size);
    
    generateSphereProteins(virus, numSegments);
  }
}

void VirusGenerator::generateSphereProteins(VirusData *virus, 
					    unsigned int numSegments) {
  int maxProteins[] = {0, 0, 3, 3, 2, 2, 2, 1, 1, 1, 1, 1};

  unsigned char proteinDensity = 
    randomGenerator->getIntNumberBetween(1, maxProteins[numSegments - 1]);
  double proteinLength =
    randomGenerator->getRealNumberBetween(0.05, 0.50);
  unsigned char proteinTypes = 
    randomGenerator->getIntNumberBetween(1, 7);

  virus->setProteinDensity(proteinDensity);
  virus->setProteinLength(proteinLength);
  virus->setProteinTypes(proteinTypes);

  generateSphereStats(virus);  
}

void VirusGenerator::generateWormBodyProfile(VirusData *virus) {
  std::vector<Vector> profile;
  unsigned char numPoints = randomGenerator->getIntNumberBetween(3, 8);

  double length = randomGenerator->getRealNumberBetween(1.75, 3.0);
  virus->setLength(length);

  double x = -(length / 2.0) - 0.25;
  double deltaX = (length + 0.5) / (double)(numPoints - 1);
  for (int i = 0; i < numPoints; i++) {
    double maxY = 1.5 - (1.25 * (fabs(x) / ((length / 2.0) + 0.25)));

    double y = randomGenerator->getRealNumberBetween(std::max(0.25, maxY / 2.0), maxY);
    profile.push_back(Vector(x, y, 0.0));
    x += deltaX;
  }

  for (int i = 0; i < (int)profile.size(); i++) {
    double prevValue = 0.0;
    if (i - 1 >= 0) {
      prevValue = profile[i-1].y;
    }

    double nextValue = 0.0;
    if (i + 1 < (int)profile.size()) {
      nextValue = profile[i+1].y;
    }

    profile[i].y = (profile[i].y*3.0 + prevValue + nextValue) / 5.0;
  }

  virus->setBodyProfile(profile);

  generateWormProteins(virus);
}

void VirusGenerator::generateWormProteins(VirusData *virus) {
  double proteinLength = 
    randomGenerator->getRealNumberBetween(0.0, 0.35);
  unsigned char proteinTypes = 
    randomGenerator->getIntNumberBetween(1, 7);

  virus->setProteinDensity(1);
  virus->setProteinLength(proteinLength);
  virus->setProteinTypes(proteinTypes);

  generateWormStats(virus);
}

void VirusGenerator::generateAmoebaBodyProfile(VirusData *virus) {
  std::vector<Vector> profile;
  unsigned char numSegments = randomGenerator->getIntNumberBetween(2, 5);
  virus->setNumSegments(numSegments);

  unsigned char numPoints = 
    randomGenerator->getIntNumberBetween(2, 4);

  double x = 
    randomGenerator->getRealNumberBetween(0.35, 1.0);
  double deltaX = (1.5 - x) / (double)(numPoints - 1);
  for (int i = 0; i < numPoints; i++) {
    double aY = numSegments * 0.18;
    double maxY = (1.4 - aY) - ((1.3 - aY) * (fabs(0.625 - (x - 0.25)) / 0.625));

    double y = randomGenerator->getRealNumberBetween(std::max(0.25, maxY / 2.0), maxY);
    profile.push_back(Vector(x, y, 0.0));
    x += deltaX;
  }

  virus->setBodyProfile(profile);

  generateAmoebaProteins(virus);
}

void VirusGenerator::generateAmoebaProteins(VirusData *virus) {
  unsigned char proteinTypes = 
    randomGenerator->getIntNumberBetween(1, 7);

  virus->setProteinDensity(1);
  virus->setProteinLength(0.0);
  virus->setProteinTypes(proteinTypes);

  generateAmoebaStats(virus);
}

void VirusGenerator::generateSphereStats(VirusData *virus) {
  AntibodyType damageType;
  VirusColor damageColor;
  double attackSpeed;
  double attackRange;
  int damageValue;
  int damageCooldown;

  double p = randomGenerator->getProbability();
  if (p < 0.33) {
    damageType = ANTIBODYTYPE_SQUARE;
  } else if (p < 0.66) {
    damageType = ANTIBODYTYPE_CIRCLE;
  } else {
    damageType = ANTIBODYTYPE_TRIANGLE;
  }

  p = randomGenerator->getProbability();
  if (p < 0.25) {
    damageColor = VIRUS_COLOR_RED;
  } else if (p < 0.5) {
    damageColor = VIRUS_COLOR_BLUE;
  } else if (p < 0.75) {
    damageColor = VIRUS_COLOR_YELLOW;
  } else {
    damageColor = VIRUS_COLOR_GREEN;
  }

  damageValue = randomGenerator->getIntNumberBetween(20, 20);
  damageCooldown = randomGenerator->getIntNumberBetween(30, 30);
  attackSpeed = 0.1;
  attackRange = 1.0 * CELL_RADIUS;
  
  DamageInfo damage = 
    DamageInfo(damageType, damageColor, attackSpeed, attackRange,
	       damageValue, damageCooldown);

  virus->setDamageInfo(damage);

  double hp = 0.0;
  hp += (30.0 + 5.0 * virus->getProteinDensity()) * virus->getNumSegments();
  hp *= (1.0 + ((1.0 - virus->getSize()) / 2.0));
  hp = floor(hp);

  double maxHP = ((35.0 * 12) * 1.125) * 3.0;

  double virusWeight = virus->getNumSegments() * 1.0;
  virusWeight += (virus->getNumSegments() * virus->getProteinDensity()) * 0.25;
  virusWeight *= virus->getSize();

  double maxWeight = (12.0 + (12.0 * 0.25)) * 1.25;
  double minWeight = (3.0 + (3.0 * 0.25)) * 0.75;
  double maxSpeed = 0.4;
  double minSpeed = 0.275;

  double speed = 1.0 - ((virusWeight - minWeight) / (maxWeight - minWeight));
  speed *= (maxSpeed - minSpeed);
  speed += minSpeed;

  int numClones = (int)(maxHP / hp);
  numClones = std::max(std::min(numClones, 12), 3);

  int cloningTime = virus->getNumSegments() * 10;
  cloningTime += virus->getProteinDensity() * virus->getNumSegments() * 5;
  cloningTime = virus->getSize() * cloningTime;

  virus->setMaxHP(hp);
  virus->setMovementSpeed(speed);
  virus->setNumClones(numClones);
  virus->setCloningTime(cloningTime);

  virus->outputDescription();
}

void VirusGenerator::generateWormStats(VirusData *virus) {
  AntibodyType damageType;
  VirusColor damageColor;
  double attackSpeed;
  double attackRange;
  int damageValue;
  int damageCooldown;

  double p = randomGenerator->getProbability();
  if (p < 0.33) {
    damageType = ANTIBODYTYPE_SQUARE;
  } else if (p < 0.66) {
    damageType = ANTIBODYTYPE_CIRCLE;
  } else {
    damageType = ANTIBODYTYPE_TRIANGLE;
  }

  p = randomGenerator->getProbability();
  if (p < 0.25) {
    damageColor = VIRUS_COLOR_RED;
  } else if (p < 0.5) {
    damageColor = VIRUS_COLOR_BLUE;
  } else if (p < 0.75) {
    damageColor = VIRUS_COLOR_YELLOW;
  } else {
    damageColor = VIRUS_COLOR_GREEN;
  }

  damageValue = randomGenerator->getIntNumberBetween(100, 100);
  damageCooldown = randomGenerator->getIntNumberBetween(60, 60);
  attackSpeed = 0.45;
  attackRange = 3.0 * CELL_RADIUS;
  
  DamageInfo damage = 
    DamageInfo(damageType, damageColor, attackSpeed, attackRange,
	       damageValue, damageCooldown);

  virus->setDamageInfo(damage);

  int numSegments = (2 * (virus->getBodyProfile().size() - 1)) + 2;

  double hp = 0.0;
  hp += 40.0 * numSegments;
  hp *= virus->getLength() / 2.0;
  hp = floor(hp);

  double maxHP = ((40.0 * 16) * 1.5) * 3.0;

  double virusWeight = numSegments * 1.0;
  virusWeight += (numSegments * virus->getProteinDensity()) * 0.25;
  virusWeight *= (virus->getLength() / 2.0);

  double maxWeight = (16.0 + (16.0 * 0.25)) * 1.5;
  double minWeight = (6.0 + (6.0 * 0.25)) * 0.875;
  double maxSpeed = 0.3;
  double minSpeed = 0.2;

  double speed = 1.0 - ((virusWeight - minWeight) / (maxWeight - minWeight));
  speed *= (maxSpeed - minSpeed);
  speed += minSpeed;

  int numClones = (int)(maxHP / hp);
  numClones = std::max(std::min(numClones, 8), 3);

  int cloningTime = numSegments * 15;
  cloningTime += virus->getProteinDensity() * numSegments * 5;
  cloningTime = virus->getLength() * cloningTime;

  virus->setMaxHP(hp);
  virus->setMovementSpeed(speed);
  virus->setNumClones(numClones);
  virus->setCloningTime(cloningTime);

  virus->outputDescription();
}

void VirusGenerator::generateAmoebaStats(VirusData *virus) {
  AntibodyType damageType;
  VirusColor damageColor;
  double attackSpeed;
  double attackRange;
  int damageValue;
  int damageCooldown;

  double p = randomGenerator->getProbability();
  if (p < 0.33) {
    damageType = ANTIBODYTYPE_SQUARE;
  } else if (p < 0.66) {
    damageType = ANTIBODYTYPE_CIRCLE;
  } else {
    damageType = ANTIBODYTYPE_TRIANGLE;
  }

  p = randomGenerator->getProbability();
  if (p < 0.25) {
    damageColor = VIRUS_COLOR_RED;
  } else if (p < 0.5) {
    damageColor = VIRUS_COLOR_BLUE;
  } else if (p < 0.75) {
    damageColor = VIRUS_COLOR_YELLOW;
  } else {
    damageColor = VIRUS_COLOR_GREEN;
  }

  damageValue = randomGenerator->getIntNumberBetween(300, 300);
  damageCooldown = randomGenerator->getIntNumberBetween(90, 90);
  attackSpeed = 0.3;
  attackRange = 5.0 * CELL_RADIUS;
  
  DamageInfo damage = 
    DamageInfo(damageType, damageColor, attackSpeed, attackRange,
	       damageValue, damageCooldown);

  virus->setDamageInfo(damage);

  int numSegments = 
    (2 * virus->getNumSegments() * (virus->getBodyProfile().size() - 1)) + 
    virus->getNumSegments();

  double hp = 0.0;
  hp += 30.0 * numSegments;
  hp *= virus->getSize();
  hp = floor(hp);

  double maxHP = ((30.0 * 35) * 2.0) * 3.0;

  double virusWeight = numSegments * 1.0;
  virusWeight += (numSegments * virus->getProteinDensity()) * 0.25;
  virusWeight *= virus->getSize();

  double maxWeight = (35.0 + (35.0 * 0.25)) * 2.0;
  double minWeight = (8.0 + (8.0 * 0.25)) * 1.5;
  double maxSpeed = 0.2;
  double minSpeed = 0.1;

  double speed = 1.0 - ((virusWeight - minWeight) / (maxWeight - minWeight));
  speed *= (maxSpeed - minSpeed);
  speed += minSpeed;

  int numClones = (int)(maxHP / hp);
  numClones = std::max(std::min(numClones, 8), 3);

  int cloningTime = numSegments * 15;
  cloningTime += virus->getProteinDensity() * numSegments * 5;
  cloningTime = virus->getSize() * cloningTime;

  virus->setMaxHP(hp);
  virus->setMovementSpeed(speed);
  virus->setNumClones(numClones);
  virus->setCloningTime(cloningTime);

  virus->outputDescription();
}

