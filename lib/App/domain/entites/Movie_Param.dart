import 'package:equatable/equatable.dart';

class MovieParam extends Equatable {
  final int id;

  MovieParam(this.id);

  @override
  List<Object?> get props => [id];
}
