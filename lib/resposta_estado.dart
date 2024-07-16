import 'package:flutter/material.dart';
import 'resposta.dart';

class RespostaEstado extends StatefulWidget {
  const RespostaEstado({super.key});

  @override
  State<RespostaEstado> createState() => _RespostaEstadoState();
}

class _RespostaEstadoState extends State<RespostaEstado> {
  int pontos = 0;
  int ultimoValor = 0;
  String resultado = 'Jogue o dado para começar';

  void jogarDado() {
    setState(() {
      resultado = processarJogada();
    });
  }

  String processarJogada() {
    final valorDado = Resposta().valorDado();
    if (valorDado == 5) {
      return 'Tirou 5, repita sem somar pontos';
    } else if (valorDado == 1 || valorDado == 3) {
      pontos = 0;
      return 'Tirou $valorDado, perdeu a vez';
    } else {
      pontos += valorDado;
      if (pontos == 10) {
        pontos = 0; // Resetar pontos após ganhar
        return 'Tirou $valorDado, somou 10 pontos e ganhou!';
      } else if (pontos > 10) {
        pontos = 0; // Resetar pontos após perder
        return 'Tirou $valorDado, ultrapassou 10 pontos e perdeu!';
      } else if (valorDado == ultimoValor) {
        return 'Tirou $valorDado novamente, soma os pontos e repete';
      }
      ultimoValor = valorDado;
      return 'Tirou $valorDado, pontos: $pontos';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          resultado,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 24),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: jogarDado,
          child: const Text('Jogar Dado'),
        ),
      ],
    );
  }
}
