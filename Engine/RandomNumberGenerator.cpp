#include "RandomNumberGenerator.hpp"

namespace Mantis {
  RandomNumberGenerator *RandomNumberGenerator::_instance = 0;

  RandomNumberGenerator::RandomNumberGenerator() {

  }

  RandomNumberGenerator::~RandomNumberGenerator() {

  }

  RandomNumberGenerator *RandomNumberGenerator::instance() {
    if (!_instance) {
      _instance = new RandomNumberGenerator();
    }

    return _instance;
  }

  void RandomNumberGenerator::destroy() {
    if (_instance) {
      delete _instance;
      _instance = 0;
    }
  }

  void RandomNumberGenerator::setSeed(unsigned int seed) {
    srand(seed);
  }

  double RandomNumberGenerator::getProbability() {
    double p = (double)rand() / (double)RAND_MAX;
    
    return p;
  }

  double RandomNumberGenerator::getRealNumberBetween(double min, double max) {
    double p = getProbability();

    double number = min + (p * (max - min));

    return number;
  }

  int RandomNumberGenerator::getIntNumberBetween(int min,
						 int max) {
    double p = getProbability();
    
    int number = (int)(p * (double)(max - min + 1)) + min;

    return number;
  }

  RandomNumberGeneratorDestroyer::~RandomNumberGeneratorDestroyer() {
    RandomNumberGenerator::destroy();
  }

  RandomNumberGeneratorDestroyer randomNumberGeneratorDestroyer;
}
