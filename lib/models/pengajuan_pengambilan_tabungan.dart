class PengajuanPengambilanTabungan {
  String tgl;
  double nominal;
  int idSiswa;

  PengajuanPengambilanTabungan({
    required this.tgl,
    required this.nominal,
    required this.idSiswa,
  });

  Map<String, dynamic> toJson() {
    return {
      'tgl' : tgl,
      'nominal' : nominal,
      'id_siswa' : idSiswa,
    };
  }
}