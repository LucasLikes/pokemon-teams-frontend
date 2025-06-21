import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl;

  ApiService({required this.baseUrl});

  Future<List<dynamic>> fetchTeamPokemons(int teamId) async {
    final url = Uri.parse('$baseUrl/teams/$teamId/pokemons');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data is List) {
          print(data);
          return data;
        } else {
          throw Exception('Formato de dados inesperado');
        }
      } else {
        throw Exception('Erro na resposta: ${response.statusCode}');
      }
    } catch (e) {
      // Aqui pode ter mais tratamento ou logging
      rethrow;
    }
  }

  // Você pode adicionar outros métodos para outros endpoints,
  // Exemplo: fetchTrainers, fetchTeams, addPokemonToTeam, etc.
}
