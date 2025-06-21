import '../models/pokemon.dart';
import '../sources/api_service.dart';

class PokemonRepository {
  final ApiService apiService;

  PokemonRepository({required this.apiService});

  /// Busca a lista de Pokémons de um time pelo ID do time.
  /// Retorna uma lista de objetos Pokemon.
  Future<List<Pokemon>> getTeamPokemons(int teamId) async {
    final List<dynamic> jsonList = await apiService.fetchTeamPokemons(teamId);

    // Converte a lista dinâmica JSON em lista de objetos Pokemon
    return jsonList.map((json) => Pokemon.fromJson(json)).toList();
  }

  // Você pode adicionar outros métodos como:
  // Future<List<Pokemon>> getAllPokemons();
  // Future<void> addPokemonToTeam(int teamId, int pokemonId);
  // Future<void> removePokemonFromTeam(int teamId, int pokemonId);
}
