import 'package:flutter/material.dart';

class AppMaterial extends StatelessWidget {
  String tituloApp = '';
  Widget componenteParaExibir;
  bool ehHomepage = false;

  AppMaterial(this.tituloApp, this.ehHomepage, this.componenteParaExibir);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: tituloApp,
      theme: ThemeData(
          primarySwatch: Colors.red
      ),
      home: Scaffold(
          appBar: AppBar(title: Text(tituloApp),
          leading: ehHomepage == false ? BackButton(onPressed: () => Navigator.of(context).pop()) : null,
          ),
          body: componenteParaExibir
      ),
    );
  }
}