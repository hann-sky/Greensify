import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'detailpage.dart';
import 'education.dart';
import 'gardening.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  List<dynamic> plants = [];
  bool isLoading = true;
  bool isSearching = false;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchPlants();
  }

  Future<void> fetchPlants() async {
    const String apiUrl = "https://trefle.io/api/v1/plants";
    const String token = "IgME07P4Qd0wIcW5TcE2DGvGciN6ZCl1XGBp9aRU-JA";

    try {
      final response = await http.get(Uri.parse("$apiUrl?token=$token"));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          plants = data['data'];
          isLoading = false;
        });
      } else {
        throw Exception("Failed to load plants");
      }
    } catch (e) {
      print(e);
      setState(() {
        isLoading = false;
      });
    }
  }

  void onSearch() {
    setState(() {
      isSearching = true;
    });

    final query = searchController.text.toLowerCase();
    setState(() {
      plants = plants.where((plant) {
        final commonName = plant['common_name']?.toLowerCase() ?? '';
        return commonName.contains(query);
      }).toList();
    });

    setState(() {
      isSearching = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green[600],
        title: Text("Greensify", style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              // Tambahkan fungsi logout
            },
          ),
        ],
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : plants.isEmpty
              ? Center(child: Text("Tidak ada data tanaman."))
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Search Bar
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: searchController,
                              decoration: InputDecoration(
                                hintText: "Cari tanaman...",
                                filled: true,
                                fillColor: Colors.grey[200],
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              ),
                            ),
                          ),
                          SizedBox(width: 8),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.yellow[600],
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
                            ),
                            onPressed: onSearch,
                            child: isSearching
                                ? CircularProgressIndicator()
                                : Text("Search"),
                          ),
                        ],
                      ),
                    ),

                    // Daftar Tanaman Populer
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        "Tanaman Populer",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 8),
                    Expanded(
                      child: GridView.builder(
                        padding: EdgeInsets.all(16),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 16,
                          childAspectRatio: 0.8,
                        ),
                        itemCount: plants.length,
                        itemBuilder: (context, index) {
                          final plant = plants[index];
                          return _buildPlantCard(
                            plant['common_name'] ?? "Nama Tidak Diketahui",
                            plant['scientific_name'] ?? "Nama Ilmiah Tidak Ada",
                            plant['image_url'] ??
                                "https://via.placeholder.com/150",
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 16),
                    // Navigation Buttons
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green[800],
                              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                            ),
                            onPressed: () {
                              // Navigate to Education page
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => EducationPage()),
                              );
                            },
                            child: Text("Education", style: TextStyle(color: Colors.white)),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green[800],
                              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                            ),
                            onPressed: () {
                              // Navigate to Gardening page
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => GardeningGuidePage()),
                              );
                            },
                            child: Text("Gardening", style: TextStyle(color: Colors.white)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
    );
  }

  Widget _buildPlantCard(String name, String scientificName, String imageUrl) {
    return GestureDetector(
      onTap: () {
        // Pindah ke halaman detail dengan data tanaman
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(
              name: name,
              scientificName: scientificName,
              family: "Fabaceae", // Contoh data, harus diganti dengan data API sebenarnya
              genus: "Acacia", // Contoh data, harus diganti dengan data API sebenarnya
              imageUrl: imageUrl,
              description: "Tanaman ini sering ditemukan di daerah tropis.", // Contoh deskripsi
            ),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      Icon(Icons.error),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                name,
                style: TextStyle(fontWeight: FontWeight.bold),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                scientificName,
                style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
