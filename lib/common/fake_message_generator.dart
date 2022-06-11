import 'dart:math';

class FakeMessageGenerator {
  static String getRandomMessage() {
    List<String> items = getListOfFakeChats();
    final random = Random();
    String element = items[random.nextInt(items.length)];
    return element;
  }

  static List<String> getListOfFakeChats() {
    return [
      "Tell me about yourself.",
      "Do you listen to any podcasts? Which is your favorite?",
      "What do you think has been the best movie of the year so far?",
      "What is something people are always surprised to learn about you?",
      "If you could travel back in time, what decade would you choose to live in?",
      "What’s the strangest dream you’ve had recently?",
      "Do you like documentaries? Have you watched any good ones recently?",
      "Do you believe men and women can ever just be friends?",
      "What’s one interesting thing about yourself no one really knows?",
    ];
  }
}
