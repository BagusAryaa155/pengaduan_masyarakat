import 'package:flutter/material.dart';
import 'buat_pengaduan.dart';
import 'akun.dart';
import 'pengaduan.dart';
import 'notifikasi.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // BOTTOM NAVIGATION
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        currentIndex: 0,
        onTap: (index) {
          // MENU AKUN
          if (index == 4) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AkunPage()),
            );
          }
          //menu pengaduan
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PengaduanPage()),
            );
          }
          if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const NotifikasiPage()),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Beranda"),
          BottomNavigationBarItem(
            icon: Icon(Icons.confirmation_num),
            label: "Pengaduan",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle, size: 40),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: "Notifikasi",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Akun"),
        ],
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // HEADER
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("Halo, Warga", style: TextStyle(fontSize: 16)),
                        SizedBox(height: 5),
                        Text(
                          "selamat datang di",
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        SizedBox(height: 3),
                        Text(
                          "Desa Maju Bersama",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    const CircleAvatar(
                      radius: 18,
                      backgroundColor: Colors.transparent,
                      child: Icon(
                        Icons.account_circle,
                        size: 35,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // BANNER
                Stack(
                  children: [
                    Container(
                      height: 220,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                          image: NetworkImage(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRSUgZnChkoRJWVhaAgq4X48HJkou3kN5i23w&s",
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    Positioned(
                      bottom: 15,
                      left: 15,
                      right: 15,
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Sampaikan keluhan Anda",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 8),

                            const Text(
                              "Kami siap mendengar dan menindaklanjuti",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),

                            const SizedBox(height: 15),

                            SizedBox(
                              height: 35,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const BuatPengaduanPage(),
                                    ),
                                  );
                                },
                                child: const Text(
                                  "Buat Pengaduan",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 25),

                // TITLE
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Pengaduan terbaru",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PengaduanPage(),
                          ),
                        );
                      },
                      child: Text(
                        "Lihat Semua",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 15),

                // LIST
                buildPengaduan(
                  "Jalan rusak di depan balai desa",
                  "Diproses",
                  Colors.orange,
                ),

                buildPengaduan("Lampu jalan mati", "Selesai", Colors.green),

                buildPengaduan(
                  "Jalan rusak di depan balai desa",
                  "Diproses",
                  Colors.orange,
                ),

                buildPengaduan(
                  "Jalan rusak di depan balai desa",
                  "Diproses",
                  Colors.orange,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildPengaduan(String title, String status, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_dNOHeX67qYnC1tEIxltXB4c4Gy6QyyviCw&s",
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(width: 10),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 5),
                const Text(
                  "20 Mei 2026",
                  style: TextStyle(fontSize: 11, color: Colors.grey),
                ),
              ],
            ),
          ),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              status,
              style: TextStyle(
                color: color,
                fontSize: 11,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
