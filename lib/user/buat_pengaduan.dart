import 'package:flutter/material.dart';

class BuatPengaduanPage extends StatefulWidget {
  const BuatPengaduanPage({super.key});

  @override
  State<BuatPengaduanPage> createState() => _BuatPengaduanPageState();
}

class _BuatPengaduanPageState extends State<BuatPengaduanPage> {
  String? urgensi;
  String? dampak;
  String? sensitivitas;
  String? alternatif;
  String? cakupan;

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
          "Buat Pengaduan",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // JUDUL
            const Text(
              "Judul Pengaduan",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            _buildTextField(
              hint: "Masukan Permasalahan",
            ),

            const SizedBox(height: 18),

            // LOKASI
            const Text(
              "Lokasi Kejadian",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            _buildTextField(
              hint: "Pilih lokasi atau tulis alamat",
            ),

            const SizedBox(height: 18),

            // DESKRIPSI
            const Text(
              "Keluhan / Deskripsi",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: const TextField(
                maxLines: 5,
                decoration: InputDecoration(
                  hintText:
                      "Tuliskan keluhan Anda secara detail...",
                  border: InputBorder.none,
                ),
              ),
            ),

            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  "0/1000",
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 12,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 18),

            // DROPDOWN
            const Text(
              "Tingkat Urgensi",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            _buildDropdown(
              value: urgensi,
              hint: "Pilih Tingkat Urgensi",
              items: ["Rendah", "Sedang", "Tinggi"],
              onChanged: (value) {
                setState(() {
                  urgensi = value;
                });
              },
            ),

            const SizedBox(height: 18),

            const Text(
              "Dampak Keselamatan",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            _buildDropdown(
              value: dampak,
              hint: "Masukan dampak keselamatan",
              items: ["Tidak Ada", "Sedikit", "Berbahaya"],
              onChanged: (value) {
                setState(() {
                  dampak = value;
                });
              },
            ),

            const SizedBox(height: 18),

            const Text(
              "Sensitivitas Waktu",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            _buildDropdown(
              value: sensitivitas,
              hint: "Masukan sensitivitas waktu",
              items: ["Normal", "Cepat", "Sangat Mendesak"],
              onChanged: (value) {
                setState(() {
                  sensitivitas = value;
                });
              },
            ),

            const SizedBox(height: 18),

            const Text(
              "Ketersediaan Alternatif",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            _buildDropdown(
              value: alternatif,
              hint: "Masukan ketersediaan alternatif",
              items: ["Ada", "Tidak Ada"],
              onChanged: (value) {
                setState(() {
                  alternatif = value;
                });
              },
            ),

            const SizedBox(height: 18),

            const Text(
              "Cakupan Populasi",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            _buildDropdown(
              value: cakupan,
              hint: "Masukan cakupan lokasi",
              items: ["Sedikit", "Sedang", "Banyak"],
              onChanged: (value) {
                setState(() {
                  cakupan = value;
                });
              },
            ),

            const SizedBox(height: 20),

            // FOTO
            Row(
              children: [
                const Text(
                  "Foto Bukti",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 5),
                Text(
                  "(Maks 5 foto)",
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 12,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            Row(
              children: [

                // TAMBAH FOTO
                Container(
                  width: 65,
                  height: 65,
                  decoration: BoxDecoration(
                    color: const Color(0xffD9E9F7),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add,
                        color: Colors.blue,
                        size: 28,
                      ),
                      SizedBox(height: 3),
                      Text(
                        "Tambah\nFoto",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 10),

                _buildImagePreview(),
                const SizedBox(width: 10),
                _buildImagePreview(),
              ],
            ),

            const SizedBox(height: 30),

            // BUTTON
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  "Kirim Pengaduan",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({required String hint}) {
    return TextField(
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 15,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Colors.grey.shade300,
          ),
        ),
      ),
    );
  }

  Widget _buildDropdown({
    required String? value,
    required String hint,
    required List<String> items,
    required Function(String?) onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          isExpanded: true,
          hint: Text(hint),
          items: items.map((item) {
            return DropdownMenuItem(
              value: item,
              child: Text(item),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }

  Widget _buildImagePreview() {
    return Stack(
      children: [
        Container(
          width: 65,
          height: 65,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: const DecorationImage(
              image: AssetImage('assets/images/jalanberlubang.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),

        Positioned(
          right: 0,
          top: 0,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.close,
              size: 16,
            ),
          ),
        ),
      ],
    );
  }
}