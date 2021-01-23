import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:tdd_app/data/models/number_trivia_model.dart';
import 'package:tdd_app/domain/entities/number_trivia.dart';

import '../../../../../fixtures/fixutre_reader.dart';

void main() {
  final tNumberTriviaModel = NumberTriviaModel(number: 1, text: 'Test Text');

  test('should be a subclass of NumberTrivia entity', () async {
    // assert
    expect(tNumberTriviaModel, isA<NumberTrivia>());
  });

  group('fromJson', () {
    test(
      'should return a valid model when the JSON number is an integer',
      () async {
        // arrange
        final Map<String, dynamic> jsonMap =
            json.decode(fixture('trivia.json'));
        // act
        final result = NumberTriviaModel.fromJson(jsonMap);
        // assert
        expect(result, tNumberTriviaModel);
      },
    );
    test(
      'should return a valid model when the JSON number is regarded as a double',
      () async {
        // arrange
        final Map<String, dynamic> jsonMap =
            json.decode(fixture('trivia_double.json'));
        // act
        final result = NumberTriviaModel.fromJson(jsonMap);
        // assert
        expect(result, tNumberTriviaModel);
      },
    );
  });

  group('toJson', () {
    test(
      'should return a JSON map containing the proper data',
      () async {
        // arrange
        // we already have the model
        // act
        final result = tNumberTriviaModel.toJson(tNumberTriviaModel);
        // assert
        final expectedJsonMap = {"text": "Test Text", "number": 1};
        expect(result, expectedJsonMap);
      },
    );
  });
}