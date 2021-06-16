import 'package:flutter/material.dart';
import 'package:hackathon_cherry/widgets/circulo_aguarde.dart';
import 'package:hackathon_cherry/widgets/lista_dados.dart';
import 'package:hackathon_cherry/widgets/imagem.dart';
import 'package:hackathon_cherry/widgets/barra_titulo.dart';
import 'package:hackathon_cherry/funcoes.dart';

class NovoPage extends StatefulWidget {
  @override
  _NovoPageState createState() => _NovoPageState();
}

class _NovoPageState extends State<NovoPage> {

  final URL_API = "http://192.168.1.102:3000/api/v1/veiculos/novos";

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: BarraTitulo.criar("Veículos Novos"),
      body: Column(
        children: <Widget>[
          Expanded(
            child: FutureBuilder(
              future: Funcoes.getListaJson(URL_API),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                  case ConnectionState.none:
                    return CirculoAguarde.criar();
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
