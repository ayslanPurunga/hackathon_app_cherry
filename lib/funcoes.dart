import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:intl/intl.dart';

class Funcoes {
  static const LISTA_VEICULOS = 1;
  static const LISTA_NOVOS = 2;
  static const LISTA_USADOS = 3;

  static Widget _criarIconeEspacado(IconData icone, Color cor, double tamanho) {
    return Padding(
      padding: EdgeInsets.all(4),
      child: Icon(icone),
    );
  }

  static Widget criarIcone(IconData icone, {Color cor, double tamanho}) {
    return icone != null ? _criarIconeEspacado(icone, cor, tamanho) : Container();
  }


  void mostrarMensagem(BuildContext context, String tituloMensagem, String corpoMensagem) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(tituloMensagem),
            content: Text(corpoMensagem),
            actions: [
              TextButton(
                  onPressed: () { _fecharTelaAtual(context); },
                  child: Text("OK")
              ),
            ],
          );
        }
    );
  }
  void _fecharTelaAtual(BuildContext context) {
    Navigator.pop(context);
  }

  static String corrigeLinkImagem(String link) {
    return link.replaceAll("~/", "https://run.mocky.io/v3/55e72764-1835-4ebf-a112-965e835590bf");

  }

  static Future<List<dynamic>>getListaJson(String link) async {
    Uri uri = Uri.parse(link);
    http.Response response = await http.get(uri);
    return json.decode(response.body);

  }

  static String getCurrency(value) {
    NumberFormat.simpleCurrency(locale: 'pt_BR');
    NumberFormat formatter = NumberFormat.simpleCurrency();
    return formatter.format(value);
  }
}