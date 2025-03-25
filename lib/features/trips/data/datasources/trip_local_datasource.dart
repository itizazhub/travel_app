import 'package:hive_flutter/hive_flutter.dart';

import '../models/trip_model.dart';

class TripLocalDatasource {
  TripLocalDatasource({required this.tripBox});
  final Box<TripModel> tripBox;
  List<TripModel> getTrips() {
    return tripBox.values.toList();
  }

  void addTrip(TripModel trip) {
    tripBox.add(trip);
  }

  void deleteTrip(int index) {
    tripBox.deleteAt(index);
  }
}
