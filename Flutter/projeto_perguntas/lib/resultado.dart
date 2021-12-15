import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;

  final void Function() quandoreiniciarQuestionario;

  Resultado(this.pontuacao, this.quandoreiniciarQuestionario);

  
  String get fraseResultado {
    if (pontuacao < 8) {
      return 'Parabéns!';
    } else if (pontuacao < 12) {
      return 'Você é bom!';
    } else if (pontuacao < 16) {
      return 'Impressionante!';
    } else {
      return 'Nível Jedi!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      
      children: [
        Center(
          child: Text(
          fraseResultado,
          style: TextStyle(fontSize: 28),
        )),
        Padding(padding: EdgeInsets.all(4)),
        TextButton(
          style: TextButton.styleFrom(backgroundColor: Colors.blue),
          child: Text(
            'Reiniciar?',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            )
          ),
          onPressed: quandoreiniciarQuestionario,
        )
      ],
    );
  }
}
