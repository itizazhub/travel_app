import 'package:hive_flutter/hive_flutter.dart';
import 'package:travel_app/features/trips/domain/entitites/trip.dart';

part 'trip_model.g.dart';

@HiveType(typeId: 0)
class TripModel {
  TripModel({
    required this.title,
    required this.photos,
    required this.description,
    required this.date,
    required this.location,
  });

  @HiveField(0)
  final String title;

  @HiveField(1)
  final List<String> photos;

  @HiveField(2)
  final String description;

  @HiveField(3)
  final DateTime date;

  @HiveField(4)
  final String location;

  // Factory constructor to create a TripModel from a Trip entity
  factory TripModel.fromEntity(Trip trip) {
    return TripModel(
      title: trip.title,
      photos: trip.photos,
      description: trip.description,
      date: trip.date,
      location: trip.location,
    );
  }

  // Method to convert a TripModel back to a Trip entity
  Trip toEntity() {
    return Trip(
      title: title,
      photos: photos,
      description: description,
      date: date,
      location: location,
    );
  }
}
