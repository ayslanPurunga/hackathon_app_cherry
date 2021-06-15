import 'package:hackathon_cherry/funcoes.dart';
import 'package:hackathon_cherry/widgets/barra_titulo.dart';
import 'package:hackathon_cherry/widgets/imagem.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:share/share.dart';

class DestaquePage extends StatelessWidget {
  final Map dadosCarro;

  DestaquePage(this.dadosCarro);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BarraTitulo.criar(dadosCarro["modelo"], iconeAcao: Icons.share),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                    Imagem.criarImagemWeb(
                      Funcoes.corrigeLinkImagem(dadosCarro["fotoDestaque"].toString()),
                    ),
                   Text(dadosCarro["modelo"].toString(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                   ),
                   Text(dadosCarro["marca"]["descricao"].toString() + " - " + dadosCarro["modelo"].toString(), style: TextStyle(fontSize: 20)),
                   Text(dadosCarro["anomodelo"].toString() + "/"+ dadosCarro["anofabricacao"].toString() + " " + dadosCarro["cor"]["descricao"].toString(), style: TextStyle(fontSize: 18, color: Color(0xFF57606f))),
                   Text(dadosCarro["tipo"].toString(), style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                   Text(
                     _getCurrency(dadosCarro["valor"]), style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                   ),

               ],
             ),
    );
  }
  
  static String _getCurrency(value) {
    NumberFormat.simpleCurrency(locale: 'pt_BR');
    NumberFormat formatter = NumberFormat.simpleCurrency();
    return formatter.format(value);
  }

}
