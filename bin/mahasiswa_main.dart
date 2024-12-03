import 'dart:io';
import '../lib/mahasiswa.dart';
import '../lib/mata_kuliah.dart';

// Fungsi untuk memasukkan nilai mahasiswa
// Menampilkan daftar mata kuliah yang sudah diambil dan memungkinkan pengguna mengisi nilai.
// Mencegah pengisian nilai ulang jika sudah pernah dimasukkan.
void inputNilai(Mahasiswa mahasiswa) {
  if (mahasiswa.krs.daftarMataKuliah.isEmpty) {
    print("Tidak ada mata kuliah yang tersedia.");
    return;
  }

  print("Pilih mata kuliah:");
  int i = 1;
  for (var mk in mahasiswa.krs.daftarMataKuliah) {
    // Periksa apakah nilai sudah diisi untuk mata kuliah ini
    bool sudahDinilai = mahasiswa.nilai.any((n) => n.mataKuliah == mk);
    print(
        "$i. ${mk.nama} (${mk.kode}) ${sudahDinilai ? '[Sudah Dinilai]' : ''}");
    i++;
  }
  print("$i. Kembali");

  int pilihan = int.parse(stdin.readLineSync()!);
  if (pilihan == i) {
    return;
  }

  int indexMK = pilihan - 1;
  MataKuliah mataKuliah = mahasiswa.krs.daftarMataKuliah[indexMK];

  // Cek jika sudah dinilai
  if (mahasiswa.nilai.any((n) => n.mataKuliah == mataKuliah)) {
    print("Nilai untuk mata kuliah ini sudah diisi.");
    return;
  }

  print("Masukkan nilai: ");
  double nilai = double.parse(stdin.readLineSync()!);

  mahasiswa.tambahNilai(mataKuliah, nilai);
  print("Nilai berhasil ditambahkan.");
}

// Void untuk mencetak krs serta menampilkan semua mata kuliah yang diambil oleh mahasiswa beserta status apakah nilai sudah dimasukkan.
void cetakKRS(Mahasiswa mahasiswa) {
  print("KRS Mahasiswa: ${mahasiswa.nama} (${mahasiswa.nim})");
  print("-" * 30);
  print("Kode | Nama | SKS | Status");
  print("-" * 30);
  for (var mk in mahasiswa.krs.daftarMataKuliah) {
    // Periksa apakah nilai sudah diisi
    bool sudahDinilai = mahasiswa.nilai.any((n) => n.mataKuliah == mk);
    String status = sudahDinilai ? "Sudah Dinilai" : "Belum Dinilai";
    print("${mk.kode} | ${mk.nama} | ${mk.sks} | $status");
  }
}

// Void untuk mencetak transrip nilai mahasiswa serta menampilkan kode mata kuliah, nama, SKS, nilai, dan IPK (Indeks Prestasi Kumulatif).
void cetakTranskrip(Mahasiswa mahasiswa) {
  print("Transkrip Nilai Mahasiswa: ${mahasiswa.nama} (${mahasiswa.nim})");
  print("-" * 30);
  print("Kode | Nama | SKS | Nilai");
  print("-" * 30);
  for (var nilai in mahasiswa.nilai) {
    print(
        "${nilai.mataKuliah.kode} | ${nilai.mataKuliah.nama} | ${nilai.mataKuliah.sks} | ${nilai.nilai}");
  }
  print("IPK: ${mahasiswa.hitungIPK()}");
}

void main() {
  // Inisialisasi data mata kuliah
  List<MataKuliah> mataKuliahList = [
    MataKuliah(kode: "MK01", nama: "Pemrograman Berorientasi Objek", sks: 2),
    MataKuliah(kode: "MK02", nama: "Matematika Diskrit", sks: 3),
    MataKuliah(kode: "MK03", nama: "Statistika", sks: 3),
  ];

  // Inisialisasi data mahasiswa
  Mahasiswa mahasiswa1 = Mahasiswa(
      nim: "230103140", nama: "Lintang Wahyu Aji Saputro", semester: 3);

  for (var mk in mataKuliahList) {
    mahasiswa1.krs.tambahMataKuliah(mk);
  }

  while (true) {
    print("\nMenu:");
    print("1. Input Nilai");
    print("2. Cetak KRS");
    print("3. Cetak Transkrip");
    print("4. Keluar");
    print("Pilih opsi: ");

    int pilihan = int.parse(stdin.readLineSync()!);

    switch (pilihan) {
      case 1:
        inputNilai(mahasiswa1);
        break;
      case 2:
        cetakKRS(mahasiswa1);
        break;
      case 3:
        cetakTranskrip(mahasiswa1);
        break;
      case 4:
        print("Keluar dari program.");
        return;
      default:
        print("Pilihan tidak valid. Silakan coba lagi.");
    }
  }
}
