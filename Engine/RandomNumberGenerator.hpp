#ifndef _INC_RANDOMNUMBERGENERATOR_HPP
#define _INC_RANDOMNUMBERGENERATOR_HPP

#include <cstdlib>

namespace Mantis {
  class RandomNumberGenerator {
  private:
    static RandomNumberGenerator *_instance;

    RandomNumberGenerator();
    ~RandomNumberGenerator();

  public:
    static RandomNumberGenerator *instance();
    static void destroy();

    void setSeed(unsigned int seed);
    double getProbability();
    double getRealNumberBetween(double min, double max);
    int getIntNumberBetween(int min, int max);
  };

  class RandomNumberGeneratorDestroyer {
  public:
    ~RandomNumberGeneratorDestroyer();
  };
}

#endif

