// import 'dart:math';
// import 'package:flutter/material.dart';
// import '../../../data/models/pokemon.dart';

// class PokemonDetailCard extends StatefulWidget {
//   final Pokemon pokemon;

//   const PokemonDetailCard({super.key, required this.pokemon});

//   @override
//   State<PokemonDetailCard> createState() => _PokemonDetailCardState();
// }

// class _PokemonDetailCardState extends State<PokemonDetailCard>
//     with SingleTickerProviderStateMixin {
//   bool _showFront = true;
//   late AnimationController _controller;

//   @override
//   void initState() {
//     _controller = AnimationController(
//       duration: const Duration(milliseconds: 500),
//       vsync: this,
//     );
//     super.initState();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   void _flipCard() {
//     setState(() {
//       _showFront = !_showFront;
//     });
//     _controller.forward(from: 0);
//   }

//   Color _typeColor(String type) {
//     switch (type.toLowerCase()) {
//       case 'electric':
//         return Colors.amber.shade600;
//       case 'grass':
//         return Colors.green.shade600;
//       case 'poison':
//         return Colors.purple.shade600;
//       case 'fire':
//         return Colors.red.shade400;
//       case 'water':
//         return Colors.blue.shade400;
//       case 'bug':
//         return Colors.lightGreen;
//       case 'normal':
//         return Colors.grey.shade600;
//       case 'psychic':
//         return Colors.pink.shade400;
//       case 'fighting':
//         return Colors.orange.shade800;
//       case 'ground':
//         return Colors.brown;
//       default:
//         return Colors.grey.shade400;
//     }
//   }

//   Widget _buildFront() {
//     final pokemon = widget.pokemon;

//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         CircleAvatar(
//           radius: 60,
//           backgroundColor: Colors.white,
//           child: ClipRRect(
//             borderRadius: BorderRadius.circular(60),
//             child: Image.network(
//               pokemon.spriteUrl,
//               height: 100,
//               width: 100,
//               fit: BoxFit.cover,
//               errorBuilder: (context, error, stackTrace) =>
//                   const Icon(Icons.error, size: 40),
//             ),
//           ),
//         ),
//         const SizedBox(height: 12),
//         Text(
//           '#${pokemon.id.toString().padLeft(3, '0')} ${pokemon.name[0].toUpperCase() + pokemon.name.substring(1)}',
//           style: const TextStyle(
//             fontSize: 22,
//             fontWeight: FontWeight.bold,
//             color: Color(0xFF3D005A),
//           ),
//           textAlign: TextAlign.center,
//         ),
//         const SizedBox(height: 12),
//         Wrap(
//           alignment: WrapAlignment.center,
//           spacing: 8,
//           children: pokemon.types.map((type) {
//             final color = _typeColor(type);
//             return Chip(
//               label: Text(
//                 type.toUpperCase(),
//                 style: TextStyle(
//                   color: color,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               backgroundColor: color.withOpacity(0.15),
//             );
//           }).toList(),
//         ),
//       ],
//     );
//   }

//   Widget _buildBack() {
//     final pokemon = widget.pokemon;

//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         if (pokemon.height != null)
//           Text('Altura: ${pokemon.height!.toStringAsFixed(1)} m'),
//         if (pokemon.weight != null)
//           Text('Peso: ${pokemon.weight!.toStringAsFixed(1)} kg'),
//         const SizedBox(height: 12),
//         if (pokemon.stats != null)
//           ...pokemon.stats!.entries.map((e) {
//             return Column(
//               children: [
//                 Align(
//                   alignment: Alignment.centerLeft,
//                   child: Text(
//                     e.key.toUpperCase(),
//                     style: const TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(10),
//                   child: LinearProgressIndicator(
//                     value: e.value / 100.0,
//                     backgroundColor: Colors.grey.shade300,
//                     color: Colors.deepPurple,
//                     minHeight: 10,
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//               ],
//             );
//           }),
//         if ((pokemon.evolutions ?? []).isNotEmpty) ...[
//           const SizedBox(height: 12),
//           const Text('Evoluções:',
//               style: TextStyle(fontWeight: FontWeight.bold)),
//           Wrap(
//             alignment: WrapAlignment.center,
//             spacing: 6,
//             children: pokemon.evolutions!
//                 .map((evo) => Chip(label: Text(evo)))
//                 .toList(),
//           ),
//         ],
//       ],
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       backgroundColor: Colors.transparent,
//       child: GestureDetector(
//         onTap: _flipCard,
//         child: AnimatedBuilder(
//           animation: _controller,
//           builder: (context, child) {
//             final angle = _controller.value * pi;
//             final isFront = _controller.value < 0.5;

//             return Transform(
//               alignment: Alignment.center,
//               transform: Matrix4.rotationY(angle),
//               child: Container(
//                 padding: const EdgeInsets.all(24),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(20),
//                   boxShadow: const [
//                     BoxShadow(
//                       color: Colors.black26,
//                       blurRadius: 16,
//                       offset: Offset(0, 6),
//                     )
//                   ],
//                 ),
//                 width: 320,
//                 child: AnimatedSwitcher(
//                   duration: const Duration(milliseconds: 500),
//                   switchInCurve: Curves.easeInOut,
//                   transitionBuilder: (child, anim) =>
//                       FadeTransition(opacity: anim, child: child),
//                   child: isFront
//                       ? _buildFront()
//                       : Transform(
//                           alignment: Alignment.center,
//                           transform: Matrix4.rotationY(pi),
//                           child: _buildBack(),
//                         ),
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
