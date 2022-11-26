import 'package:fpdart/fpdart.dart';

import '../exceptions/value_failure.dart';

Either<ValueFailure<String>, String> validateEmailAddress(String input) {
  const emailRegex =
      r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";
  if (RegExp(emailRegex).hasMatch(input)) {
    return right(input);
  } else {
    return left(ValueFailure(input, message: 'Email tidak valid'));
  }
}

Either<ValueFailure<String>, String> validatePassword(
    String input, int minLength) {
  if (input.length >= minLength) {
    return right(input);
  } else {
    return left(
        ValueFailure(input, message: 'Panjang kata sandi harus >= $minLength'));
  }
}
