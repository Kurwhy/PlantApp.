import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../constants.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? _imageFile;
  String _address = "Belum dipilih";

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  Future<void> _loadProfile() async {
    final prefs = await SharedPreferences.getInstance();
    final imagePath = prefs.getString('profile_image');
    final address = prefs.getString('address');

    if (imagePath != null && File(imagePath).existsSync()) {
      setState(() {
        _imageFile = File(imagePath);
      });
    }

    if (address != null) {
      setState(() {
        _address = address;
      });
    }
  }

  Future<void> _saveImage(File image) async {
    final appDir = await getApplicationDocumentsDirectory();
    final fileName = 'profile.jpg';
    final savedImage = await image.copy('${appDir.path}/$fileName');

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('profile_image', savedImage.path);
  }
}
