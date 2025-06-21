import 'package:flutter/material.dart';
import '../../data/models/pokemon.dart';
import '../../data/repositories/pokemon_repository.dart';

class PokemonProvider extends ChangeNotifier {
  final PokemonRepository repository;

  PokemonProvider({required this.repository});

  List<Pokemon> pokemons = [];
  bool loading = false;
  String? error;

  Future<void> loadTeamPokemons(int teamId) async {
    loading = true;
    error = null;
    notifyListeners();

    try {
      pokemons = await repository.getTeamPokemons(teamId);
    } catch (e) {
      error = e.toString();
    }

    loading = false;
    notifyListeners();
  }
}
