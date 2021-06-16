import 'package:flutter/cupertino.dart';
import 'package:hackathon_cherry/funcoes.dart';
import 'package:hackathon_cherry/ui/destaque_page.dart';
import 'package:hackathon_cherry/widgets/imagem.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ListaDadosCarro {
  static void cliqueItem(BuildContext context, Map dados) {
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => DestaquePage(dados)
    ));
  }

  static Widget criarItem(Map dados) {
    Intl.defaultLocale = 'pt_BR';
    // return Row(
    //   children: <Widget>[
    //     Flexible(child:
    //       Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: <Widget>[
    //           Imagem.criar(dados["foto"],
    //               h: 150, w:175
    //           ),
    //           Text(dados["modelo"].toString(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    //           ),
    //           // Text(dados["marca"]["descricao"].toString() + " - " + dados["modelo"].toString(), style: TextStyle(fontSize: 20)),
    //           // Text(dados["anomodelo"].toString() + "/"+ dados["anofabricacao"].toString() + " " + dados["cor"]["descricao"].toString(), style: TextStyle(fontSize: 18, color: Color(0xFF57606f))),
    //           // Text(dados["tipo"].toString(), style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
    //           Text(
    //             _getCurrency(dados["valor"]), style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    //           ),
    //
    //         ],
    //
    //       ),
    //     ),
    //   ],
    // );
    return Row(
      children: [
        Column(
          children: [
            Imagem.criar(dados["foto"], h: 120, w: 180)
          ],
        ),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(dados["modelo"].toString(), style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Text(dados["marca"].toString()),
              Text(dados["anofabricacao"].toString() + "/" + dados["anomodelo"]),
              Text(Funcoes.getCurrency(dados["valor"])),
            ],
          ),
        )
      ],
    );
  }

  static String _getCurrency(value) {
    NumberFormat.simpleCurrency(locale: 'pt_BR');
    NumberFormat formatter = NumberFormat.simpleCurrency();
    return formatter.format(value);
  }
}