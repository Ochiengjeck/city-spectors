import 'package:city_spectors/providers/locationprovider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import 'package:geocoding/geocoding.dart';

class Stations extends StatefulWidget {
  const Stations({super.key});

  @override
  State<Stations> createState() => _StationsState();
}

class _StationsState extends State<Stations> {
  String _selectedAddress = "Tap on the map to get the location name";

  Future<void> _getAddressFromLatLng(LatLng position) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );
      if (placemarks.isNotEmpty) {
        setState(() {
          _selectedAddress =
              "${placemarks.first.street}, ${placemarks.first.locality}, ${placemarks.first.country}";
        });
      }
    } catch (e) {
      setState(() {
        _selectedAddress = "Could not retrieve address.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Theme.of(context).primaryColor,
        backgroundColor: Theme.of(context).primaryColorDark,
        title: const Text("Police Stations"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 20.0, top: 10, left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Search for a Police Station",
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SearchBar(
                onSubmitted: (value) {
                  print(value);
                },
                textStyle: MaterialStateProperty.all(
                  TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
                leading: const Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Icon(Icons.search),
                ),
                hintText: "Accident location",
                hintStyle: MaterialStateProperty.all(
                  TextStyle(
                    color: Theme.of(context).hintColor,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Container(
                height: 400,
                width: MediaQuery.of(context).size.width - 40,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.tertiary,
                ),
                child: FlutterMap(
                  options: MapOptions(
                    initialCenter:
                        context.watch<LocationProvider>().currentLocation ??
                            const LatLng(
                              -1.2921,
                              36.8219,
                            ),
                    initialZoom: 13.0,
                    onTap: (tapPosition, latLng) {
                      _getAddressFromLatLng(latLng);
                    },
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                          "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                    ),
                    MarkerLayer(
                      markers: [
                        if (context.watch<LocationProvider>().currentLocation !=
                            null) // Only show the marker if the current location is available
                          Marker(
                            width: 80.0,
                            height: 80.0,
                            point: context
                                .watch<LocationProvider>()
                                .currentLocation!,
                            child: Builder(
                              builder: (context) => const Icon(
                                Icons.location_pin,
                                color: Colors.red,
                                size: 40,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 40,
                    child: Column(
                      children: [
                        Text(
                          _selectedAddress,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          context
                              .watch<LocationProvider>()
                              .currentLocation!
                              .longitude
                              .toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
