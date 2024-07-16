import 'dart:math';

class Resposta {
  int valorDado() {
    return Random().nextInt(6) + 1; // Gera um número entre 1 e 6
  }
}
