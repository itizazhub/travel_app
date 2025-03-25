import 'package:travel_app/features/trips/domain/entitites/trip.dart';
import 'package:travel_app/features/trips/domain/repositories/trip_repository.dart';

class AddTrip {
  AddTrip(this.repository);
  final TripRepository repository;

  Future<void> call(Trip trip) {
    return repository.addTrip(trip);
  }
}
