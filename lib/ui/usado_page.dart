import 'package:flutter/material.dart';
import 'package:hackathon_cherry/widgets/lista_dados.dart';
import 'package:hackathon_cherry/widgets/imagem.dart';
import 'package:hackathon_cherry/widgets/barra_titulo.dart';
import 'package:hackathon_cherry/funcoes.dart';

class UsadoPage extends StatefulWidget {
  @override
  _UsadoPageState createState() => _UsadoPageState();
}

class _UsadoPageState extends State<UsadoPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: BarraTitulo.criar("Carros Usados", iconeAcao: Icons.directions_car_outlined),
      body: Column(
        children: <Widget>[
          Expanded(
            child: FutureBuilder(
              future: Funcoes.getListaJson(
                  "https://run.mocky.io/v3/550935bd-0e87-4405-b863-36b97163448c"),
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
                      return ListaDados.criar(context, snapshot, Funcoes.LISTA_USADOS);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
