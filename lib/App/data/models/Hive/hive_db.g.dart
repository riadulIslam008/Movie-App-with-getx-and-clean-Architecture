// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_db.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FavouriteMovieListModelAdapter
    extends TypeAdapter<FavouriteMovieListModel> {
  @override
  final int typeId = 0;

  @override
  FavouriteMovieListModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FavouriteMovieListModel(
      fields[0] as String,
      fields[1] as int,
      fields[2] as String,
      fields[3] as String,
      fields[4] as String,
      fields[5] as bool,
      fields[6] as double,
      fields[7] as DateTime,
      fields[8] as String,
    );
  }

  @override
  void write(BinaryWriter writer, FavouriteMovieListModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.posterPath)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.overview)
      ..writeByte(3)
      ..write(obj.backdropPath)
      ..writeByte(4)
      ..write(obj.title)
      ..writeByte(5)
      ..write(obj.adult)
      ..writeByte(6)
      ..write(obj.voteAverage)
      ..writeByte(7)
      ..write(obj.releaseDate)
      ..writeByte(8)
      ..write(obj.language);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavouriteMovieListModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
