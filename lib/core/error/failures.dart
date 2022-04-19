import 'package:equatable/equatable.dart';


 abstract class Failure extends Equatable{
 final  List properties ;
  const Failure({required this.properties});

  @override
  // TODO: implement props
  List<Object?> get props ;


}