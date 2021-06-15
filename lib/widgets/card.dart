import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackathon_cherry/widgets/imagem.dart';
import 'package:imc_flutter/widgets/imagem.dart';

class Carta {
  static Widget criar(modelo, marca) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AspectRatio(
            aspectRatio: 18.0 / 11.0,
            child: Imagem.criar("https://hackaton-img.s3.us-east-2.amazonaws.com/1623608139709_14817.jpeg"),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(modelo),
                SizedBox(height: 8.0,),
                Text(marca)
              ],
            ),
          )
        ],
      ),
    );
  }
}