#include "PandoraGame.hpp"

PandoraGame::PandoraGame() {
  Mantis::initialize();

  log = Mantis::LogSystem::instance();
  log->output(Mantis::LOG_GAME, "PandoraGame :: constructor");
}

PandoraGame::~PandoraGame() {
  log->output(Mantis::LOG_GAME, "PandoraGame :: destructor");

  Mantis::shutdown();
}

void PandoraGame::run() {
  log->output(Mantis::LOG_GAME, "PandoraGame :: run");

  Mantis::VideoSystem *video = Mantis::VideoSystem::instance();
  video->setVideoMode(1024, 768, 32, false);
  video->setWindowTitle("Pandora");

  Mantis::StateManager::instance()->push(new VirusViewer());
  Mantis::StateManager::instance()->run();
}
