#ifndef _INC_LOGGER_HPP
#define _INC_LOGGER_HPP

#include <string>

namespace Mantis {
  class Logger {
  public:
    virtual ~Logger() {};
    
    virtual void output(std::string message) = 0;
  };
}

#endif

