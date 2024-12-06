import 'package:flutter/material.dart';
import 'dashboard.dart'; // Pastikan jalur file sesuai dengan lokasi `Plant.dart`

void main() {
  runApp(PlantApp());
}

class PlantApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Plant EduApp',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      debugShowCheckedModeBanner: false, // Menghilangkan label debug di pojok aplikasi
      home: DashboardPage(), // Halaman awal diatur ke PlantPage
    );
  }
}