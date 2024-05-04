import 'package:base_project/application/core/utils/app_validator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Login field validations", () {
    test('Email should be valid', (){
      String email = "amj@gmail.com";
      expect(Validator.validateEmail(email), true);
    });

    test('Email should be invalid', (){
      String email = "amj@@gmail.com";
      expect(Validator.validateEmail(email), false);
    });
  });
}