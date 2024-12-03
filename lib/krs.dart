import 'mata_kuliah.dart';
import 'mahasiswa.dart';

class KRS {
  Mahasiswa mahasiswa; // Objek mahasiswa yang memiliki KRS ini
  List<MataKuliah> daftarMataKuliah = []; // Daftar mata kuliah yang dipilih oleh mahasiswa

  // Parameter mahasiswa digunakan untuk menghubungkan KRS ini ke objek Mahasiswa.
  KRS(this.mahasiswa);

  // Metode untuk menambahkan mata kuliah ke daftar mata kuliah dalam KRS
  void tambahMataKuliah(MataKuliah mataKuliah) {
    daftarMataKuliah.add(mataKuliah);
  }
}
