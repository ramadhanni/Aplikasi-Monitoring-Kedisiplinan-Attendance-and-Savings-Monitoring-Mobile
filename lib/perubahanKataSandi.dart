import 'package:flutter/material.dart';

class PerubahanSandi extends StatefulWidget {
  const PerubahanSandi({super.key});
  @override
  _PerubahanSandiState createState() => _PerubahanSandiState();
}

class _PerubahanSandiState extends State<PerubahanSandi> {
  @override
  build(BuildContext) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajukan Perubahan Kata Sandi'),
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
              children: <Widget>[ input()],
            )
          ],
        ),
      ),
    );
  }
}


Widget input() {
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
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        child: const Text(
          'Ajukan Perubahan Kata Sandi',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontSize: 17),
        ),
      ),
      Container(
        width: 369,
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        decoration: const BoxDecoration(
            border: Border(
                bottom: BorderSide(width: 1, color: Colors.teal),
                right: BorderSide(width: 1, color: Colors.teal),
                left: BorderSide(width: 1, color: Colors.teal))),
                      child:const Column(
                children: [
                  TextField(
                    decoration: InputDecoration(  
                      border: InputBorder.none,  
                      labelText: 'Passowrd lama',  
                    ),  
                  ),
                  TextField(
                    decoration: InputDecoration(  
                      border: InputBorder.none,  
                      labelText: 'Password baru',  
                    ),  
                  ),
                  TextField(
                    decoration: InputDecoration(  
                      border: InputBorder.none,  
                      labelText: 'Konfirmasi password baru',  
                    ),  
                  ),
                ],
              )
      ),
      Container(
        width: 370,
        color: Colors.teal,
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
        child: const Text(
          'Kirim',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontSize: 17),
        ),
      )
    ],
  ));
}
