import 'package:flutter/material.dart';
import 'package:flutter_breaking/constant/mycolors.dart';
import 'package:flutter_breaking/data/models/charectors.dart';

class CharectorModels extends StatelessWidget {
  const CharectorModels({super.key, required this.charectors});

  final charectorsmodel charectors;

  Widget buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          // ===== IMAGE =====
          Container(
            margin: const EdgeInsets.all(16),

            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage.assetNetwork(
                placeholder: "assets/images/Loading Dots In Yellow.gif",
                image: charectors.image!,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 300,
              ),
            ),
          ),

          // ===== NAME (Glow Effect) =====
          Text(
            charectors.name!,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: [
                Shadow(
                  blurRadius: 20,
                  color: Colors.yellow,
                  offset: Offset(0, 0),
                ),
                Shadow(
                  blurRadius: 40,
                  color: Colors.orange,
                  offset: Offset(0, 0),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // ===== DETAILS CARD =====
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[900],
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                buildInfoRow("Species", charectors.species!),
                const SizedBox(height: 10),
                buildInfoRow("Episodes", charectors.episode.toString()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildInfoRow(String title, String value) {
    return Row(
      children: [
        Text(
          "$title: ",
          style: const TextStyle(
            color: Colors.yellow,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: mycolors.myyelo,
        title: const Text(
          'Character Details',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: buildBody(),
    );
  }
}