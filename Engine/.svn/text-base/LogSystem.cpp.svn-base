#include "LogSystem.hpp"

namespace Mantis {
  LogSystem *LogSystem::_instance = 0;
  
  LogSystem::LogSystem() {
    logId = 0;
    engineLog = LoggerFactory::instance()->createLogger("engine.log");
    gameLog = LoggerFactory::instance()->createLogger("game.log");
  }

  LogSystem::~LogSystem() {
    delete engineLog;
    delete gameLog;
  }

  LogSystem *LogSystem::instance() {
    if (!_instance) {
      _instance = new LogSystem();
    }

    return _instance;
  }

  void LogSystem::destroy() {
    if (_instance) {
      delete _instance;
      _instance = 0;
    }
  }

  void LogSystem::output(int logType, std::string message) {
    std::stringstream out;
    logId++;

    switch (logType) {
    case LOG_STDOUT:
      std::cout << logId << " :: " << message << std::endl;
      break;

    case LOG_ENGINE:
      out << logId << " :: " << message;
      engineLog->output(out.str());
      break;

    case LOG_GAME:
      out << logId << " :: " << message;
      gameLog->output(out.str());
      break;
    }
  }

  LogSystemDestroyer::~LogSystemDestroyer() {
    LogSystem::destroy();
  }

  LogSystemDestroyer logSystemDestroyer;
}
