import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItenListaPontilhada extends StatelessWidget {
  String textoIten;

  ItenListaPontilhada(this.textoIten, {super.key});

  var corBranca = Colors.white.value;

  @override
  Widget build(BuildContext context) {
    return
      Row(
        children: [
          const Padding(padding: EdgeInsets.all(20)),
          const Text("\u2022", style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 30)),
          const SizedBox(width: 12),
          Expanded(
            child: Text(textoIten, style: const TextStyle(color: Color(0xFFFFFFFF), fontSize: 16)),
          )
        ]
    );
  }
}