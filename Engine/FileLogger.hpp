#ifndef _INC_FILELOGGER_HPP
#define _INC_FILELOGGER_HPP

#include "Logger.hpp"

#include <fstream>
#include <string>

namespace Mantis {
  class FileLogger : public Logger {
  private:
    std::fstream logFile;
    
  public:
    FileLogger(std::string filename);
    ~FileLogger();
    
    void output(std::string message);
  };
}

#endif
