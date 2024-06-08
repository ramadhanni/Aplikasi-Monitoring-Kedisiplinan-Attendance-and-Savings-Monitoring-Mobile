import 'package:flutter/material.dart';
// import 'package:table_calendar/table_calendar.dart';

class BusinessPage extends StatefulWidget {
  @override
  _BusinessPage createState() => _BusinessPage();
}

class _BusinessPage extends State<BusinessPage> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.teal,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: AssetImage(
                  'image/Batik.png'), // Update with your profile image asset
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            color: Colors.teal,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                        onPressed: () {
                          setState(() {
                            selectedDate =
                                selectedDate.subtract(Duration(days: 1));
                          });
                        },
                      ),
                      Text(
                        '${selectedDate.day} ${_monthName(selectedDate.month)}',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      IconButton(
                        icon:
                            Icon(Icons.arrow_forward_ios, color: Colors.white),
                        onPressed: () {
                          setState(() {
                            selectedDate = selectedDate.add(Duration(days: 1));
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(7, (index) {
                    DateTime date = selectedDate.subtract(
                        Duration(days: selectedDate.weekday - 1 - index));
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedDate = date;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: date.day == selectedDate.day
                                ? Colors.white
                                : Colors.teal.shade700,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              Text(
                                '${date.day}',
                                style: TextStyle(
                                  color: date.day == selectedDate.day
                                      ? Colors.teal
                                      : Colors.white,
                                ),
                              ),
                              Text(
                                _weekdayName(date.weekday),
                                style: TextStyle(
                                  color: date.day == selectedDate.day
                                      ? Colors.teal
                                      : Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16.0),
              children: [
                _buildAttendanceCard('25 Selasa', '06:45', 'Ongoing', true),
                _buildAttendanceCard('24 Senin', '06:45', '12:01', false),
                // '25 Selasa', '06:45', 'Ongoing', 'Detail', 'Form Izin'),
                // _buildAttendanceCard('24 Senin', '06:45', '12:01'),
                // _buildAttendanceCard('23 Minggu', '06:45', '06:45'),
                // _buildAttendanceCard('22 Sabtu', '06:45', '06:45'),
                // _buildAttendanceCard('21 Jumat', '06:45', '06:45'),
              ],
            ),
          ),
        ],
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.list_alt),
      //       label: 'Attendance',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.person),
      //       label: 'Profile',
      //     ),
      //   ],
      // ),
    );
  }

  Widget _buildAttendanceCard(
      String day, String checkIn, String checkOut, bool isOngoing) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(day,
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'Detail',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(width: 8),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    isOngoing ? 'Form Izin' : 'Bukti Izin',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text('Check-in: ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(checkIn),
                  ],
                ),
                Row(
                  children: [
                    Text('Check-out: ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(checkOut),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _monthName(int month) {
    switch (month) {
      case 1:
        return 'Januari';
      case 2:
        return 'Februari';
      case 3:
        return 'Maret';
      case 4:
        return 'April';
      case 5:
        return 'Mei';
      case 6:
        return 'Juni';
      case 7:
        return 'Juli';
      case 8:
        return 'Agustus';
      case 9:
        return 'September';
      case 10:
        return 'Oktober';
      case 11:
        return 'November';
      case 12:
        return 'Desember';
      default:
        return '';
    }
  }

  String _weekdayName(int weekday) {
    switch (weekday) {
      case 1:
        return 'Senin';
      case 2:
        return 'Selasa';
      case 3:
        return 'Rabu';
      case 4:
        return 'Kamis';
      case 5:
        return 'Jumat';
      case 6:
        return 'Sabtu';
      case 7:
        return 'Minggu';
      default:
        return '';
    }
  }
}
