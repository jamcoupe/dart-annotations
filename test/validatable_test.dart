library validatable_test;

import 'package:unittest/unittest.dart';
import 'package:annotations/annotation.dart';


void main() {

  group('testing a class', () {

    test('object with require with valid', () {
      Test test = new Test(12, 10);
      print(test.invalidProperties);
      expect(test.isValid(), isTrue);
    });

    test('object with require no valid', () {
      Test test = new Test(9, 10);
      expect(test.isValid(), isFalse);
    });


    test('get errors', () {

      Test test = new Test(90, 10);
      expect(test.isValid(), isFalse);
      expect(test.invalidProperties.length, equals(1));
    });


    test('get errors 2', () {
      Test test = new Test(1, 2);
     // print(test.invalidProperties);
      expect(test.invalidProperties.length, equals(2));
    });

    test('no errors', () {
      Test test = new Test(15, 10);
      expect(test.invalidProperties.length, equals(0));
    });

    test('with multiple errors on the same property', () {
      Test test = new Test(15, 90);
      test.test3 = 20;

      expect(test.invalidProperties.length, equals(1));
    });
  });
}

class Test extends Object with Validatable {

  @range(min:10, max:20, message:"must be between 10 and 20!")
  @required()
  int test;

  @range(min:9)
  int test2;

  //todo: disallow two metadata of the same type
  @range(min:1, max:5)
  @range(min:40, max:50)
  int test3;


  Test([this.test = null, this.test2 = null]);


}