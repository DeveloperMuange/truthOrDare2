import 'package:flutter/material.dart';
import 'package:truth_or_dare/screens/truth_or_dare_screen.dart';

class GameMode extends StatelessWidget {
  const GameMode({
    Key? key,
    required this.manName,
    required this.womanName,
    required this.gameMode,
  }) : super(key: key);

  final String manName;
  final String womanName;
  final String gameMode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Text('Game Mode'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TruthOrDare(
                      manName: manName,
                      womanName: womanName,
                      gameMode: 'Easy',
                    ),
                  ),
                );
              },
              child: const Text(
                '😍 Easy',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TruthOrDare(
                      manName: manName,
                      womanName: womanName,
                      gameMode: 'Spicy',
                    ),
                  ),
                );
              },
              child: const Text('😎 Spicy',
                  style: TextStyle(fontSize: 24, color: Colors.white)),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TruthOrDare(
                      manName: manName,
                      womanName: womanName,
                      gameMode: 'Steamy',
                    ),
                  ),
                );
              },
              child: const Text('🥶 Steamy',
                  style: TextStyle(fontSize: 24, color: Colors.white)),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TruthOrDare(
                      manName: manName,
                      womanName: womanName,
                      gameMode: 'Intense',
                    ),
                  ),
                );
              },
              child: const Text('🥵 Intense',
                  style: TextStyle(fontSize: 24, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
