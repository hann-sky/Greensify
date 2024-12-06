import 'package:flutter/material.dart';
class EducationPage extends StatefulWidget {
  @override
  _EducationPageState createState() => _EducationPageState();
}

class _EducationPageState extends State<EducationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edukasi Merawat Tanaman"),
        backgroundColor: Colors.green[600],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Cara Merawat Tanaman",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green),
            ),
            SizedBox(height: 16),
            Text(
              "1. Penyiraman yang Tepat: Pastikan untuk menyiram tanaman sesuai dengan kebutuhan spesifiknya. Beberapa tanaman memerlukan lebih banyak air, sementara yang lain lebih suka tanah yang sedikit kering.",
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
            SizedBox(height: 16),
            Text(
              "2. Cahaya yang Cukup: Tanaman membutuhkan cahaya untuk fotosintesis. Pastikan mereka mendapatkan cahaya yang cukup, tetapi hindari sinar matahari langsung yang dapat membakar daun.",
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
            SizedBox(height: 16),
            Text(
              "3. Pemupukan: Memberikan pupuk secara rutin dapat membantu tanaman tumbuh sehat. Pilih pupuk yang sesuai dengan jenis tanaman yang Anda rawat.",
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
            SizedBox(height: 16),
            Text(
              "4. Pengendalian Hama: Periksa tanaman secara berkala untuk memastikan tidak ada hama atau penyakit yang menyerang. Jika ditemukan, lakukan perawatan dengan cara yang tepat.",
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
          ],
        ),
      ),
    );
  }
}
