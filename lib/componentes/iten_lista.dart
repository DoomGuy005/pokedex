import 'package:flutter/material.dart';
import 'package:untitled/dominio/classes/ItenListaPokemon.dart';
import '../telas/detalhar_pokemon.dart';

class ItenLista extends StatelessWidget {
  ItenListaPokemon pokemon;
  String titulo = 'Sole UMa';

  ItenLista(this.pokemon,{super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(Colors.red.value),
      child: InkWell (
          child: Column(
          children: <Widget>[
            ListTile(
              title: Text(pokemon.name),
              subtitle: null,
              iconColor: Color(Colors.white.value),
              textColor: Color(Colors.white.value)
            ),
          ],
        ),
        onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DetailScreen(pokemon.name),
              ),
            );
          },
      )
    );
  }
}