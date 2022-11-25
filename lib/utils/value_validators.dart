import 'package:fpdart/fpdart.dart';

Either<String, String> validateEmailAddress(String input) {
  const emailRegex =
      r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";
  if (RegExp(emailRegex).hasMatch(input)) {
    return right(input);
  } else {
    return left('Email tidak valid');
  }
}

Either<String, String> validatePassword(String input, int minLength) {
  if (input.length >= minLength) {
    return right(input);
  } else {
    return left('Panjang kata sandi harus >= $minLength');
  }
}
