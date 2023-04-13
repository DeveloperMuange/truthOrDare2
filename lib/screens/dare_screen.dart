import 'dart:math';

import 'package:flutter/material.dart';

class DareScreen extends StatelessWidget {
  final String gameMode;

  DareScreen({
    Key? key,
    required this.gameMode,
  }) : super(key: key);

  final dare = Dare();

  @override
  Widget build(BuildContext context) {
    final String dareText = dare.getNextDare(gameMode: gameMode);
    return Scaffold(
      backgroundColor: Colors.pink,
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Text('Dare'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            dareText,
            style: const TextStyle(fontSize: 24.0, color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class Dare {
  static final _dareGameModes = <String, List<String>>{
    "Easy": [
      "Tickle your partner for 30 seconds.",
      "Give your partner a 5-minute back massage.",
      "Kiss your partner on the forehead.",
      "Share a piece of candy with your partner.",
      "Dance with your partner for 1 minute.",
      "Feed your partner a piece of fruit.",
      "Compliment your partner.",
      "Play a round of rock-paper-scissors with your partner, and the loser takes a shot of water.",
      "Draw a picture of your partner in 30 seconds.",
      "Write a love letter to your partner (5 sentences minimum).",
      "Share a childhood memory with your partner.",
      "Sing a song to your partner.",
      "Give your partner a hug.",
      "Tell your partner why you love them.",
      "Whisper something sweet to your partner.",
      "Draw a heart on your partner's palm with a pen.",
      "Take a selfie with your partner.",
      "Play a game of thumb war with your partner.",
      "Share your favorite memory with your partner.",
      "Put your hand on your partner's heart and tell them how much you love them.",
      "Compliment your partner's outfit.",
      "Share a funny story with your partner.",
      "Make your partner laugh.",
      "Take turns telling each other something you love about the other person.",
      "Give your partner a kiss on the cheek.",
      "Tell your partner how they make you a better person.",
      "Play a game of 20 questions with your partner.",
      "Write a short poem about your partner.",
      "Say 'I love you' to your partner.",
      "Talk about your dreams and aspirations with your partner.",
      "Surprise your partner with a small gift.",
      "Share your favorite food with your partner.",
      "Take a walk with your partner.",
      "Tell your partner something you've never told anyone else.",
      "Share a book you've enjoyed with your partner.",
      "Play a round of 'would you rather' with your partner.",
      "Share your favorite song with your partner.",
      "Give your partner a compliment they've never heard before.",
      "Whisper in your partner's ear something you've always wanted to do with them.",
      "Play a game of hangman with your partner.",
      "Take a photo of your partner doing something silly.",
      "Tell your partner what you admire most about them.",
      "Have a conversation with your partner without using any words.",
      "Tell your partner about your favorite childhood toy.",
      "Sing a love song to your partner.",
      "Tell your partner your favorite thing about their personality.",
      "Make your partner breakfast in bed.",
      "Share a funny meme with your partner.",
      "Take turns giving each other a compliment."
    ],
    "Spicy": [
      "Give your partner a sensual massage for 10 minutes.",
      "Use only your mouth to take off your partner's clothes.",
      "Make out with your partner for at least five minutes without stopping.",
      "Give your partner a lap dance while they're sitting in a chair.",
      "Use a blindfold on your partner and tease them with different sensations.",
      "Have a shower together and wash each other's bodies.",
      "Feed each other fruit or chocolate in a sensual way.",
      "Whisper a secret fantasy in your partner's ear.",
      "Make a sextape together.",
      "Take a sensual photo together.",
      "Spend a whole day together in bed, only getting up for food and bathroom breaks.",
      "Share a bubble bath together with candles and wine.",
      "Put on sexy lingerie for your partner and give them a lap dance.",
      "Give your partner a sensual kiss on their neck for one minute.",
      "Undress your partner with your teeth.",
      "Go skinny dipping together.",
      "Use ice cubes to tease your partner's body.",
      "Have a quickie in a public place (be careful not to get caught!).",
      "Play a strip version of any game together.",
      "Write an erotic story together, taking turns adding to it.",
      "Make a sexy drawing or painting of each other.",
      "Wear a vibrating panty in public while your partner has the remote control.",
      "Give your partner a sensual foot massage.",
      "Play truth or dare, but only choose dares.",
      "Put on a strip tease for your partner.",
      "Do a sensual dance for your partner.",
      "Watch a porn movie together and act out what you see.",
      "Take turns blindfolding each other and using your other senses to explore each other's bodies.",
      "Role-play a fantasy scenario with your partner.",
      "Buy a sex toy together and try it out.",
      "Give each other a sensual oil massage.",
      "Take turns giving each other a sensual lap dance.",
      "Get dressed up in sexy outfits and go out to a bar or club together.",
      "Take a shower together and wash each other's hair.",
      "Go on a romantic weekend getaway and spend the whole time in bed.",
      "Do a naked photoshoot together.",
      "Play a game of strip poker together.",
      "Make out in a movie theater.",
      "Tie each other up and explore different sensations.",
      "Watch each other masturbate.",
      "Give your partner a sensual bath.",
      "Write love letters to each other with sexy or romantic messages.",
      "Spend an entire day naked together.",
      "Do a sensual yoga session together.",
      "Play a game of naughty charades.",
      "Spend a night at a hotel and order room service while wearing only lingerie or underwear.",
      "Explore each other's erogenous zones with a feather or other soft object.",
      "Give each other a sensual body scrub.",
      "Do a strip tease for your partner while they are blindfolded.",
      "Have sex in a new and unusual location, like on a balcony or rooftop.",
    ],
    "Steamy": [
      "Give your partner a sensual massage for 10 minutes, focusing on their erogenous zones.",
      "Whisper your deepest sexual fantasy into your partner's ear.",
      "Strip for your partner and give them a lap dance.",
      "Use a sex toy on your partner and make them orgasm.",
      "Make out with your partner for at least 5 minutes without stopping.",
      "Do a striptease for your partner and let them touch you wherever they want.",
      "Give your partner oral sex for as long as they want.",
      "Write a romantic love letter to your partner and read it to them.",
      "Take a shower or bath together and wash each other.",
      "Wear sexy lingerie for your partner and model it for them.",
      "Make a sex tape with your partner.",
      "Roleplay a sexual scenario with your partner.",
      "Experiment with a new sexual position with your partner.",
      "Use handcuffs or restraints on your partner and dominate them.",
      "Play with food during sex with your partner.",
      "Wear a blindfold and let your partner touch and tease you.",
      "Watch a pornographic movie with your partner and reenact a scene.",
      "Give your partner a sensual striptease and lap dance while blindfolded.",
      "Make a video of yourself masturbating and send it to your partner.",
      "Try a new sex toy or vibrator with your partner.",
      "Have sex in a public place.",
      "Watch your partner masturbate.",
      "Have a threesome with your partner and a sex toy.",
      "Do a romantic photoshoot with your partner.",
      "Take a naked bubble bath with your partner.",
      "Explore your partner's body with your tongue.",
      "Give your partner a sensual full-body massage with oil.",
      "Try a new type of sexual stimulation with your partner, like edging or spanking.",
      "Take turns tying each other up and exploring each other's bodies.",
      "Try mutual masturbation with your partner.",
      "Whisper dirty talk into your partner's ear while having sex.",
      "Have sex in a different location than usual, like in the car or on the kitchen table.",
      "Try a new sexual position with your partner and make it last for at least 10 minutes.",
      "Surprise your partner with a romantic gesture like candles, rose petals, or a romantic dinner.",
      "Whisper your deepest sexual desire to your partner's ear.",
      "Serenade your partner with a romantic song.",
      "Give your partner a sensual massage.",
      "Give your partner a striptease.",
      "Play a round of strip poker with your partner.",
      "Put on your partner's underwear and dance seductively.",
      "Use a blindfold and feed your partner different foods. Can they guess what it is?",
      "Take a shower together and wash each other's body.",
      "Wear your partner's clothes for the next hour.",
      "Perform a lap dance for your partner.",
      "Make out with your partner in a public place for at least 30 seconds.",
      "Do a sexy dance for your partner.",
      "Recreate a scene from your favorite romantic movie.",
      "Give your partner a sensual lap dance.",
      "Take a sexy photo of yourself and send it to your partner.",
      "Share your most intimate fantasy with your partner.",
      "Create a romantic candlelit dinner for your partner.",
      "Perform a seductive dance while your partner records it.",
      "Give your partner a sensual kiss on their most sensitive spot.",
      "Draw a sexy picture of your partner.",
      "Roleplay a romantic scenario with your partner.",
      "Make a love letter for your partner.",
      "Play a game of Truth or Dare with your partner and only choose 'Dare'.",
      "Give your partner a sensual foot massage.",
      "Use a feather to tickle your partner's body sensually.",
      "Create a romantic bubble bath for your partner.",
      "Give your partner a hickey on their neck.",
      "Put on a sexy outfit and surprise your partner.",
      "Do a sexy dance in the rain with your partner.",
      "Try out a new sex position with your partner.",
      "Give your partner a sensual back rub.",
      "Spend an entire day in bed with your partner doing nothing but making love.",
      "Take a bath with your partner.",
      "Give your partner a sensual kiss on their lips.",
      "Whisper something naughty in your partner's ear.",
      "Make your partner breakfast in bed wearing only an apron.",
      "Try out a new sex toy with your partner.",
      "Do a sexy dance with your partner while holding hands.",
      "Wear lingerie for your partner and model it for them.",
      "Create a romantic scavenger hunt for your partner.",
      "Use ice cubes to sensually stimulate your partner's body.",
      "Make a sex tape with your partner.",
      "Give your partner a sensual kiss on their belly button.",
      "Make out with your partner in a hot tub.",
      "Give your partner a sensual kiss on their inner thigh.",
      "Roleplay a romantic scenario in a public place with your partner.",
    ],
    "Intense": [
      "Choose a sex toy for your partner and use it together.",
      "Surprise your partner by dressing up in their favorite fantasy outfit.",
      "Have a threesome with a trusted friend or hire a professional.",
      "Tie up your partner and give them a sensual massage.",
      "Create an erotic story or script and act it out with your partner.",
      "Explore BDSM by dominating or submitting to your partner's desires.",
      "Indulge in food play by licking food off each other's bodies.",
      "Take sensual photos and videos of each other to keep the moment forever.",
      "Watch an adult film together and try to reenact the scenes.",
      "Go out in public and have sex in a secluded area where you might get caught.",
      "Experiment with alcohol and try a sex game while drinking.",
      "Visit a sex club or a swingers party and explore your fantasies with other couples.",
      "Use ice cubes, hot wax, or other temperature play to enhance your sexual experience.",
      "Try a new sex position that you have never tried before.",
      "Roleplay as strangers meeting for the first time and have sex in a public place.",
      "Use a blindfold to heighten your partner's senses and pleasure.",
      "Give your partner oral sex while they're blindfolded and guess what you're doing.",
      "Have sex in a location you've never tried before, like the shower or on the balcony.",
      "Surprise your partner with breakfast in bed and morning sex.",
      "Experiment with different types of lubricants to enhance your sexual experience.",
      "Try mutual masturbation while watching each other.",
      "Take turns blindfolding each other and taking control of the other's pleasure.",
      "Use a vibrating toy to stimulate each other at the same time.",
      "Engage in dirty talk and tell each other your deepest, darkest fantasies.",
      "Explore sensual dancing together to enhance your intimacy and arousal.",
      "Introduce a new sex toy or accessory into the bedroom and experiment together.",
      "Roleplay as teacher and student or boss and employee and have sex in the office.",
      "Try edging, bringing each other to the brink of orgasm and holding back.",
      "Experiment with body paint and decorate each other's bodies.",
      "Engage in a fantasy game where you're each someone else for the night.",
      "Use sex dice or a sex board game to spice things up and try new positions.",
      "Take a bath or shower together and wash each other's bodies.",
      "Try orgasm denial, teasing and edging each other until you both can't take it anymore.",
      "Create a sex playlist together and make love to the rhythm of the music.",
      "Have sex in a car or other public place where you might get caught.",
      "Try different types of kissing, like French kissing or gentle nibbling on the lips.",
      "Try nipple play with your partner, using your mouth or toys.",
      "Indulge in a strip tease for your partner or have them do one for you.",
      "Take turns giving each other full body massages and see where it leads.",
      "Try a new sex position every day for a week and rate them together.",
      "Engage in some light bondage, using handcuffs or ties to restrain your partner.",
      "Use a feather or a soft cloth to tickle and tease your partner's erogenous zones.",
      "Explore your own sexuality by masturbating in front of your partner.",
      "Experiment with sex in different rooms of the house, like the kitchen or living room.",
      "Have sex while blindfolded.",
      "Use a blindfold and restraints on your partner during sex.",
    ],
  };

  final Map<String, List<String>> _usedDares = {};
  final Random _random = Random();

  String getNextDare({required String gameMode}) {
    if (!_usedDares.containsKey(gameMode)) {
      _usedDares[gameMode] = [];
    }

    final unusedDares = List<String>.from(_dareGameModes[gameMode]!
        .where((dare) => !_usedDares[gameMode]!.contains(dare)));

    if (unusedDares.isEmpty) {
      unusedDares.addAll(_dareGameModes[gameMode]!);
      _usedDares[gameMode]!.clear();
    }

    final index = _random.nextInt(unusedDares.length);
    final dare = unusedDares[index];
    _usedDares[gameMode]!.add(dare);

    return dare;
  }
}
