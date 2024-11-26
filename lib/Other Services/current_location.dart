import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:http/http.dart' as http;
import 'package:pet_app/constants.dart';

String cityName = '';

class CurrentLocation extends StatefulWidget {
  const CurrentLocation({super.key});

  @override
  State<CurrentLocation> createState() => _LoadingState();
}

class _LoadingState extends State<CurrentLocation> {
  static const apiKey = '9f24f45f1a43cd906106cb78433a7be0';
  double? latitude;
  double? longitude;

  @override
  void initState() {
    super.initState();
    getLocationAndFetchCity();
  }

  Future<void> getLocationAndFetchCity() async {
    await getLocation();
    if (latitude != null && longitude != null) {
      await fetchCityName(latitude!, longitude!);
    }
  }

  Future<void> getLocation() async {
    PermissionStatus permission = await Permission.location.request();

    if (permission == PermissionStatus.granted) {
      try {
        Position position = await Geolocator.getCurrentPosition(
          locationSettings: LocationSettings(
            accuracy: LocationAccuracy.best,
            distanceFilter: 10,
          ),
        );

        setState(() {
          latitude = position.latitude;
          longitude = position.longitude;
        });

        print("User's location: $latitude, $longitude");
      } catch (e) {
        print("Error fetching the location: $e");
      }
    } else if (permission == PermissionStatus.denied) {
      print("Location permission denied");
    } else if (permission == PermissionStatus.permanentlyDenied) {
      print('Location permission permanently denied');
      openAppSettings();
    }
  }

  Future<void> fetchCityName(double lat, double lon) async {
    final response = await http.get(Uri.parse(
        'http://api.openweathermap.org/geo/1.0/reverse?lat=$lat&lon=$lon&appid=$apiKey'));

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      if (data.isNotEmpty) {
        setState(() {
          cityName = data[0]['name'];
        });
        print('City: $cityName');
      }
    } else {
      print('Failed to fetch city name: ${response.body}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text(
          'Current Location',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: latitude != null && longitude != null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    cityName.isNotEmpty
                        ? 'Your City: $cityName'
                        : 'Fetching city...',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context, cityName);
                    },
                    child: const Text('Use This City'),
                  ),
                ],
              )
            : const CircularProgressIndicator(),
      ),
    );
  }
}
