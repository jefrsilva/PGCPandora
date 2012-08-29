#include <Game/PandoraGame.hpp>

int main(int argc, char *argv[]) {
  PandoraGame *game = new PandoraGame();
  game->run();
  delete game;

  return 0;
}
