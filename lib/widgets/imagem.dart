import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class Imagem {
  static Widget criarImagemWeb(String link, {double w, double h}) {
    return FadeInImage.memoryNetwork(
      placeholder: kTransparentImage,
      image: link,
      height: h,
      width: w,
    );
  }

  static Widget criar(String caminho, {double w, double h}) {
    return Image(
      image: NetworkImage(caminho),
      fit: BoxFit.cover,
      width: w,
      height: h,
    );
  }
}