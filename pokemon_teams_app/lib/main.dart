import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'src/app.dart';
import 'src/data/repositories/pokemon_repository.dart';
import 'src/data/sources/api_service.dart';
import 'src/presentation/providers/pokemon_provider.dart';

void main() {
  final apiService = ApiService(baseUrl: 'http://localhost:3000');
  final repository = PokemonRepository(apiService: apiService);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => PokemonProvider(repository: repository),
        ),
      ],
      child: const MyApp(),
    ),
  );
}
