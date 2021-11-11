import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class CastEntity extends Equatable {
  final int id;
  final String castOrginalName;
  String? characterName;
  String? profilePic;

  CastEntity({
    required this.id,
    required this.castOrginalName,
    this.characterName,
    this.profilePic,
  });

  @override
  List<Object?> get props => [id, castOrginalName];
}
