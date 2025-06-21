import 'package:flutter/material.dart';
import '../../data/models/pokemon.dart';
import '../../presentation/screens/widgets/pokemon_detail_card.dart';

class PokemonListScreen extends StatelessWidget {
  final List<Pokemon> pokemons;

  const PokemonListScreen({super.key, required this.pokemons});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF8A05BE),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Seu Time Pokémon',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),
        child: ListView.builder(
          itemCount: pokemons.length,
          itemBuilder: (context, index) {
            final pokemon = pokemons[index];
            return _PokemonCard(pokemon: pokemon);
          },
        ),
      ),
    );
  }
}

class _PokemonCard extends StatelessWidget {
  final Pokemon pokemon;

  const _PokemonCard({required this.pokemon});

  Color _typeColor(String type) {
    switch (type.toLowerCase()) {
      case 'electric':
        return Colors.amber.shade600;
      case 'grass':
        return Colors.green.shade600;
      case 'poison':
        return Colors.purple.shade600;
      case 'fire':
        return Colors.red.shade400;
      case 'water':
        return Colors.blue.shade400;
      case 'bug':
        return Colors.lightGreen;
      case 'normal':
        return Colors.grey.shade600;
      case 'psychic':
        return Colors.pink.shade400;
      case 'fighting':
        return Colors.orange.shade800;
      case 'ground':
        return Colors.brown;
      default:
        return Colors.grey.shade400;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (_) => PokemonDetailCard(pokemon: pokemon),
        );
      },
      child: Card(
        margin: const EdgeInsets.only(bottom: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 4,
        shadowColor: Colors.black26,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: Row(
            children: [
              // Imagem do Pokémon
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  pokemon.spriteUrl,
                  height: 64,
                  width: 64,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.error),
                ),
              ),
              const SizedBox(width: 20),

              // Nome + Tipos
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      pokemon.name[0].toUpperCase() +
                          pokemon.name.substring(1).toLowerCase(),
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF3D005A),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: pokemon.types.map((type) {
                        return Container(
                          margin: const EdgeInsets.only(right: 8),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: _typeColor(type).withOpacity(0.15),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            type.toUpperCase(),
                            style: TextStyle(
                              color: _typeColor(type),
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right, color: Color(0xFF8A05BE)),
            ],
          ),
        ),
      ),
    );
  }
}
