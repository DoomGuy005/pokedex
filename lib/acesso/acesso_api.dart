import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:untitled/dominio/classes/ItenListaPokemon.dart';
import 'package:untitled/dominio/classes/ItenPokedex.dart';

Future<List<ItenListaPokemon>> fetchPokemons() async {
  final response = await http
      .get(Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=151'));

  final corpoResposta = jsonDecode(response.body);
  final listaPokemons = corpoResposta['results'];

  List<ItenListaPokemon> retorno = [];

  for (dynamic pokemon in listaPokemons) {
    retorno.add(ItenListaPokemon.fromJson(pokemon));
  }
  return retorno;
}

Future<ItenPokedex> fetchPokedexData(String nomePokemon) async {
  final response = await http
      .get(Uri.parse("https://pokeapi.glitch.me/v1/pokemon/$nomePokemon"));

  if (response.statusCode != 200) {
    throw Exception('ERROR');
  }

  final corpoResposta = jsonDecode(response.body);
  final dadosPokemon = corpoResposta[0];

  ItenPokedex retorno = ItenPokedex.fromJson(dadosPokemon);

  return retorno;
}