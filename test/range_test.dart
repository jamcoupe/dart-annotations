library annotations_test;

import 'package:unittest/unittest.dart';
import 'package:annotations/annotation.dart';

void main() {

  group('Testing range with integers', () {
    range testRange = new range(min:50, max:100);

    test('within the range', () {
      List<int> validInts = [50, 100, 51, 99, 75];
      validInts.forEach((validInt) {
        expect(testRange.isValid(validInt), isTrue);
      });
    });

    test('outwith the range', () {
      List<int> invalidInts = [49, 101, 0, -1, 150];
      invalidInts.forEach((invalidInt) {
        expect(testRange.isValid(invalidInt), isFalse, reason: "$invalidInt is within ${testRange.min} and ${testRange.max}");
      });
    });

  });

  group('Testing range', () {
    range invalidRange = new range(min:20, max:10);

    test('with min larger than max', () {
      expect(() => invalidRange.isValid(15), throwsArgumentError);
      expect(() => invalidRange.isValid(50), throwsArgumentError);
    });

    test('with boolean value', () {
      expect(() => invalidRange.isValid(false), throwsArgumentError);
      expect(() => invalidRange.isValid(true), throwsArgumentError);
    });

  });

  group('Testing range with strings', () {
    range testRange = new range(min:10);

    test('of valid length', () {
      List<String> validStrings = ["Jamie Couperwhite", "1234567890", "I am ten!!"];

      validStrings.forEach((string) {
        expect(testRange.isValid(string), isTrue);
      });
    });

    test('of invalid length', () {

    });
  });

  group('Testing range with list of', () {

    range testRange = new range(min:10, max:20);

    test('valid sized lists', () {
      List<List<int>> validLists = [
        [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
        [34, 1234, 12, 3123, 12, 41, 123, 74, 12, 12, 12, 12],
        [12, 12, 12, 12, 12, 12, 12, 12, 12, 12]
      ];

      validLists.forEach((list) {
        expect(testRange.isValid(list), isTrue, reason: "${list.length}");
      });

    });

    test('invalid sized lists', () {

      List<List<int>> invalidLists = [
        [1], [],
        [1,2,3,4,5,6,7,8],
        [1,2,3,4,5,6,7,8,9],
        [1,2,3,4,5,6,7,8,9],
        [1,2,3,4,5,6,7,8,9,0,1,2,3,4,5,6,7,8,9,0,1]
      ];

      invalidLists.forEach((list) {
        expect(testRange.isValid(list), isFalse, reason: "List with ${list.length} elements is not within range");
      });
    });

  });

}