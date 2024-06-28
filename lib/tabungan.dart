import 'package:flutter/material.dart';
import 'package:monitoring_attandacensavings/kesalahanInput.dart';
import 'package:monitoring_attandacensavings/pengambilan.dart';

class Tabungan extends StatefulWidget {
  const Tabungan({super.key});

  @override
  _TabunganState createState() => _TabunganState();
}

class _TabunganState extends State<Tabungan> {
  String selectedMonth = 'April';

  void onMonthChanged(String? newValue) {
    setState(() {
      selectedMonth = newValue!;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                backgroundHeader(),
                detailTabungan(),
                jumBulan(),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: aktivitasTabungan(),
            )
          ],
        ),
      ),
    );
  }

  Widget backgroundHeader() {
    return Center(
      child: Container(
        height: 244,
        width: 385,
        margin: const EdgeInsets.only(top: 60),
        decoration: BoxDecoration(
            image: DecorationImage(
              image: const AssetImage("image/batikheader.png"),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.3),
                BlendMode.dstATop,
              ),
            ),
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            gradient: const LinearGradient(colors: [
              Color.fromARGB(255, 4, 108, 111),
              Color.fromARGB(255, 1, 65, 67),
            ])),
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 35),
            ),
            const Text(
              'Mohamad Mughni Rahadiansyah',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            const Text(
              'Rp.1000.000',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  fontSize: 30),
            ),
            const Text(
              'Total Tabungan',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                  fontSize: 17),
            ),
          ],
        ),
      ),
    );
  }

  Widget detailTabungan() {
    return Center(
      child: Container(
        width: 350,
        height: 90,
        margin: const EdgeInsets.only(top: 200),
        decoration: BoxDecoration(
          color: const Color.fromARGB(141, 66, 158, 157),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const KesalahanInput()),
                    );
                  },
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 45,
                        margin: const EdgeInsets.only(top: 15),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('image/LOGO.png'),
                          ),
                        ),
                      ),
                      const Text(
                        'Ajukan Kesalahan Input',
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontWeight: FontWeight.w300,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  )),
            ),
            Container(
              height: double.infinity,
              width: 1,
              color: const Color.fromARGB(123, 255, 255, 255),
            ),
            Expanded(
              child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PengambilanPage()),
                    );
                  },
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 45,
                        margin: const EdgeInsets.only(top: 15),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('image/LOGO.png'),
                          ),
                        ),
                      ),
                      const Text(
                        'Ajukan Pengambilan',
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontWeight: FontWeight.w300,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }

Widget jumBulan() {
    return Center(
      child: Container(
        width: 350,
        margin: const EdgeInsets.only(left: 30, right: 30, top: 330),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: const Border(
            top: BorderSide(color: Color.fromARGB(213, 237, 237, 237), width: 1),
            bottom: BorderSide(color: Color.fromARGB(213, 237, 237, 237), width: 1),
          ),
        ),
        child: Card(
          shadowColor: Colors.teal,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          elevation: 0.0,
          child: Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10, right: 25, left: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Bulan ini',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      'Rp. 1.000.000',
                      style: TextStyle(
                        color: Color.fromARGB(255, 86, 86, 86),
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    const SizedBox(height: 20,width: 35,),
                    DropdownButton<String>(
                      value: selectedMonth,
                      items: <String>[
                        'Januari',
                        'Februari',
                        'Maret',
                        'April',
                        'Mei',
                        'Juni',
                        'Juli',
                        'Agustus',
                        'September',
                        'Oktober',
                        'November',
                        'Desember'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.teal,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: onMonthChanged,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget aktivitasTabungan() {
    final List<Activity> activities = [
      Activity(amount: '+ Rp. 100.000', date: '15 Maret 2024'),
      Activity(amount: '+ Rp. 90.000', date: '14 Maret 2024'),
      Activity(amount: '+ Rp. 150.000', date: '13 Maret 2024'),
      Activity(amount: '+ Rp. 10.000', date: '12 Maret 2024'),
      Activity(amount: '+ Rp. 15.000', date: '12 Maret 2024'),
      Activity(amount: '+ Rp. 50.000', date: '11 Maret 2024'),
      Activity(amount: '+ Rp. 50.000', date: '10 Maret 2024'),
      Activity(amount: '+ Rp. 40.000', date: '9 Maret 2024'),
      Activity(amount: '+ Rp. 100.000', date: '8 Maret 2024'),
      Activity(amount: '+ Rp. 100.000', date: '8 Maret 2024'),
      Activity(amount: '+ Rp. 100.000', date: '8 Maret 2024'),
      Activity(amount: '+ Rp. 100.000', date: '8 Maret 2024'),
      Activity(amount: '+ Rp. 100.000', date: '8 Maret 2024'),
      Activity(amount: '+ Rp. 100.000', date: '8 Maret 2024'),
      Activity(amount: '+ Rp. 100.000', date: '8 Maret 2024'),
    ];

    return Container(
        margin: const EdgeInsets.only(top: 20, bottom: 90),
        width: 350,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Aktivitas terbaru',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w300,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 15),
            Column(
              children: activities.asMap().entries.map((entry) {
                int index = entry.key;
                Activity activity = entry.value;
                return Column(
                  children: [
                    ActivityItem(activity: activity),
                    if (index < activities.length - 1)
                      const Divider(
                        color: Color.fromARGB(213, 237, 237, 237),
                      )
                  ],
                );
              }).toList(),
            ),
          ],
        ));
  }
}

class Activity {
  final String amount;
  final String date;

  Activity({required this.amount, required this.date});
}

class ActivityItem extends StatelessWidget {
  final Activity activity;

  const ActivityItem({super.key, required this.activity});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            activity.amount,
            style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w300,
                color: Colors.black54),
          ),
          Text(
            activity.date,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.teal,
            ),
          ),
        ],
      ),
    );
  }
}
