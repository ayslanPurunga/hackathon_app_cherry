import 'package:flutter/material.dart';
import 'package:hackathon_cherry/widgets/lista_dados.dart';
import 'package:hackathon_cherry/widgets/imagem.dart';
import 'package:hackathon_cherry/widgets/barra_titulo.dart';
import 'package:hackathon_cherry/funcoes.dart';

class NovoPage extends StatefulWidget {
  @override
  _NovoPageState createState() => _NovoPageState();
}

class _NovoPageState extends State<NovoPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: BarraTitulo.criar("Carros Novos", iconeAcao: Icons.directions_car_outlined),
      body: Column(
        children: <Widget>[
          Expanded(
            child: FutureBuilder(
              future: Funcoes.getListaJson(
                  "https://run.mocky.io/v3/e09d6cdb-3d7b-4e76-a908-accf8721049c"),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                  case ConnectionState.none:
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Imagem.criarImagemWeb("images/", w: 300),
                          Text("Aguarde por favor..."),
                        ],
                      ),
                    );
                  default:
                    if (snapshot.hasError)
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Imagem.criarImagemWeb("images/", w: 300),
                            Text("Algo deu errado!"),
                          ],
                        ),
                      );
                    else
                      return ListaDados.criar(context, snapshot, Funcoes.LISTA_NOVOS);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
