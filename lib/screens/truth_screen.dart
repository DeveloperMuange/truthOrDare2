import 'dart:math';

import 'package:flutter/material.dart';

class TruthScreen extends StatelessWidget {
  final String gameMode;

  TruthScreen({
    Key? key,
    required this.gameMode,
  }) : super(key: key);

  final truth = Truth();

  @override
  Widget build(BuildContext context) {
    final String truthText = truth.getNextTruth(gameMode: gameMode);
    return Scaffold(
      backgroundColor: Colors.pink,
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Text('Truth'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            truthText,
            style: const TextStyle(fontSize: 24.0, color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class Truth {
  static final _truthGameModes = <String, List<String>>{
    "Easy": [
      "What is your idea of a perfect romantic evening?",
      "What is the sweetest thing your partner has ever done for you?",
      "Have you ever written a love letter, and if so, who was it to?",
      "What is your favorite physical feature of your partner?",
      "What is the most romantic thing you have ever done for someone?",
      "What is something you find attractive in your partner that others might not?",
      "What is the craziest thing you have ever done for love?",
      "What is your favorite thing about your partner's personality?",
      "What is your favorite memory with your partner?",
      "What is something you have always wanted to tell your partner, but haven't?",
      "What is your partner's most endearing quality?",
      "What is the nicest compliment your partner has ever given you?",
      "What is your favorite way to show affection?",
      "What is the most thoughtful gift you have ever given someone?",
      "What is something you and your partner have in common that surprises people?",
      "What is the most romantic movie you have ever seen?",
      "What is the most meaningful gift you have ever received?",
      "What is your partner's best physical trait?",
      "What is the most memorable date you have been on?",
      "What is your idea of the perfect date?",
      "What is something you wish your partner knew about you?",
      "What is the most romantic gesture you have ever received?",
      "What is the most important quality in a partner, to you?",
      "What is your partner's best personality trait?",
      "What is the sweetest thing your partner has ever said to you?",
      "What is the most important thing in a relationship, to you?",
      "What is the most spontaneous thing you have ever done with your partner?",
      "What is something you and your partner disagree on, but it doesn't matter?",
      "What is the most significant challenge you have faced together?",
      "What is your favorite thing to do with your partner?",
      "What is your partner's favorite thing about you?",
      "What is your favorite thing your partner has ever cooked for you?",
      "What is the most important thing you have learned from a past relationship?",
      "What is the most romantic place you have ever been?",
      "What is something you and your partner want to accomplish together?",
      "What is the most surprising thing you have learned about your partner?",
      "What is the most romantic thing someone has ever said to you?",
      "What is your partner's biggest accomplishment?",
      "What is your favorite thing your partner wears?",
      "What is your favorite memory of your partner?",
      "What is the most unexpected thing that has ever happened on a date?",
      "What is the most important thing you have learned about yourself in a relationship?",
      "What is the most spontaneous thing you have ever done for love?",
      "What is something you and your partner share a passion for?",
      "What is the most romantic thing you have ever done for someone?",
      "What is your partner's most attractive personality trait?",
      "What is the most romantic thing you have ever received?",
      "What is your favorite thing about your partner's appearance?",
      "What is the most important lesson you have learned about love?",
      "What is your partner's best quality?",
    ],
    "Spicy": [
      "What is the wildest sexual experience you've ever had?",
      "What is something that turns you on that you're too embarrassed to tell me about?",
      "Have you ever had a one-night stand? How many?",
      "What's the kinkiest thing you've ever done in bed?",
      "Have you ever been caught having sex? Where and by whom?",
      "What's the most sexually adventurous thing you've ever tried with a partner?",
      "What's the most romantic thing you've ever done for your partner?",
      "What's the most romantic thing your partner has ever done for you?",
      "What's your idea of the perfect romantic getaway?",
      "What's the most cherished memory you have with your partner?",
      "What's one thing you wish you could change about the way you show affection to your partner?",
      "What's one thing you wish your partner would do more often to show affection?",
      "What's the sweetest thing your partner has ever said to you?",
      "What's the sweetest thing you've ever said to your partner?",
      "What's your favorite thing about your partner's personality?",
      "What's one physical feature you find most attractive about your partner?",
      "What's your favorite romantic movie?",
      "What's the most romantic thing someone has ever done for you?",
      "What's the most romantic thing you've ever said to someone?",
      "What's one thing that makes you feel most loved by your partner?",
      "What's the most important lesson you've learned about love?",
      "What's one thing you wish your partner knew about you but have never told them?",
      "What's your idea of the perfect date night?",
      "What's your favorite thing to do with your partner?",
      "What's the most thoughtful gift you've ever received from your partner?",
      "What's the most thoughtful gift you've ever given to your partner?",
      "What's one thing that always puts you in the mood for romance?",
      "What's your favorite romantic song?",
      "What's the most romantic gesture your partner has ever made towards you?",
      "What's one thing you've always wanted to try sexually with your partner but haven't yet?",
      "What's one thing you wish your partner would do more often in bed?",
      "What's the sexiest part of your partner's body?",
      "What's one thing you wish you could improve about your sex life?",
      "What's one sexual fantasy you've always had but never shared with your partner?",
      "What's one thing you wish your partner would do more often to spice up your sex life?",
      "What's one thing your partner does that always turns you on?",
      "What's one thing you wish your partner understood better about your sexual needs?",
      "What's one sexual position you've always wanted to try with your partner?",
      "What's the most spontaneous sexual experience you've ever had with your partner?",
      "What's one thing you love about the way your partner kisses?",
      "What's one thing you wish your partner knew about your sexual fantasies?",
      "What's one thing you've always wanted to try sexually but haven't yet?",
      "What's one thing you wish your partner would do more often to make you feel sexy?",
      "What's the most adventurous place you've ever had sex?",
      "What's the most embarrassing sexual experience you've ever had?",
      "What's one thing you've never done sexually that you've always wanted to try?",
      "What's the most intimate sexual experience you've ever had with your partner?",
      "What's the sexiest outfit your partner has ever worn for you?",
      "What's the sexiest outfit you've ever worn for your partner?",
      "Have you ever been attracted to someone of the same gender? Did you act on it?",
    ],
    "Steamy": [
      "Have you ever had a one-night stand?",
      "What is your favorite sexual fantasy?",
      "Have you ever had a threesome? If yes, with whom?",
      "What's the most romantic thing you've ever done for someone?",
      "What's one thing you've always wanted to try sexually but haven't yet?",
      "Have you ever had feelings for someone else while you were in a relationship with me?",
      "What's your biggest turn-on that you haven't told me about?",
      "What's your biggest insecurity when it comes to our relationship?",
      "Have you ever had a dream about me that you didn't want to tell me about?",
      "What's your favorite way to be shown affection?",
      "What's the most adventurous sexual experience you've ever had?",
      "What's one thing you would change about our sex life?",
      "What's something you've always wanted to say to me but haven't?",
      "Have you ever been in love with someone who didn't feel the same way?",
      "What's your favorite memory of us together?",
      "What's your favorite type of foreplay?",
      "What's your biggest fear when it comes to our relationship?",
      "What's the most spontaneous thing you've ever done sexually?",
      "Have you ever lied to me about something in our relationship?",
      "What's your ultimate fantasy with me?",
      "What's one thing you're afraid to ask me to do sexually?",
      "Have you ever had a crush on one of my friends?",
      "What's the most intimate thing we've ever done together?",
      "What's the most adventurous place you've had sex?",
      "What's one thing you think we can improve on in our communication?",
      "Have you ever been jealous of someone in our relationship?",
      "What's your biggest fear when it comes to our sex life?",
      "What's the most romantic thing I've ever done for you?",
      "What's one thing you've always wanted to do sexually but haven't had the courage to try?",
      "What's your favorite part of my body?",
      "What's one thing you've always wanted to tell me but haven't?",
      "What's the most romantic place you've ever been to?",
      "What's your favorite sexual position?",
      "What's the most spontaneous thing you've ever done for me?",
      "What's one thing you've always wanted to try sexually but haven't had the opportunity?",
      "Have you ever had a sexual dream about someone else while we were together?",
      "What's your biggest turn-off that you haven't told me about?",
      "What's one thing you wish we could do more of in our sex life?",
    ],
    "Intense": [
      "Have you ever cheated on a partner?",
      "Have you ever had an orgy or group sex?",
      "Have you ever had a threesome or a foursome?",
      "Have you ever paid for sex?",
      "What's the most taboo sexual act you've ever engaged in?",
      "Have you ever had sex with someone you met online?",
      "Have you ever had sex with someone you met in person for the first time on the same day?",
      "Have you ever had sex in public?",
      "What's the wildest thing you've ever done in the bedroom?",
      "Have you ever had a threesome? If so, how did it happen and how was it?",
      "What's your ultimate sexual fantasy?",
      "Have you ever had sex in a public place? If so, where?",
      "What's the most embarrassing thing that's ever happened to you during sex?",
      "Have you ever had a one-night stand? If so, how was it?",
      "What's the most sensual thing someone has ever done to you?",
      "Have you ever experimented with BDSM or any other kinks? If so, what was it like?",
      "What's the craziest place you've ever had sex?",
      "What's the longest you've gone without sex?",
      "Have you ever had a crush on someone of the same gender?",
      "What's your biggest turn on?",
      "Have you ever cheated on a partner? If so, what happened and do you regret it?",
      "What's the most romantic thing you've ever done for someone?",
      "Have you ever had sex with someone you knew you shouldn't have? If so, why?",
      "What's the sexiest piece of clothing you own?",
      "What's the biggest sexual risk you've ever taken?",
      "What's the most awkward sexual encounter you've ever had?",
      "What's the most spontaneous sexual thing you've ever done?",
      "What's the biggest turn off for you?",
      "What's the most adventurous thing you've ever done sexually?",
      "Have you ever had a sex dream about someone you know? Who was it?",
      "What's the most passionate sexual experience you've ever had?",
      "What's the most unusual thing you've ever used as a sex toy?",
      "Have you ever had phone sex? If so, how was it?",
      "What's the most important quality you look for in a sexual partner?",
      "What's the most exciting thing about sex for you?",
      "Have you ever had a sexual encounter with someone who was in a relationship? If so, what happened?",
      "What's the biggest sexual taboo you've ever broken?",
      "What's your favorite sexual position?",
      "What's the most intense orgasm you've ever had?",
      "What's the most embarrassing thing that's ever happened to you during foreplay?",
      "Have you ever been caught masturbating? If so, who caught you?",
      "What's the sexiest thing your partner has ever done for you?",
      "What's the biggest misconception people have about your sexual preferences?",
      "What's the most romantic gesture your partner has ever done for you?",
      "Have you ever faked an orgasm? If so, why?",
      "What's the most erotic dream you've ever had?",
      "What's the biggest sexual fear you have?",
      "What's the most unusual place you've ever masturbated?",
      "What's the most sensual experience you've ever had?",
      "Have you ever watched porn with a partner? If so, how was it?",
      "What's the most unusual turn on you have?",
      "Have you ever had a public sexual encounter that you regretted? If so, what happened?",
      "What's the most romantic place you've ever made love?",
      "What's the most unusual sexual request you've ever received?",
      "What is the kinkiest fantasy you have ever had?",
      "Have you ever had an orgasm from just thinking about someone?",
      "What is the most embarrassing thing that turns you on?",
      "Have you ever cheated on a partner? Why did you do it?",
      "What is the most taboo thing you have ever done sexually?",
      "Have you ever had a threesome? Would you like to?",
      "What is the sexiest thing you own?",
      "Have you ever had a one night stand? How was it?",
      "What is your biggest sexual fear?",
      "Have you ever been caught masturbating? Who caught you?",
    ],
  };

  final Map<String, List<String>> _usedTruths = {};
  final Random _random = Random();

  String getNextTruth({required String gameMode}) {
    if (!_usedTruths.containsKey(gameMode)) {
      _usedTruths[gameMode] = [];
    }

    final unusedTruths = List<String>.from(_truthGameModes[gameMode]!
        .where((truth) => !_usedTruths[gameMode]!.contains(truth)));

    if (unusedTruths.isEmpty) {
      unusedTruths.addAll(_truthGameModes[gameMode]!);
      _usedTruths[gameMode]!.clear();
    }

    final index = _random.nextInt(unusedTruths.length);
    final truth = unusedTruths[index];
    _usedTruths[gameMode]!.add(truth);

    return truth;
  }
}
