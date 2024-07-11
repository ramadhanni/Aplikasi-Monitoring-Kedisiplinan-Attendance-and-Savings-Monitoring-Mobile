import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/pengajuan_pengambilan_tabungan.dart';
import '../tabungan.dart';
import '../services/api_service.dart';

class PengambilanPage extends StatefulWidget {
  const PengambilanPage({super.key});

  @override
  _PengambilanPageState createState() => _PengambilanPageState();
}

class _PengambilanPageState extends State<PengambilanPage> {
  final _formKey = GlobalKey<FormState>();
  final _tglController = TextEditingController();
  final _nominalController = TextEditingController();
  final _idSiswaController = TextEditingController();
  final ApiService _apiService = ApiService();
  DateTime? _selectedDate;

  // Fungsi untuk menampilkan DatePicker dan menyimpan tanggal yang dipilih
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _tglController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengambilan'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[input(context)],
            )
          ],
        ),
      ),
    );
  }

  Widget input(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            width: 370,
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12),
            margin: const EdgeInsets.only(top: 40),
            decoration: const BoxDecoration(
              color: Colors.teal,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: const Text(
              'Ajukan Pengambilan Tabungan',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
              ),
            ),
          ),
          Container(
            width: 369,
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 1,
                  color: Colors.teal,
                ),
                right: BorderSide(
                  width: 1,
                  color: Colors.teal,
                ),
                left: BorderSide(
                  width: 1,
                  color: Colors.teal,
                ),
              ),
            ),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: _tglController,
                    readOnly: true,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Pilih Tanggal Pengambilan',
                      hintText: 'Tanggal Pengambilan',
                    ),
                    onTap: () => _selectDate(context),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Masukkan tanggal pengambilan';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _nominalController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Masukan Jumlah Pengambilan',
                      hintText: 'Jumlah Pengambilan',
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Masukkan jumlah pengambilan';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _idSiswaController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Masukan ID Siswa',
                      hintText: 'ID Siswa',
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Masukkan ID Siswa';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () async {
              if (_formKey.currentState!.validate()) {
                PengajuanPengambilanTabungan pengajuan =
                    PengajuanPengambilanTabungan(
                  tgl: _tglController.text,
                  nominal: double.parse(_nominalController.text),
                  idSiswa: int.parse(_idSiswaController.text),
                );

                try {
                  await _apiService.createPengajuan(pengajuan);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Pengajuan berhasil dibuat')),
                  );
                  // Navigasi ke halaman TabunganPage setelah Snackbar ditampilkan
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Tabungan()),
                  );
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Gagal membuat pengajuan')),
                  );
                }
              }
            },
            child: Container(
              width: 370,
              color: Colors.teal,
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
              child: const Text(
                'Kirim',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
