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
      debugShowCheckedModeBanner: false,
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
  
  late bool servicePermission = false;
  late LocationPermission permission;

  Future<Position> _getCurrentLocation() async {
    // periksa apakah memiliki izin untuk mengakses layanan lokasi
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

  Position? _currentLocation;
  String _currentAddress = "";
  // geocode koordinat dan konversi menjadi alamat
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
    return Scaffold(
      appBar: AppBar(
        title: Text("Get User Location"),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
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
            // menampilkan titik latitude, longitude
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
          Text(
            // menampilkan alamat
            "${_currentAddress}"),
          SizedBox(
            height: 50.0,
          ),
          ElevatedButton(
              onPressed: () async {
                _currentLocation = await _getCurrentLocation();
                await _getAddressFromCoordinates();
                // print untuk mengecek hasil pada console
                print("${_currentLocation}");
                print("${_currentAddress}");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pinkAccent
              ),
              child: Text("Get Location"))
        ],
      )),
    );
  }
}
