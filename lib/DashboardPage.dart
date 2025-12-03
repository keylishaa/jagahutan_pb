import 'package:flutter/material.dart';
import 'LoginUser.dart';
import 'transition.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Warna Background Gelap
    Color bgColor = const Color(0xFF1B2526);
    Color cardColor = const Color(0xFF2C3E3F);

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header & Login Link
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "LOGO",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: const [
                          Icon(Icons.location_on, color: Colors.green, size: 16),
                          SizedBox(width: 4),
                          Text("Bandung, Jawa Barat",
                              style: TextStyle(color: Colors.white70)),
                        ],
                      )
                    ],
                  ),
                  // Tombol Navigasi ke Login
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        SmoothRoute(page: const LoginUser()),
                      );
                    },
                    child: Row(
                      children: const [
                        Text("Login", style: TextStyle(color: Colors.white)),
                        Icon(Icons.arrow_forward, color: Colors.white, size: 16),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 30),

              // Menu Layanan (Circular Icons)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.teal.shade800,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text("Layanan",
                    style: TextStyle(color: Colors.white, fontSize: 12)),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildMenuIcon(Icons.assignment, "Lapor\nCepat"),
                  _buildMenuIcon(Icons.map, "Peta\nInteraktif"),
                  _buildMenuIcon(Icons.phone_in_talk, "Darurat"),
                ],
              ),
              const SizedBox(height: 30),

              // Aktivitas Terkini
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("Aktivitas Terkini",
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                  Text("Lihat Semua",
                      style: TextStyle(color: Colors.grey, fontSize: 12)),
                ],
              ),
              const SizedBox(height: 10),
              _buildActivityItem(cardColor, Icons.check_circle, "Laporan Disetujui",
                  "10 menit yang lalu • Kebakaran Hutan"),
              const SizedBox(height: 10),
              _buildActivityItem(cardColor, Icons.access_time_filled,
                  "Sedang Diproses", "3 Jam yang lalu • Pembuangan Limbah"),

              const SizedBox(height: 30),

              // Edukasi & Berita
              const Text("Edukasi & Berita",
                  style: TextStyle(color: Colors.white, fontSize: 16)),
              const SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildNewsCard(),
                    const SizedBox(width: 10),
                    _buildNewsCard(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: cardColor,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.assignment), label: 'Laporan'),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Peta'),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: 'Notifikasi'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Akun'),
        ],
      ),
    );
  }

  Widget _buildMenuIcon(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: Colors.white,
          child: Icon(icon, color: Colors.black87),
        ),
        const SizedBox(height: 8),
        Text(label,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white, fontSize: 12)),
      ],
    );
  }

  Widget _buildActivityItem(
      Color color, IconData icon, String title, String subtitle) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.white),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
              Text(subtitle,
                  style: const TextStyle(color: Colors.white54, fontSize: 10)),
            ],
          ),
          const Spacer(),
          const Icon(Icons.chevron_right, color: Colors.white54),
        ],
      ),
    );
  }

  Widget _buildNewsCard() {
    return Container(
      width: 200,
      height: 120,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(12),
        image: const DecorationImage(
          // Ganti dengan asset gambar hutan kamu
          image: NetworkImage('https://via.placeholder.com/200x120'),
          fit: BoxFit.cover,
        ),
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.6),
            borderRadius:
            const BorderRadius.vertical(bottom: Radius.circular(12)),
          ),
          child: const Text(
            "Pembakaran hutan...",
            style: TextStyle(color: Colors.white, fontSize: 10),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}