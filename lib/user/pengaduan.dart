import 'package:flutter/material.dart';
import 'detail_pengaduan.dart';

class PengaduanPage extends StatefulWidget {
  const PengaduanPage({super.key});

  @override
  State<PengaduanPage> createState() =>
      _PengaduanPageState();
}

class _PengaduanPageState
    extends State<PengaduanPage> {

  int selectedIndex = 0;

  final List<String> tabs = [
    "Semua",
    "Menunggu",
    "Diproses",
    "Selesai",
  ];

  final List<Map<String, dynamic>> pengaduan = [
    {
      "kode": "#PGD-2026-00012",
      "judul": "Infrastruktur Jalan",
      "tanggal": "20 Mei 2026, 12.25 WITA",
      "lokasi": "Jl. Raya Desa Buleleng",
      "status": "Menunggu",
    },
    {
      "kode": "#PGD-2026-00011",
      "judul": "Infrastruktur Jalan",
      "tanggal": "20 Mei 2026, 12.25 WITA",
      "lokasi": "Jl. Raya Desa Buleleng",
      "status": "Diproses",
    },
    {
      "kode": "#PGD-2026-00010",
      "judul": "Fasilitas Umum",
      "tanggal": "20 Mei 2026, 12.25 WITA",
      "lokasi": "Jl. Raya Desa Buleleng",
      "status": "Diproses",
    },
    {
      "kode": "#PGD-2026-00009",
      "judul": "Kebersihan lingkungan",
      "tanggal": "20 Mei 2026, 12.25 WITA",
      "lokasi": "Jl. Raya Desa Buleleng",
      "status": "Diproses",
    },
    {
      "kode": "#PGD-2026-00008",
      "judul": "Penerangan Jalan",
      "tanggal": "20 Mei 2026, 12.25 WITA",
      "lokasi": "Jl. Raya Desa Buleleng",
      "status": "Selesai",
    },
  ];

  @override
  Widget build(BuildContext context) {

    List<Map<String, dynamic>> filtered = pengaduan.where((item) {

      if (selectedIndex == 0) {
        return true;
      }

      return item["status"] == tabs[selectedIndex];

    }).toList();

    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(
          color: Colors.black,
        ),
        centerTitle: true,
        title: const Text(
          "Cek Status Pengaduan",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          children: [

            // TAB
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
              children: List.generate(
                tabs.length,
                (index) {
                  bool active =
                      selectedIndex == index;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Container(
                      padding:
                          const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 7,
                      ),
                      decoration: BoxDecoration(
                        color: active
                            ? Colors.blue
                            : Colors.grey.shade200,
                        borderRadius:
                            BorderRadius.circular(8),
                      ),
                      child: Text(
                        tabs[index],
                        style: TextStyle(
                          color: active
                              ? Colors.white
                              : Colors.black,
                          fontSize: 12,
                          fontWeight:
                              FontWeight.w500,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 18),

            // LIST
            Expanded(
              child: ListView.builder(
                itemCount: filtered.length,
                itemBuilder: (context, index) {

                  final item = filtered[index];

                  return Container(
                    margin:
                        const EdgeInsets.only(
                      bottom: 14,
                    ),
                    padding:
                        const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey.shade300,
                      ),
                      borderRadius:
                          BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [

                        Row(
                          mainAxisAlignment:
                              MainAxisAlignment
                                  .spaceBetween,
                          children: [

                            Text(
                              item["kode"],
                              style:
                                  const TextStyle(
                                fontSize: 11,
                                color: Colors.grey,
                              ),
                            ),

                            Container(
                              padding:
                                  const EdgeInsets
                                      .symmetric(
                                horizontal: 10,
                                vertical: 4,
                              ),
                              decoration:
                                  BoxDecoration(
                                color: getStatusColor(
                                        item[
                                            "status"])
                                    .withOpacity(
                                        0.2),
                                borderRadius:
                                    BorderRadius
                                        .circular(
                                            6),
                              ),
                              child: Text(
                                item["status"],
                                style:
                                    TextStyle(
                                  color:
                                      getStatusColor(
                                          item[
                                              "status"]),
                                  fontSize: 11,
                                  fontWeight:
                                      FontWeight
                                          .bold,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 8),

                        Text(
                          item["judul"],
                          style: const TextStyle(
                            fontWeight:
                                FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),

                        const SizedBox(height: 5),

                        Text(
                          item["tanggal"],
                          style: TextStyle(
                            color:
                                Colors.grey.shade600,
                            fontSize: 11,
                          ),
                        ),

                        const SizedBox(height: 5),

                        Row(
                          children: [

                            Icon(
                              Icons.location_on,
                              size: 14,
                              color:
                                  Colors.grey.shade600,
                            ),

                            const SizedBox(width: 4),

                            Text(
                              item["lokasi"],
                              style: TextStyle(
                                color: Colors
                                    .grey.shade600,
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 10),

                        GestureDetector(
                           onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const DetailPengaduanPage(),
                              ),
                            );

                          },
                        child: Align(
                          alignment:
                              Alignment.centerRight,
                          child: Text(
                            "Lihat detail",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 11,
                            ),
                          ),
                        ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color getStatusColor(String status) {

    switch (status) {

      case "Menunggu":
        return Colors.orange;

      case "Diproses":
        return Colors.deepOrange;

      case "Selesai":
        return Colors.green;

      default:
        return Colors.grey;
    }
  }
}