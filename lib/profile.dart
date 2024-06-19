import 'package:flutter/material.dart';
import 'package:monitoring_attandacensavings/perubahanBiodata.dart';
import 'package:monitoring_attandacensavings/perubahanKataSandi.dart';
import 'package:monitoring_attandacensavings/profilLengkap.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              profileImage(context),
            ],
          )
        ],
      ),
    ));
  }
}

Widget profileImage(BuildContext context) {
  return Center(
    child: Column(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(top: 90),
        ),
        ClipOval(
          child: Image.asset(
            'image/batikheader.png',
            fit: BoxFit.cover,
            width: 130,
            height: 130,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          'Mohamad Mughni Rahadiansyah',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 21),
        ),
        const SizedBox(
          height: 1,
        ),
        const Text(
          'Siswa',
          style: TextStyle(fontWeight: FontWeight.w400, color: Colors.black54),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 40),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProfilLengkap()),
            );
          },
          child: const Row(
            children: <Widget>[
              SizedBox(
                height: 60,
                width: 20,
              ),
              Icon(
                Icons.account_circle_outlined,
                color: Colors.black54,
                size: 30,
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                'Profil Lengkap',
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
        const Divider(
          color: Color.fromARGB(133, 220, 220, 220),
          thickness: 2,
          indent: 20,
          endIndent: 20,
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PerubahanBiodata()),
            );
          },
          child: const Row(
            children: <Widget>[
              SizedBox(
                height: 60,
                width: 20,
              ),
              Icon(
                Icons.app_registration_rounded,
                color: Colors.black54,
                size: 30,
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                'Ajukan Perubahan Biodata',
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
        const Divider(
          color: Color.fromARGB(133, 220, 220, 220),
          thickness: 2,
          indent: 20,
          endIndent: 20,
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PerubahanSandi()),
            );
          },
          child: const Row(
            children: <Widget>[
              SizedBox(
                height: 60,
                width: 20,
              ),
              Icon(
                Icons.lock_outline_rounded,
                color: Colors.black54,
                size: 30,
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                'Ajukan Perubahan Kata Sandi',
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
        const Divider(
          color: Color.fromARGB(133, 220, 220, 220),
          thickness: 2,
          indent: 20,
          endIndent: 20,
        ),
        Container(
          width: 375,
          margin: const EdgeInsets.only(top: 230),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 35, 145, 149),
                Color.fromARGB(255, 24, 124, 128),
              ]),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: const Text(
            'KELUAR',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
      ],
    ),
  );
}
