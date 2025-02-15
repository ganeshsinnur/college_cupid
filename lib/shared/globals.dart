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
  QuizQuestion(
      question: "A mail from DOSA with my name will probably be about..."),
  QuizQuestion(question: "I am struggling with my attendance because..."),
  QuizQuestion(question: "My ideal date spot in campus will be..."),
  QuizQuestion(question: "A shower thought I recently had..."),
  QuizQuestion(question: "Mess food tastes better when..."),
  QuizQuestion(question: "Campus guards know me because..."),
  QuizQuestion(question: "You are a red flag if in campus, you hang out in..."),
  QuizQuestion(question: "People in this club are a red flag..."),
  QuizQuestion(question: "We are the same type of weird if..."),
  QuizQuestion(question: "In campus, I can get you access to..."),
  QuizQuestion(question: "2 truths and a lie..."),
  QuizQuestion(question: "A campus goal of my life..."),
  QuizQuestion(question: "I would write this in my letter..."),
  QuizQuestion(question: "Unusual skills..."),
  QuizQuestion(question: "You might not know about this but..."),
  QuizQuestion(question: "My best prof joke..."),
  QuizQuestion(question: "My autobiography would end with..."),
  QuizQuestion(question: "If I was a prof, my TAs would have..."),
  QuizQuestion(question: "You should choose me over your TA because..."),
  QuizQuestion(question: "If you see me around animals..."),
  QuizQuestion(question: "If I was Cinderella, you would find my shoe at..."),
  QuizQuestion(question: "My profs call me..."),
  QuizQuestion(question: "My go-to Lohit canteen order..."),
  QuizQuestion(question: "I would wake up for an 8 AM class if..."),
  QuizQuestion(question: "I wouldn't ignore a mail if..."),
  QuizQuestion(
      question: "If you couldn't find me anywhere, you would find me at..."),
];
