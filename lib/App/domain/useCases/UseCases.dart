import 'package:dartz/dartz.dart';
import 'package:movie_app_tmdb/App/Core/errors/AppError.dart';

abstract class UseCases<Type, Params>{
   Future<Either<AppError, Type>> call(Params params);
}

//Type---- What does the Use Case Return.

//Params ---------- what is Required to call Api.