import 'package:equatable/equatable.dart';

class CastPersonalEntity extends Equatable {
  final String profilePath, castName, dateOfBirth, placeOfBirth, biography;

  CastPersonalEntity({
    required this.profilePath,
    required this.castName,
    required this.dateOfBirth,
    required this.placeOfBirth,
    required this.biography,
  });

  @override
  List<Object?> get props => [castName];
}
