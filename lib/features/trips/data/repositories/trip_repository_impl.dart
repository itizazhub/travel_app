import 'package:dartz/dartz.dart';
import 'package:travel_app/features/core/error/failures.dart';
import 'package:travel_app/features/trips/data/datasources/trip_local_datasource.dart';
import 'package:travel_app/features/trips/data/models/trip_model.dart';
import 'package:travel_app/features/trips/domain/entitites/trip.dart';
import 'package:travel_app/features/trips/domain/repositories/trip_repository.dart';

class TripRepositoryImpl implements TripRepository {
  TripRepositoryImpl({required this.localDatasource});
  final TripLocalDatasource localDatasource;

  @override
  Future<void> addTrip(Trip trip) async {
    final tripModel = TripModel.fromEntity(trip);
    localDatasource.addTrip((tripModel));
  }

  @override
  Future<void> deleteTrip(int index) async {
    localDatasource.deleteTrip(index);
  }

  @override
  Future<Either<Failure, List<Trip>>> getTrips() async {
    try {
      final tripModels = localDatasource.getTrips();
      List<Trip> res = tripModels.map((model) {
        return model.toEntity();
      }).toList();
      return Right(res);
    } catch (error) {
      return Left(SomeSpecificError(error.toString()));
    }
  }
}
