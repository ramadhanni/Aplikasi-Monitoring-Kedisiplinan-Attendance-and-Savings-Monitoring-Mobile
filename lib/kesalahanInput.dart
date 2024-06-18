import 'package:flutter/material.dart';

class KesalahanInput extends StatefulWidget {
  const KesalahanInput({super.key});
  @override
  _KesalahanInputState createState() => _KesalahanInputState();
}

class _KesalahanInputState extends State<KesalahanInput> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kesalahan Input'),
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
              input()
            ],
          )
        ],
      ),
    ));
  }
}

Widget input() {
  return 
      Center(
        child: Column(
          children: [
            Container(
              width: 370,
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12),
              margin: const EdgeInsets.only(top:40),
              decoration: const BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10)
                )
              ),
              child: const Text(
                'Ajukan Kesalahan Input',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17
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
                    color: Colors.teal
                  ),
                  right: BorderSide(
                    width: 1,
                    color: Colors.teal
                  ),
                  left: BorderSide(
                    width: 1,
                    color: Colors.teal
                  )
                )
              ),
              child: const TextField(
                maxLines: 7,
                decoration: InputDecoration(
                  border: InputBorder.none, 
                ),
              ),
            ),
            Container(
              width: 370,
              color: Colors.teal,
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
              child: const Text(
                'Kirim',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17
                ),
              ),
            )
          ],
        )

  );
}
