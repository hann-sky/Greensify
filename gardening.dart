import 'package:flutter/material.dart';

class GardeningGuidePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Panduan Berkebun"),
        backgroundColor: Colors.green[600],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Tips Perawatan Tanaman
              Text(
                "Tips Perawatan Tanaman",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green),
              ),
              SizedBox(height: 8),
              Text(
                "1. Pastikan tanaman mendapat cahaya yang cukup.\n"
                "2. Sirami tanaman sesuai kebutuhan.\n"
                "3. Gunakan pupuk organik secara teratur untuk pertumbuhan optimal.",
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),
              SizedBox(height: 24),

              // Penjelasan tentang pH tanah
              Text(
                "Penjelasan tentang pH Tanah",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green),
              ),
              SizedBox(height: 8),
              Text(
                "pH tanah menentukan seberapa asam atau basa tanah tersebut. Tanah dengan pH yang tepat akan membantu tanaman tumbuh lebih baik. "
                "Tanah dengan pH rendah (asam) cocok untuk tanaman tertentu, sedangkan pH tinggi (basa) lebih baik untuk tanaman lain.",
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),
              SizedBox(height: 24),

              // Gambar tanaman dengan transparansi
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    'image/image.jpg',
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    color: Colors.black.withOpacity(0.7),
                    width: double.infinity,
                    height: 200,
                  ),
                  Center(
                    child: Text(
                      "Tanaman yang Sehat",
                      style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
