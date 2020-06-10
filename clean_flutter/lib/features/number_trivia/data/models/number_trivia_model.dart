import 'package:clean_flutter/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:flutter/material.dart';

class NumberTriviaModel extends NumberTrivia {
  NumberTriviaModel({
    @required String text,
    @required int number,
  }) : super(text: text, number: number);

  factory NumberTriviaModel.fromJson(Map<String, dynamic> json) {
    return NumberTriviaModel(
        text: json['text'], number: (json['number'] as num).toInt());
  }

  Map<String, dynamic> toJson() {
    return {
      'test': text,
      'number': number,
    };
  }
}
