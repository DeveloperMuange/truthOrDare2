import 'package:flutter/material.dart';
import 'package:truth_or_dare/screens/dare_screen.dart';
import 'package:truth_or_dare/screens/truth_screen.dart';

class TruthOrDare extends StatefulWidget {
  final String womanName;
  final String manName;

  const TruthOrDare({
    Key? key,
    required this.womanName,
    required this.manName,
    required this.gameMode,
  }) : super(key: key);

  final String gameMode;

  @override
  State<TruthOrDare> createState() => _TruthOrDareState();
}

class _TruthOrDareState extends State<TruthOrDare> {
  bool _isWomanTurn = true;

  void _toggleTurn() {
    setState(() {
      _isWomanTurn = !_isWomanTurn;
    });
  }

  @override
  Widget build(BuildContext context) {
    final playerName = _isWomanTurn ? widget.womanName : widget.manName;
    return Scaffold(
      backgroundColor: Colors.pink,
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Text('Truth or Dare'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "$playerName's turn",
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                _toggleTurn();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TruthScreen(
                      gameMode: widget.gameMode,
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.pink,
                backgroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 48, vertical: 16),
              ),
              child: const Text(
                'TRUTH',
                style: TextStyle(fontSize: 24),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _toggleTurn();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DareScreen(gameMode: widget.gameMode),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.pink,
                backgroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 48, vertical: 16),
              ),
              child: const Text(
                'DARE',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
