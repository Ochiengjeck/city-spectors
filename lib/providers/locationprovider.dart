import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

class LocationProvider with ChangeNotifier {
  LatLng? _currentLocation;
  bool _isFetching = false;

  LatLng? get currentLocation => _currentLocation;
  bool get isFetching => _isFetching;

  LocationProvider() {
    _fetchCurrentLocation();
  }

  Future<void> _fetchCurrentLocation() async {
    _isFetching = true;
    notifyListeners();

    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      _isFetching = false;
      notifyListeners();
      throw Exception('Location services are disabled.');
    }

    // Request permission for location services
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        _isFetching = false;
        notifyListeners();
        throw Exception('Location permissions are denied.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      _isFetching = false;
      notifyListeners();
      throw Exception('Location permissions are permanently denied.');
    }

    // Retrieve the current position
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    _currentLocation = LatLng(position.latitude, position.longitude);
    _isFetching = false;
    notifyListeners();
  }

  Future<void> refreshLocation() async {
    await _fetchCurrentLocation();
  }
}
