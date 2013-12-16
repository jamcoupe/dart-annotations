library validatable_test;

import 'package:unittest/unittest.dart';
import 'package:annotations/annotation.dart';


void main() {

  group('testing a class', () {

    test('object with require with valid', () {
      Test test = new Test(12);
      expect(test.isValid(), isTrue);
    });

    test('object with require no valid', () {
      Test test = new Test(9);
      expect(test.isValid(), isFalse);
    });


    test('get errors', () {

      Test test = new Test(90);
      expect(test.isValid(), isFalse);
      test.getValidationErrors().forEach((error) {
        print("${error.property} ${error.message}");
      });
    });


    test('get errors', () {
      Test test = new Test(1);
      expect(test.invalidProperties.length, equals(1));
    });

    test('no errors', () {
      Test test = new Test(15);
      expect(test.invalidProperties.length, equals(0));

    });
  });
}

class Test extends Object with Validatable {

  @range(min:10, max:20, message:"must be between 10 and 20!")
  @required()
  int test;


  Test([this.test = null]);
}