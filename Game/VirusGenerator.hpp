#ifndef _INC_VIRUSGENERATOR_HPP
#define _INC_VIRUSGENERATOR_HPP

#include "VirusData.hpp"
#include "Constants.hpp"

#include <Engine/Mantis.hpp>

#include <algorithm>
#include <iostream>
#include <vector>
#include <algorithm>

const int SEQUENCE2ID[] = {6, 0, 7, 4, 3, 1, 5, 2};

class VirusGenerator {
private:
  Mantis::RandomNumberGenerator *randomGenerator;

  void generateColor(VirusData *virus);
  void generateBodyType(VirusData *virus);
  void generateWormBodyProfile(VirusData *virus);
  void generateAmoebaBodyProfile(VirusData *virus);
  void generateSphereProteins(VirusData *virus, unsigned int numSegments);
  void generateWormProteins(VirusData *virus);
  void generateAmoebaProteins(VirusData *virus);
  void generateSphereStats(VirusData *vrius);
  void generateWormStats(VirusData *virus);
  void generateAmoebaStats(VirusData *virus);

public:
  VirusGenerator();
  ~VirusGenerator();

  void test();

  VirusData *generateVirus(std::string sequence);
  VirusData *generateVirus(unsigned int id);
};

#endif
