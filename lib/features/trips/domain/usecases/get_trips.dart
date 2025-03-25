import 'package:dartz/dartz.dart';
import 'package:travel_app/features/core/error/failures.dart';
import 'package:travel_app/features/trips/domain/entitites/trip.dart';
import 'package:travel_app/features/trips/domain/repositories/trip_repository.dart';

class GetTrips {
  GetTrips(this.repository);
  final TripRepository repository;
  Future<Either<Failure, List<Trip>>> call() {
    return repository.getTrips();
  }
}
