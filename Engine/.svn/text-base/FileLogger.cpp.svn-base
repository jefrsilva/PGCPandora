#include "FileLogger.hpp"

namespace Mantis {
  FileLogger::FileLogger(std::string filename) {
    logFile.open(filename.c_str(), std::ios::out | std::ios::trunc);
  }
  
  FileLogger::~FileLogger() {
    logFile.close();
  }
  
  void FileLogger::output(std::string message) {
    logFile << message << std::endl;
  }
}

