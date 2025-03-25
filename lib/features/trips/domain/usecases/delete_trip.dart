import 'package:travel_app/features/trips/domain/repositories/trip_repository.dart';

class DeleteTrip {
  DeleteTrip(this.repository);
  final TripRepository repository;
  Future<void> call(int index) {
    return repository.deleteTrip(index);
  }
}
