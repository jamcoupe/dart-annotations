import 'package:annotations/annotation.dart';
import 'package:unittest/unittest.dart';

void main() {

  test('testing valid required', () {
    required test = new required();

    //todo:add more tests
    var validRequired = [
      'HI', '1', 3, [1,2,3,]
    ];

    validRequired.forEach((valid) {
      expect(test.isValid(valid), isTrue);
    });

  });

  test('testing invalid required', () {

    required test = new required();

    var invalidRequired = [
      '', null, []
    ];

    invalidRequired.forEach((invalid) {
      expect(test.isValid(invalid), isFalse);
    });

  });

}
