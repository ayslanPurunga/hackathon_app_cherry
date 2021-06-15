import 'package:hackathon_cherry/funcoes.dart';
import 'package:flutter/material.dart';


class Botao {

  static Widget criar(String texto, Function clique, {IconData icone, double tamanhoBotao = 150,
  Color cor = Colors.blue}) {

    return ElevatedButton(
        child: Container(
          width: 150,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icone != null ? Icon(icone) : Container(),
            Text(texto, style: TextStyle(color: Colors.white, fontSize: 25),),
          ],
         ),
        ),

        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blue[900])),
        onPressed: clique,
      );
  }

  static Widget criarBotaoBarra(IconData icone, Function evento) {
    return IconButton(
    icon: Funcoes.criarIcone(icone),
    onPressed: evento,
    );
  }

  static Widget criarBotaoFlutuante(IconData icone, Function evento) {
    return FloatingActionButton(
      backgroundColor: Colors.blue[900],
      child: Icon(Icons.mail_outline, color: Colors.white,),
      onPressed: evento,
    );
  }

}

