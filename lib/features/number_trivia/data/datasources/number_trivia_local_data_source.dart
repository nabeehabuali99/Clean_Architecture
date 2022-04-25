import 'dart:convert';

import 'package:clean_architecture/core/error/exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/number_trivia_model.dart';

abstract class NumberTriviaLocalDataSource{
Future<NumberTriviaModel> getLastNumberTrivia();
Future<void> cacheNumberTrivia(NumberTriviaModel triviaToCache);
}
const cachedNumberTrivia ='CACHED_NUMBER_TRIVIA';
class NumberTriviaLocalDataSourceImplementation implements NumberTriviaLocalDataSource {
    final SharedPreferences  sharedPreferences;
    NumberTriviaLocalDataSourceImplementation({required this.sharedPreferences});
  @override
  Future<void> cacheNumberTrivia(NumberTriviaModel triviaToCache)   {
    return sharedPreferences.setString(cachedNumberTrivia,
        json.encode(triviaToCache.toJson()));
  }

  @override
  Future<NumberTriviaModel> getLastNumberTrivia() {
     final jsonString = sharedPreferences.getString(cachedNumberTrivia);
     if(jsonString != null){
       return Future.value(NumberTriviaModel.fromJson(json.decode(jsonString)));
     }else {
       throw CacheException();
     }
  }



}