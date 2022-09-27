import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

const LatLng currentLocation = LatLng(23.6850, 90.3563);

class MyhomePage extends StatefulWidget {
  MyhomePage({super.key});

  @override
  State<MyhomePage> createState() => _MyhomePageState();
}

class _MyhomePageState extends State<MyhomePage> {
  late GoogleMapController googleMapController;

  final Map<String, Marker> _marker = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Google map"),
      ),
      body: GoogleMap(
        initialCameraPosition: const CameraPosition(
          target: currentLocation,
          zoom: 14,
        ),
        onMapCreated: (controller) {
          googleMapController = controller;
          addMarker("test", currentLocation);
        },
        markers: _marker.values.toSet(),
      ),
    );
  }

  void addMarker(String id, LatLng location) async {
    var markerIcon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(), "image/atiqur.jpg");
    var marker = Marker(
        markerId: MarkerId(id),
        position: location,
        infoWindow: const InfoWindow(
            title: "Title of place", snippet: "Some description on the place"),
        icon: markerIcon);

    _marker[id] = marker;
    setState(() {});
  }
}
