import 'dart:math';

double calculateFontSize(
    String text, {
      double baseFontSize = 16,
      double decrementPerStep = 0.5,
      int charactersPerStep = 10,
      int? startAt,
      double minFontSize = 10,
    }) {
  double calc(){
    int textLength = text.length;
    int steps = (textLength / charactersPerStep).floor();
    double fontSize = max(baseFontSize - (steps * decrementPerStep), minFontSize);
    return fontSize;
  }

  if (startAt != null) {
    if(text.length > startAt){
      return calc();
    }else{
      return baseFontSize;
    }
  }

  return calc();
}