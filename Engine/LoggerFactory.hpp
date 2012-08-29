#ifndef _INC_LOGGERFACTORY_HPP
#define _INC_LOGGERFACTORY_HPP

#include "Logger.hpp"
#include "FileLogger.hpp"
#include "NullLogger.hpp"

#include <iostream>

namespace Mantis {
  class LoggerFactory {
  private:
    static LoggerFactory *_instance;
    
    LoggerFactory();
    ~LoggerFactory();
    
  public:
    static LoggerFactory *instance();
    static void destroy();
    
    Logger *createLogger(std::string filename);
  };
  
  extern class LoggerFactoryDestroyer {
  public:
    ~LoggerFactoryDestroyer() { LoggerFactory::destroy(); };
  } loggerFactoryDestroyer;
}

#endif

