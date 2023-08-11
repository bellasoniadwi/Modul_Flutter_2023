import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GeolocationApp(),
    );
  }
}

class GeolocationApp extends StatefulWidget {
  const GeolocationApp({super.key});

  @override
  State<GeolocationApp> createState() => _GeolocationAppState();
}

class _GeolocationAppState extends State<GeolocationApp> {
  // add dependencies: geolocator, geocoding
  // add permission in manifest
  // run
  // variable always inside the class
  Position? _currentLocation;
  late bool servicePermission = false;
  late LocationPermission permission;

  String _currentAddress = "";

  Future<Position> _getCurrentLocation() async {
    // check if we have permission to access location service
    servicePermission = await Geolocator.isLocationServiceEnabled();
    if (!servicePermission) {
      print("Service Disabled");
    }
    // service enabled
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    return await Geolocator.getCurrentPosition();
  }

  // test app

  // geocode coordinate and convert into address
  _getAddressFromCoordinates() async {
    try {
      List<Placemark> placesmarks = await placemarkFromCoordinates(
          _currentLocation!.latitude, _currentLocation!.longitude);

      Placemark place = placesmarks[0];

      setState(() {
        _currentAddress = "${place.locality}, ${place.country}";
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    // logic of the app

    // basic ui
    return Scaffold(
      appBar: AppBar(
        title: Text("Get User Location"),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Location Coordinates",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 6),
          Text(
              "Latitude = ${_currentLocation?.latitude} ; Longitude = ${_currentLocation?.longitude}"),
          SizedBox(
            height: 30.0,
          ),
          Text(
            "Location Address",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 6),
          Text("${_currentAddress}"),
          SizedBox(
            height: 50.0,
          ),
          ElevatedButton(
              onPressed: () async {
                // get current location here
                _currentLocation = await _getCurrentLocation();
                await _getAddressFromCoordinates();
                print("${_currentLocation}");
                print("${_currentAddress}");
              },
              child: Text("Get Location"))
        ],
      )),
    );
  }
}
