import 'package:flutter/material.dart';
import 'package:pokemon/domain/entities/pokemon.dart';

class PokemonDetailScreen extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonDetailScreen({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text('PokeDek'),
        actions: [
          Text(
            '#${pokemon.id}',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 30),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(35),
                  bottomRight: Radius.circular(35),
                ),
              ),
              child: Center(
                child: SizedBox(
                  height: 300,
                  width: 300,
                  child: Image.network(pokemon.image, fit: BoxFit.fill),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Text(pokemon.name, style: const TextStyle(fontSize: 25)),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 30,
              children: [
                ...pokemon.types.map<Widget>(
                  (type) => Chip(
                    label: Text(
                      type,
                      style: const TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Colors.grey,
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 10,
                children: [
                  ...pokemon.stats.map<Widget>(
                    (stat) => StatWidget(stat: stat),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}

class StatWidget extends StatelessWidget {
  final PokemonStat stat;

  const StatWidget({super.key, required this.stat});

  @override
  Widget build(BuildContext context) {
    const double maxValue = 270.0;

    final double currentValue = stat.baseStat.toDouble();

    final double totalWidth = MediaQuery.sizeOf(context).width;

    final double objectiveWidth = (totalWidth * currentValue) / maxValue;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(stat.name, style: const TextStyle(fontSize: 20)),
        const SizedBox(height: 10),
        Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                border: Border.all(width: 1, color: Colors.black),
                borderRadius: BorderRadius.circular(100),
              ),
              width: totalWidth,
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.red,
                border: Border.all(color: Colors.black, width: 1),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(100),
                  bottomLeft: Radius.circular(100),
                ),
              ),
              width: objectiveWidth,
              height: 20,
            ),

            Center(child: Text('${currentValue.toInt()}/${maxValue.toInt()}')),
          ],
        ),
      ],
    );
  }
}
