import 'package:hackathon_cherry/funcoes.dart';
import 'package:hackathon_cherry/widgets/lista_dados_carro.dart';
import 'package:flutter/material.dart';

class ListaDados {
  static Widget criar(BuildContext context, AsyncSnapshot snapshot, int codigo) { //
    return ListView.builder(
      padding: EdgeInsets.all(6), //mantem a proporção pelas responsividade do aparelho
      scrollDirection: Axis.vertical,
      itemCount: snapshot.data.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            if (codigo == Funcoes.LISTA_VEICULOS) {
              ListaDadosCarro.cliqueItem(context, snapshot.data[index]);
            } else if( codigo == Funcoes.LISTA_USADOS) {
              ListaDadosCarro.cliqueItem(context, snapshot.data[index]);
            } else if( codigo == Funcoes.LISTA_NOVOS) {
              ListaDadosCarro.cliqueItem(context, snapshot.data[index]);
            }

            },

          child: Card(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: _retornaLista(codigo, snapshot.data[index]),
              ),
            ),
          );
      },
    );
  }

  static Widget _retornaLista(int codigo, Map dados) {
    switch (codigo) {
       case Funcoes.LISTA_VEICULOS:
           return ListaDadosCarro.criarItem(dados);
      case Funcoes.LISTA_NOVOS:
           return ListaDadosCarro.criarItem(dados);
      case Funcoes.LISTA_USADOS:
           return ListaDadosCarro.criarItem(dados);
        default:
          return Container();
}

  }
}