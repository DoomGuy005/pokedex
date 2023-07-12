import 'package:flutter/material.dart';
import 'package:untitled/dominio/classes/ItenPokedex.dart';
import 'package:untitled/componentes/iten_lista_pontilhada.dart';
import 'package:untitled/acesso/acesso_api.dart';
import '../componentes/material_app.dart';

class DetailScreen extends StatelessWidget {
  String nomePokemon;

  DetailScreen(this.nomePokemon, {super.key});

  @override
  Widget build(BuildContext context) {
    return AppMaterial(
      nomePokemon,
      false,
      FutureBuilder(
        future: fetchPokedexData(nomePokemon),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return Container(
              child: const Center(
                child: Text("Retrieving pokemon data ... "),
              ),
            );
          } else {
            ItenPokedex? resultado = snapshot.data;
            if (resultado == null) {
              return Container(
                child: const Center(
                  child: Text("Failed to retrieve data :-("),
                ),
              );
            }
            return Column(
              children: [
                ListTile(
                    title: const Text('Pokemon data'),
                    subtitle: null,
                    iconColor: Color(Colors.white.value),
                    textColor: Color(Colors.white.value)
                ),
                Column(children: gerarItensDaListaPontilhada(resultado)),
              ],
            );
          }
        },
      ),
    );
  }

  Future<ItenPokedex> construirItensDaLista() async {
    ItenPokedex iten = await fetchPokedexData(nomePokemon).then((
        resultado) => resultado);
    return iten;
  }

}
gerarItensDaListaPontilhada (ItenPokedex dadosDoPokemon) {
  List<Widget> listaDeItensPontilhados = [];
  listaDeItensPontilhados.add(ItenListaPontilhada("Name - ${dadosDoPokemon.name}"));
  listaDeItensPontilhados.add(ItenListaPontilhada("Species - ${dadosDoPokemon.species}"));
  listaDeItensPontilhados.add(ItenListaPontilhada("Pokedex Number - #${dadosDoPokemon.number}"));
  listaDeItensPontilhados.add(ItenListaPontilhada("Generation - ${dadosDoPokemon.gen}"));
  listaDeItensPontilhados.add(ItenListaPontilhada(" - ${dadosDoPokemon.gen}"));
  return listaDeItensPontilhados;
}

