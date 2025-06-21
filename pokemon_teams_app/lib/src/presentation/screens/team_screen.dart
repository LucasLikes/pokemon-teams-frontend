import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/pokemon_provider.dart';
import 'pokemon_list_screen.dart';

class TeamScreen extends StatefulWidget {
  final int teamId;
  const TeamScreen({super.key, required this.teamId});

  @override
  State<TeamScreen> createState() => _TeamScreenState();
}

class _TeamScreenState extends State<TeamScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = context.read<PokemonProvider>();
      provider.loadTeamPokemons(widget.teamId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF8A05BE),
      body: Consumer<PokemonProvider>(
        builder: (context, provider, _) {
          if (provider.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (provider.error != null) {
            return Center(child: Text('Erro: ${provider.error}'));
          }
          if (provider.pokemons.isEmpty) {
            return const Center(child: Text('Nenhum Pokémon encontrado.'));
          }

          // Aqui chama a nova UI
          return PokemonListScreen(pokemons: provider.pokemons);
        },
      ),
    );
  }
}
