import 'package:clean_architecture/core/error/failures.dart';
import 'package:dartz/dartz.dart';

class InputConverter {
  Either<Failure, int> stringToUnsignedInteger(String str) {
    try {
      final integer = int.parse(str);
      if (integer < 0) {
        throw const FormatException();
      }
      return Right(integer);
    } on FormatException {
      return const Left(InvalidInputFailure(properties: []));
    }
  }
}

class InvalidInputFailure extends Failure {
  const InvalidInputFailure({required List properties})
      : super(properties: properties);

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
