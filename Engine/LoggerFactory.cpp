#include "LoggerFactory.hpp"

namespace Mantis {
  LoggerFactory *LoggerFactory::_instance = 0;
  
  LoggerFactory::LoggerFactory() {
    
  }
  
  LoggerFactory::~LoggerFactory() {
    
  }
  
  LoggerFactory *LoggerFactory::instance() {
    if (!_instance) {
      _instance = new LoggerFactory();
    }
    
    return _instance;
  }
  
  void LoggerFactory::destroy() {
    if (_instance) {
      delete _instance;
      _instance = 0;
    }
  }
  
  Logger *LoggerFactory::createLogger(std::string filename) {
    Logger *logger;
    
#ifdef DEBUG
    logger = new FileLogger(filename);
#else
    logger = new NullLogger();
#endif
    
    return logger;
  }
}
