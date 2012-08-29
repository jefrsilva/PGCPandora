#ifndef _INC_LOGSYSTEM_HPP
#define _INC_LOGSYSTEM_HPP

#include "LoggerFactory.hpp"

#include <iostream>
#include <sstream>

namespace Mantis {
  const int LOG_STDOUT = 0;
  const int LOG_ENGINE = 1;
  const int LOG_GAME = 2;

  class LogSystem {
  private:
    static LogSystem *_instance;

    int logId;
    Logger *engineLog;
    Logger *gameLog;
    
    LogSystem();
    ~LogSystem();
    
  public:
    static LogSystem *instance();
    static void destroy();

    void output(int logType, std::string message);
  };

  class LogSystemDestroyer {
  public:
    ~LogSystemDestroyer();
  };
}

#endif
