import 'package:flutter/material.dart';
import 'landingpage.dart';

class AkunPage extends StatelessWidget {
  const AkunPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: const Text(
          "Akun Saya",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [

            // PROFILE CARD
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: Colors.grey.shade300,
                ),
              ),
              child: Row(
                children: [

                  const CircleAvatar(
                    radius: 28,
                    backgroundColor: Color(0xffE8E8E8),
                    child: Icon(
                      Icons.person_outline,
                      size: 35,
                      color: Colors.black,
                    ),
                  ),

                  const SizedBox(width: 12),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [

                      Text(
                        "Warga Desa",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),

                      SizedBox(height: 3),

                      Text(
                        "warga@gmail.com",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),

                      SizedBox(height: 2),

                      Text(
                        "0812-3456-7890",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),

            const SizedBox(height: 18),

            // MENU
            _menuTile(
              context,
              icon: Icons.person_outline,
              title: "Profile Saya",
              subtitle: "Lihat dan edit profile",
              page: const ProfilePage(),
            ),

            _menuTile(
              context,
              icon: Icons.lock_outline,
              title: "Ubah Password",
              subtitle: "Ganti password akun",
              page: const UbahPasswordPage(),
            ),

            _menuTile(
              context,
              icon: Icons.history,
              title: "Riwayat Pengaduan",
              subtitle: "Lihat semua pengaduan",
              page: const RiwayatPage(),
            ),

            _menuTile(
              context,
              icon: Icons.edit_outlined,
              title: "Edit Profil",
              subtitle: "Edit informasi akun anda",
              page: const EditProfilPage(),
            ),

            const Spacer(),

            // LOGOUT BUTTON
            SizedBox(
              width: double.infinity,
              height: 45,
              child: OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.red),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),

                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LogoutPage(),
                    ),
                  );
                },

                icon: const Icon(
                  Icons.logout,
                  color: Colors.red,
                ),

                label: const Text(
                  "Keluar",
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _menuTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required Widget page,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        subtitle: Text(subtitle),

        trailing: const Icon(Icons.arrow_forward_ios, size: 16),

        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => page,
            ),
          );
        },
      ),
    );
  }
}

// ================= PROFILE =================

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profil Saya"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            const CircleAvatar(
              radius: 45,
              child: Icon(Icons.person, size: 50),
            ),

            const SizedBox(height: 15),

            const Text(
              "Warga Desa",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 5),

            const Text(
              "Masyarakat Desa Maju Bersama",
            ),

            const SizedBox(height: 25),

            _info(Icons.person, "Nama Lengkap", "Warga Desa"),
            _info(Icons.email, "Email", "warga@gmail.com"),
            _info(Icons.phone, "Nomor Telepon", "0812-3456-7890"),
            _info(Icons.location_on, "Alamat", "Desa Maju Bersama"),
            _info(Icons.cake, "Tanggal Lahir", "01 Januari 2000"),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const EditProfilPage(),
                    ),
                  );
                },

                child: const Text("Edit Profile"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _info(IconData icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Row(
        children: [

          Icon(icon),

          const SizedBox(width: 12),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),

              Text(value),
            ],
          ),
        ],
      ),
    );
  }
}

// ================= EDIT PROFILE =================

class EditProfilPage extends StatelessWidget {
  const EditProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Profil"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            const CircleAvatar(
              radius: 45,
              child: Icon(Icons.person, size: 50),
            ),

            const SizedBox(height: 20),

            _field("Nama Lengkap"),
            _field("Email"),
            _field("Nomor Telepon"),
            _field("Alamat"),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },

                child: const Text("Simpan Perubahan"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _field(String hint) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextField(
        decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}

// ================= PASSWORD =================

class UbahPasswordPage extends StatelessWidget {
  const UbahPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ubah Password"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            const CircleAvatar(
              radius: 45,
              child: Icon(Icons.lock, size: 45),
            ),

            const SizedBox(height: 25),

            _password("Password Lama"),
            _password("Password Baru"),
            _password("Konfirmasi Password Baru"),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {},

                child: const Text("Ubah Password"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _password(String hint) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextField(
        obscureText: true,

        decoration: InputDecoration(
          hintText: hint,

          suffixIcon: const Icon(Icons.visibility_off),

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}

// ================= RIWAYAT =================

class RiwayatPage extends StatelessWidget {
  const RiwayatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Riwayat Pengaduan"),
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 5,

        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: const Icon(Icons.report_problem),
              title: Text("Pengaduan ${index + 1}"),
              subtitle: const Text("Status: Diproses"),
            ),
          );
        },
      ),
    );
  }
}

// ================= LOGOUT =================

class LogoutPage extends StatelessWidget {
  const LogoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const Icon(
              Icons.logout,
              color: Colors.red,
              size: 120,
            ),

            const SizedBox(height: 30),

            const Text(
              "Yakin ingin keluar?",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              "Anda akan keluar dari akun dan perlu login kembali.",
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 40),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),

                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LandingPage(),
                    ),
                    (route) => false,
                  );
                },

                child: const Text(
                  "Keluar",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 12),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                },

                child: const Text("Batal"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}