import 'package:equatable/equatable.dart';

class MovieSearchParam extends Equatable {
  final String searchParams;

  MovieSearchParam({required this.searchParams});

  @override
  List<Object?> get props => [searchParams];
}
