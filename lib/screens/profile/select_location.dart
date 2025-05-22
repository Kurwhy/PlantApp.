import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class SelectLocationScreen extends StatefulWidget {
  const SelectLocationScreen({super.key});

  @override
  State<SelectLocationScreen> createState() => _SelectLocationScreenState();
}

class _SelectLocationScreenState extends State<SelectLocationScreen> {
  LatLng _selectedPosition = const LatLng(-6.1754, 106.8272); // Lokasi awal Jakarta
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

  Future<void> _useCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Layanan lokasi tidak aktif")),
      );
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Izin lokasi ditolak")),
        );
        return;
      }
    }

    final position = await Geolocator.getCurrentPosition();
    _onMapTap(LatLng(position.latitude, position.longitude));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pilih Lokasi")),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: _selectedPosition,
              zoom: 14,
            ),
            onMapCreated: (controller) => _mapController = controller,
            onTap: _onMapTap,
            markers: {
              Marker(markerId: const MarkerId("selected"), position: _selectedPosition),
            },
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
          ),
          Positioned(
            top: 16,
            right: 16,
            child: FloatingActionButton(
              onPressed: _useCurrentLocation,
              child: const Icon(Icons.my_location),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 16,
            right: 16,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: const [BoxShadow(blurRadius: 4, color: Colors.black26)],
                  ),
                  child: Text(_selectedAddress),
                ),
                const SizedBox(height: 10),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(context, _selectedAddress);
                  },
                  icon: const Icon(Icons.check),
                  label: const Text("Pilih Lokasi Ini"),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}