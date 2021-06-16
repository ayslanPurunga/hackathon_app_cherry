import 'package:flutter/material.dart';
import 'package:hackathon_cherry/funcoes.dart';
import 'package:hackathon_cherry/ui/novo_page.dart';
import 'package:hackathon_cherry/ui/usado_page.dart';
import 'package:hackathon_cherry/widgets/barra_drawer.dart';
import 'package:hackathon_cherry/widgets/barra_titulo.dart';
import 'package:hackathon_cherry/widgets/circulo_aguarde.dart';
import 'package:hackathon_cherry/widgets/lista_dados.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {

    List<Map> lista_itens = [
      {"texto" : "Carros Novos", "iconeAcao" : "", "evento" : _listaNovo},
      {"texto" : "Carros Usados", "iconeAcao" : "", "evento" : _listaUsado},
    ];

    return Scaffold(
      appBar: BarraTitulo.criar("Cherry Veículos"),
      drawer: BarraDrawer.criar(context, "Cherry Veículos", Colors.red[900], Colors.white, lista_itens,
        iconeTitulo: Icons.directions_car_outlined,),
      backgroundColor: Colors.grey[100],
      body: Column(
        children: <Widget>[
          Expanded(
            child: FutureBuilder(
              future: Funcoes.getListaJson("http://192.168.1.102:3000/api/v1/veiculos"),
              builder: (context, snapshot) {
                switch(snapshot.connectionState) {
                  case ConnectionState.waiting:
                  case ConnectionState.none:
                    return CirculoAguarde.criar();
                  default:
                    if (snapshot.hasError)
                      return Text("Erro!!! " + snapshot.error.toString());
                    else
                      return ListaDados.criar(context, snapshot, Funcoes.LISTA_VEICULOS);
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  void _listaNovo(){
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => NovoPage()
    ));
  }
  void _listaUsado(){
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => UsadoPage()
    ));
  }

}
