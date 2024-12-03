import 'krs.dart';
import 'mata_kuliah.dart';
import 'nilai.dart';

// Kelas Mahasiswa untuk merepresentasikan data dan operasi yang berkaitan dengan mahasiswa
class Mahasiswa {
  String nim;
  String nama;
  int semester;
  late KRS krs;
  List<Nilai> nilai = [];
  List<MataKuliah> mataKuliahTerisi = []; 

// Menggunakan konstruktor untuk menginisialisasi data mahasiswa dan objek KRS
  Mahasiswa({required this.nim, required this.nama, required this.semester}) {
    krs = KRS(this);
  }

// Metode untuk menambahkan nilai mata kuliah ke daftar nilai mahasiswa
  void tambahNilai(MataKuliah mataKuliah, double nilai) {
    this.nilai.add(Nilai(mataKuliah: mataKuliah, nilai: nilai));
    mataKuliahTerisi.add(mataKuliah); // Tambahkan mata kuliah ke daftar terisi
  }

  double hitungIPK() {
    double totalSks = 0;
    double totalNilaiBerbobot = 0;

    // Konversi nilai ke bobot
    double konversiNilaiKeBobot(double nilai) {
      if (nilai >= 85) return 4.0; // A
      if (nilai >= 70) return 3.0; // B
      if (nilai >= 55) return 2.0; // C
      if (nilai >= 40) return 1.0; // D
      return 0.0; // E
    }

    for (var nilai in this.nilai) {
      double bobot = konversiNilaiKeBobot(nilai.nilai); // Konversi ke bobot
      totalSks += nilai.mataKuliah.sks; // Akumulasi SKS
      totalNilaiBerbobot +=
          bobot * nilai.mataKuliah.sks; // Akumulasi nilai berbobot
    }

    if (totalSks == 0) {
      return 0; // Hindari pembagian dengan nol
    }
    return totalNilaiBerbobot / totalSks; // Rata-rata berbobot
  }
}
