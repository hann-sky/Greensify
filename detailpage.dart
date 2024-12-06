import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final String name;
  final String scientificName;
  final String family;
  final String genus;
  final String imageUrl;
  final String description;

  DetailPage({
    required this.name,
    required this.scientificName,
    required this.family,
    required this.genus,
    required this.imageUrl,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          name,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green[600],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Gambar tanaman
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        Icon(Icons.error, size: 50, color: Colors.red),
                  ),
                ),
              ),
              SizedBox(height: 24),

              // Nama tanaman
              Text(
                name,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.green[800],
                ),
              ),
              SizedBox(height: 8),

              // Nama ilmiah (italic)
              Text(
                scientificName.isNotEmpty
                    ? "Nama Ilmiah: $scientificName"
                    : "Nama Ilmiah tidak tersedia",
                style: TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: 16),

              // Family dan Genus
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "Family: ${family.isNotEmpty ? family : "Tidak tersedia"}",
                      style: TextStyle(fontSize: 16, color: Colors.grey[800]),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      "Genus: ${genus.isNotEmpty ? genus : "Tidak tersedia"}",
                      style: TextStyle(fontSize: 16, color: Colors.grey[800]),
                    ),
                  ),
                ],
              ),
              Divider(height: 32, color: Colors.grey[300]),

              // Deskripsi
              Text(
                "Deskripsi",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.green[800],
                ),
              ),
              SizedBox(height: 12),
              Text(
                description.isNotEmpty
                    ? description
                    : "Deskripsi tidak tersedia.",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[700],
                  height: 1.5,
                ),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
