import 'dart:math';

String truncateAndCapitalize(String text, {int? maxLength}) {
  maxLength = maxLength ?? 35;
  List<String> words = text.split(' ');

  if (text.length <= maxLength) {
    return text;
  }

  List<String> shortenedWords = [];
  int lengthSoFar = 0;

  for (var i = 0; i < words.length; i++) {
    var word = words[i];

    if (i == words.length - 1) {
      shortenedWords.add(word[0].toUpperCase());
      break;
    }

    if (lengthSoFar + word.length + 1 > maxLength) {
      for (var j = i; j < words.length; j++) {
        shortenedWords.add(words[j][0].toUpperCase());
      }
      break;
    }

    shortenedWords.add(word);
    lengthSoFar += word.length + 1;
  }

  return shortenedWords.join(' ');
}
