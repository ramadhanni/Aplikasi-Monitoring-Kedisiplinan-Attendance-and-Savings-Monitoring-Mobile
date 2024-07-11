import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/pengajuan_pengambilan_tabungan.dart';

class ApiService {
  static const String baseUrl = 'http://192.168.0.101/api_proyek3/Config-mobile/pengajuan_tabungan.php';

  Future<void> createPengajuan(PengajuanPengambilanTabungan pengajuan) async {
    final response = await http.post(
      Uri.parse('$baseUrl/pengajuan_tabungan.php'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(pengajuan.toJson()),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to create pengajuan');
    }
  }
}