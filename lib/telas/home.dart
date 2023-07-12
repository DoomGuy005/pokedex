import 'package:flutter/material.dart';
import '../acesso/acesso_api.dart';
import '../dominio/classes/ItenListaPokemon.dart';
import '../componentes/iten_lista.dart';
import '../componentes/material_app.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  final tituloApp = 'Pokedex';

  @override
  Widget build(BuildContext context) {
    return AppMaterial(
      tituloApp,
      true,
      FutureBuilder(
        future: construirItensDaLista(),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return Container(
              child: const Center(
                child: Text("Recuperando lista de pokemons ... "),
              ),
            );
          } else {
            List<Widget>? listaWidgets = snapshot.data;
            if (listaWidgets == null) {
              return ListView(children: []);
            }
            return ListView(children: listaWidgets);
          }
        },
      ),
    );
  }
}

Future<List<Widget>> construirItensDaLista() async {
  List<Widget> listaDeItens = [];

  await fetchPokemons().then((resultado) {
    List<ItenListaPokemon> listaDePokemons = resultado;
    for (ItenListaPokemon pokemon in listaDePokemons) {
      listaDeItens.add(ItenLista(pokemon));
    }
  });

  return listaDeItens;
}

