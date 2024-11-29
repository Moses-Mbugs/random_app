import 'dart:math';
import 'package:flutter/material.dart';

class RandomFactDialog {
  // Static method to show a random fact dialog
  static void show(BuildContext context, String category) {
    // Define facts for different categories
    final Map<String, List<String>> facts = {
      'Animals': [
        "Elephants are the only mammals that can't jump.",
        "Octopuses have three hearts!",
        "Cows have best friends and get stressed when separated.",
        "A group of flamingos is called a 'flamboyance.'",
        "The fingerprints of a koala are indistinguishable from humans.",
      ],
      'History': [
        "The Eiffel Tower can be 15 cm taller during the summer due to thermal expansion.",
        "Cleopatra was not Egyptian; she was Greek.",
        "The shortest war in history was between Britain and Zanzibar on 27 August 1896.",
        "The Great Wall of China is not visible from space with the naked eye.",
        "Ancient Egyptians used honey as medicine.",
      ],
      'Motivation': [
        "The only way to do great work is to love what you do. – Steve Jobs",
        "Don't watch the clock; do what it does. Keep going. – Sam Levenson",
        "Success is not final, failure is not fatal: It is the courage to continue that counts. – Winston Churchill",
        "Believe you can and you're halfway there. – Theodore Roosevelt",
        "The future belongs to those who believe in the beauty of their dreams. – Eleanor Roosevelt",
      ],
      'Science': [
        "The speed of light is 299,792 kilometers per second.",
        "There are more stars in the universe than grains of sand on all the Earth’s beaches.",
        "A day on Venus is longer than a year on Venus.",
        "Water can boil and freeze at the same time, known as the 'triple point.'",
        "A teaspoon of honey represents the life work of 12 bees.",
      ],
      'Technology': [
        "The first computer virus was created in 1983 by a 15-year-old.",
        "More people have access to a mobile phone than a toilet.",
        "The world’s first website is still live. It's info.cern.ch.",
        "The first video uploaded to YouTube was titled 'Me at the zoo'.",
        "In 2011, a computer defeated a human champion on the show Jeopardy.",
      ],
    };

    // Get the list of facts for the selected category
    final factsList = facts[category] ?? [];

    if (factsList.isEmpty) return;

    // Randomly select a fact
    final randomIndex = Random().nextInt(factsList.length);
    final randomFact = factsList[randomIndex];

    // Show the dialog
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.grey[300],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(2),
            side: const BorderSide(color: Colors.black, width: 3),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '$category Fact',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: 'PressStart2P',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  randomFact,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: 'PressStart2P',
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(2),
                      border: Border.all(color: Colors.black, width: 2),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.9),
                          offset: const Offset(4, 4),
                          blurRadius: 0.1,
                        ),
                      ],
                    ),
                    child: const Text(
                      'Close',
                      style: TextStyle(
                        fontFamily: 'PressStart2P',
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
