import 'package:hackathon_cherry/funcoes.dart';
import 'package:hackathon_cherry/widgets/botao.dart';
import 'package:flutter/material.dart';

class BarraTitulo {
  static Widget criar(String titulo,
      {IconData iconeAcao, Function eventoAcao, bool tituloCentralizado = true, IconData icone}) {
    return AppBar(
      backgroundColor: Colors.red[700],
      title: Row(
        children: [
          Funcoes.criarIcone(iconeAcao),
          Text(titulo),
        ],
      ),
      centerTitle: tituloCentralizado,
      actions: [
        Botao.criarBotaoBarra(iconeAcao, eventoAcao),
      ],
    );
  }

  static Widget _criarBotaoAcao(IconData iconeAcao, Function eventoAcao) {
    return iconeAcao != null
        ? Botao.criarBotaoBarra(iconeAcao, eventoAcao)
        : Container();
  }

}