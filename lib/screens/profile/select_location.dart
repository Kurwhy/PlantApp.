import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class SelectLocation extends StatefulWidget {
  const SelectLocation({super.key});

  @override
  State<SelectLocation> createState() => _SelectLocationState();
}

class _SelectLocationState extends State<SelectLocation> {
  LatLng _selectedPosition = const LatLng(-6.1754, 106.8272);
  String _selectedAddress = "Memuat alamat...";
  late GoogleMapController _mapController;

  @override
  void initState() {
    super.initState();
    _getAddressFromLatLng();
  }

  Future<void> _getAddressFromLatLng() async {
    try {
      final placemarks = await placemarkFromCoordinates(
        _selectedPosition.latitude,
        _selectedPosition.longitude,
      );
      final place = placemarks.first;
      setState(() {
        _selectedAddress =
            "${place.name}, ${place.street}, ${place.locality}, ${place.country}";
      });
    } catch (e) {
      setState(() {
        _selectedAddress = "Gagal memuat alamat";
      });
    }
  }

  void _onMapTap(LatLng position) async {
    setState(() {
      _selectedPosition = position;
    });
    await _getAddressFromLatLng();
    _mapController.animateCamera(CameraUpdate.newLatLng(position));
  }
}
