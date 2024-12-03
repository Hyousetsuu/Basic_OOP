import 'mata_kuliah.dart';

// Kelas Nilai merepresentasikan nilai yang diperoleh mahasiswa dalam suatu mata kuliah.
class Nilai {
  MataKuliah mataKuliah;
  double nilai;

// Konstruktor untuk menginisialisasi objek Nilai dengan mata kuliah dan nilai yang diperoleh.
  Nilai({required this.mataKuliah, required this.nilai});
}
