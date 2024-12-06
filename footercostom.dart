import 'package:flutter/material.dart';

class CustomFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.green[600],
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FooterIcon(
              icon: Icons.dashboard,
              label: "Dashboard",
              onTap: () {
                Navigator.pushNamed(context, '/dashboard');
              },
            ),
            FooterIcon(
              icon: Icons.school,
              label: "Edukasi",
              onTap: () {
                Navigator.pushNamed(context, '/education');
              },
            ),
            FooterIcon(
              icon: Icons.nature,
              label: "Panduan",
              onTap: () {
                Navigator.pushNamed(context, '/gardening-guide');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class FooterIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  FooterIcon({required this.icon, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white, size: 24), // Ukuran ikon disesuaikan
          SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12, // Ukuran teks disesuaikan
              overflow: TextOverflow.ellipsis, // Hindari overflow
            ),
          ),
        ],
      ),
    );
  }
}
