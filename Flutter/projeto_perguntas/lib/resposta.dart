import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;

  final void Function() quandoSelecionado;

  Resposta(this.texto, this.quandoSelecionado);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(0, 4, 0, 4),
      child: TextButton(
        style: TextButton.styleFrom(backgroundColor: Colors.blue),
        child: Text(
          texto,
          style: TextStyle(
            color: Colors.white,
          ),
        ),  
        onPressed: quandoSelecionado,
      ),
    );
  }
}
