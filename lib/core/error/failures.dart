import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final List properties;

  const Failure({required this.properties});

  @override
  // TODO: implement props
  List<Object?> get props;
}

class ServerFailure extends Failure {
  const ServerFailure({required List properties}) : super(properties: properties);

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();


}

class CacheFailure extends Failure {
  const CacheFailure({required List properties})
      : super(properties: properties);

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
