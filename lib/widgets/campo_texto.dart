import 'package:flutter/material.dart';

class CampoTexto {
 static Widget criar(String texto, String prefixo, TextEditingController controller, TextInputType teclado) {
    return Container(
      padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
      child:TextField(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: texto,
          labelStyle: TextStyle(color: Colors.black, fontSize: 80),
          prefixText: prefixo,
          prefixStyle: TextStyle(color: Colors.green[500], fontSize: 25),
        ),
        style: TextStyle(color: Colors.green[900], fontSize: 80),
        keyboardType: teclado,
      ),
    );
  }

  
}