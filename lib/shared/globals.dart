import 'package:college_cupid/domain/models/user_profile.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

final customCacheManager = CacheManager(Config(
  'customKey',
  stalePeriod: const Duration(days: 10),
  maxNrOfCacheObjects: 100,
));

final matchReleaseTime = DateTime(2025, 2, 14);

Map<String, List<String>> interestsMap = {
  'Sports': [
    "⚽ Football",
    "🎾 Tennis",
    "🏀 Basketball",
    "🏏 Cricket",
    "⛳ Golf",
    "🏃 Athletics",
    "♟️ Chess",
    "🏑 Hockey",
    "🏋️‍♀️ weightlifting",
    "🏓 TT",
    "🏊 swimming",
    "🏐 Volleyball",
    "🏸 Squash"
  ],
  'Creativity': [
    "🎨 Art",
    "✏️ Design",
    "💄 Make-up",
    "📷 Photography",
    "📝 Writing",
    "🎤 Singing",
    "💃🏻 Dancing",
    "📌 Crafts",
    "📽️ Making videos"
  ],
  "Going out": [
    "🎙️ Stand up",
    "🎊 Festivals",
    "🎭 Theatre",
    "🕺🏻 Nightclubs",
    "🎤 Karaoke",
    "🏛️ Museums & Galleries",
    "🍸 Pubs"
  ],
  "Staying in": [
    "🎮 Video games",
    "🎲 Board games",
    "🌱 Gardening",
    "🍳 Cooking",
    "🍰 Baking",
  ],
  "Film & TV": [
    "📺 Romance",
    "📺 Comedy shows",
    "📺 Drama",
    "📺 Horror",
    "📺 Thriller",
    "📺 Fantasy",
    "📺 Sci-fi",
    "📺 Anime",
  ],
  "Reading": [
    "📚 Spiritual",
    "📚 Romance",
    "📚 Comedy",
    "📚 Mystery",
    "📚 Horror",
    "📚 Manga",
    "📚 Fantasy",
    "📚 Sci-fi",
  ],
  "Music": [
    "🎵 Hip hop",
    "🎵 Pop",
    "🎵 Rock",
    "🎵 Electronic",
    "🎵 R&B",
    "🎵 Classical",
    "🎵 Country",
    "🎵 Desi",
    "🎵 Jazz",
  ],
  "Food & Drink": [
    "🍷 Wine",
    "🍺 Beer",
    "☕ Coffee",
    "🍸 Cocktails",
    "🥃 Whiskey",
    "🌱 Vegan",
    "🍕 Pizza",
    "🥦 Vegetarian",
  ],
  "Travelling": [
    "🏖️ Beaches",
    "🛁 Spa weekends",
    "❄️ Winter sports",
    "🏕️ Camping",
    "🌆 City Breaks",
    "🏡 Country escapes",
    "🎒 Backpacking",
    "⛺ Hiking trips",
    "🛣️ Road trips",
  ],
  "Pets": [
    "🐶 Dogs",
    "😺 Cats",
    "🐦 Birds",
    "🐠 Fishes",
    "🐇 Rabbits",
    "🐢 Turtles",
    "🐍 Snakes",
  ]
};

List<QuizQuestion> quizQuestions = [
  QuizQuestion(question: "What's the most spontaneous thing you've ever done?"),
  QuizQuestion(question: "What's your go-to karaoke song?"),
  QuizQuestion(question: "What's your idea of a perfect day?"),
  QuizQuestion(question: "What's the best trip you've ever taken?"),
  QuizQuestion(question: "What's your favorite way to spend a weekend?"),
  QuizQuestion(
      question:
          "What's the most embarrassing thing you've ever done to impress someone?"),
  QuizQuestion(question: "What's your favorite comfort food?"),
  QuizQuestion(question: "What's something you're weirdly good at?"),
  QuizQuestion(question: "What's the best gift you've ever received?"),
  QuizQuestion(
      question: "What's your favorite way to unwind after a long day?"),
  QuizQuestion(
      question: "What's the last thing that made you laugh uncontrollably?"),
  QuizQuestion(question: "What's your favorite childhood memory?"),
  QuizQuestion(question: "What's your dream vacation destination?"),
  QuizQuestion(question: "What's your favorite book or movie and why?"),
  QuizQuestion(
      question:
          "What's something you've always wanted to try but haven't yet?"),
  QuizQuestion(question: "What's your favorite hobby or pastime?"),
  QuizQuestion(
      question: "What's the best piece of advice you've ever received?"),
  QuizQuestion(question: "What's your favorite way to show someone you care?"),
  QuizQuestion(question: "What's your guilty pleasure?"),
  QuizQuestion(question: "What's the most adventurous thing you've ever done?"),
  QuizQuestion(question: "What's your favorite season and why?"),
  QuizQuestion(question: "What's your favorite way to stay active?"),
  QuizQuestion(
      question: "What's the best concert or live event you've ever attended?"),
  QuizQuestion(question: "What's your favorite thing about yourself?"),
  QuizQuestion(question: "What's your favorite way to connect with others?"),
  QuizQuestion(question: "What's your favorite type of cuisine?"),
  QuizQuestion(question: "What's your favorite way to spend a rainy day?"),
  QuizQuestion(question: "What's your favorite quote or mantra?"),
  QuizQuestion(question: "What's your favorite thing to do outdoors?"),
  QuizQuestion(
      question: "What's your favorite way to celebrate your birthday?"),
  QuizQuestion(question: "What's your favorite thing to cook or bake?"),
  QuizQuestion(question: "What's your favorite way to give back to others?"),
  QuizQuestion(question: "What's your favorite thing about where you live?"),
  QuizQuestion(question: "What's your favorite way to start your day?"),
  QuizQuestion(question: "What's your favorite way to end your day?"),
  QuizQuestion(question: "What's your favorite thing to do with friends?"),
  QuizQuestion(question: "What's your favorite way to learn something new?"),
  QuizQuestion(
      question: "What's your favorite way to express your creativity?"),
  QuizQuestion(question: "What's your favorite way to surprise someone?"),
  QuizQuestion(question: "What's your favorite thing to do on a date?"),
  QuizQuestion(question: "What's your favorite thing to do when you're alone?"),
  QuizQuestion(
      question: "What's your favorite thing to do when you're stressed?"),
  QuizQuestion(question: "What's your favorite thing to do when you're happy?"),
  QuizQuestion(question: "What's your favorite thing to do when you're bored?"),
  QuizQuestion(
      question:
          "What's your favorite thing to do when you're feeling adventurous?"),
  QuizQuestion(
      question: "What's your favorite thing to do when you're feeling lazy?"),
  QuizQuestion(
      question:
          "What's your favorite thing to do when you're feeling nostalgic?"),
  QuizQuestion(
      question:
          "What's your favorite thing to do when you're feeling inspired?"),
  QuizQuestion(
      question:
          "What's your favorite thing to do when you're feeling competitive?"),
  QuizQuestion(
      question:
          "What's your favorite thing to do when you're feeling romantic?"),
];
