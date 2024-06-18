import 'package:flutter/material.dart';

class ProfilLengkap extends StatefulWidget {
  const ProfilLengkap({super.key});
  @override
  _ProfilLengkapState createState() => _ProfilLengkapState();
}

class _ProfilLengkapState extends State<ProfilLengkap> {
  @override
  build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text('Profil Lengkap'),
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
              children: <Widget>[
                listProfil(context),
              ],
            )
          ],
        ),
      ),
    );
  }
}


Widget listProfil(BuildContext context) {
  return Container(
    margin: const EdgeInsets.only(left: 20),
    child: const Column(
    crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 50,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Nama',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w300
              ),
            ),
            Text(
              'Mohamad Mughni Rahadiansyah',
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        Divider(
          color: Color.fromARGB(133, 220, 220, 220),
          thickness: 2,
          endIndent: 18,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'NIS',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w300
              ),
            ),
            Text(
              '0000001',
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        Divider(
          color: Color.fromARGB(133, 220, 220, 220),
          thickness: 2,
          endIndent: 18,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'NISN',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w300
              ),
            ),
            Text(
              '0000001',
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        Divider(
          color: Color.fromARGB(133, 220, 220, 220),
          thickness: 2,
          endIndent: 18,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Tempat, Tanggal lahir',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w300
              ),
            ),
            Text(
              'Indramayu, 31 Februari 2016',
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        Divider(
          color: Color.fromARGB(133, 220, 220, 220),
          thickness: 2,
          endIndent: 18,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Jenis Kelamin',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w300
              ),
            ),
            Text(
              'Laki-laki',
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        Divider(
          color: Color.fromARGB(133, 220, 220, 220),
          thickness: 2,
          endIndent: 18,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Orangtua/Wali',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w300
              ),
            ),
            Text(
              'Fulan',
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        Divider(
          color: Color.fromARGB(133, 220, 220, 220),
          thickness: 2,
          endIndent: 18,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'No Telepon',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w300
              ),
            ),
            Text(
              '0818042605',
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        Divider(
          color: Color.fromARGB(133, 220, 220, 220),
          thickness: 2,
          endIndent: 18,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Alamat',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w300
              ),
            ),
            Text(
              'Jl. Udang IV',
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        Divider(
          color: Color.fromARGB(133, 220, 220, 220),
          thickness: 2,
          endIndent: 18,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Tahun Ajaran',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w300
              ),
            ),
            Text(
              '2023/2024',
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        Divider(
          color: Color.fromARGB(133, 220, 220, 220),
          thickness: 2,
          endIndent: 18,
        ),
      ],
    ),
  );
}
