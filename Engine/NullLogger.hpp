#ifndef _INC_NULLLOGGER_HPP
#define _INC_NULLLOGGER_HPP

#include "Logger.hpp"

#include <string>

namespace Mantis {
  class NullLogger : public Logger {
  public:
    NullLogger();
    ~NullLogger();
    
    void output(std::string message);
  };
}

#endif

