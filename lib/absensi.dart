import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// import 'package:table_calendar/table_calendar.dart';

class BusinessPage extends StatefulWidget {
  @override
  _BusinessPage createState() => _BusinessPage();
}

class _BusinessPage extends State<BusinessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        actions: [
          CircleAvatar(
            backgroundImage: NetworkImage('https://via.placeholder.com/150'),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: Column(
        children: [
          MonthSelector(),
          AttendanceList(),
        ],
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.assignment),
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
}

class MonthSelector extends StatefulWidget {
  @override
  _MonthSelectorState createState() => _MonthSelectorState();
}

class _MonthSelectorState extends State<MonthSelector> {
  DateTime selectedMonth = DateTime.now();
  int selectedDateIndex = DateTime.now().day - 1;

  List<DateTime> getMonthDates(DateTime month) {
    int daysInMonth = DateTime(month.year, month.month + 1, 0).day;
    return List.generate(
        daysInMonth, (index) => DateTime(month.year, month.month, index + 1));
  }

  @override
  Widget build(BuildContext context) {
    List<DateTime> dates = getMonthDates(selectedMonth);
    return Container(
      color: Colors.teal,
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    setState(() {
                      selectedMonth =
                          DateTime(selectedMonth.year, selectedMonth.month - 1);
                      selectedDateIndex = 0;
                    });
                  },
                ),
                Text(
                  DateFormat.yMMMM().format(selectedMonth),
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                IconButton(
                  icon: Icon(Icons.arrow_forward, color: Colors.white),
                  onPressed: () {
                    setState(() {
                      selectedMonth =
                          DateTime(selectedMonth.year, selectedMonth.month + 1);
                      selectedDateIndex = 0;
                    });
                  },
                ),
              ],
            ),
          ),
          Container(
            height: 80,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: dates.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedDateIndex = index;
                    });
                  },
                  child: DateItem(
                    date: dates[index].day.toString(),
                    day: DateFormat.E().format(dates[index]),
                    isSelected: selectedDateIndex == index,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class DateItem extends StatelessWidget {
  final String date;
  final String day;
  final bool isSelected;

  DateItem({required this.date, required this.day, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      margin: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? Colors.white : Colors.teal,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            date,
            style: TextStyle(
              color: isSelected ? Colors.teal : Colors.white,
              fontSize: 16,
            ),
          ),
          Text(
            day,
            style: TextStyle(
              color: isSelected ? Colors.teal : Colors.white,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

class AttendanceList extends StatelessWidget {
  final List<Map<String, String>> attendanceData = [
    {'date': '25 Selasa', 'checkin': '06:45', 'checkout': 'Ongoing'},
    {'date': '24 Senin', 'checkin': '06:45', 'checkout': '12:01'},
    {'date': '23 Minggu', 'checkin': '06:45', 'checkout': '06:45'},
    {'date': '22 Sabtu', 'checkin': '06:45', 'checkout': '06:45'},
    {'date': '21 Jumat', 'checkin': '06:45', 'checkout': '06:45'},
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: attendanceData.length,
        itemBuilder: (context, index) {
          return AttendanceItem(
            date: attendanceData[index]['date']!,
            checkin: attendanceData[index]['checkin']!,
            checkout: attendanceData[index]['checkout']!,
          );
        },
      ),
    );
  }
}

class AttendanceItem extends StatelessWidget {
  final String date;
  final String checkin;
  final String checkout;

  AttendanceItem({
    required this.date,
    required this.checkin,
    required this.checkout,
  });

  @override
  Widget build(BuildContext context) {
    List<String> parts = date.split(' ');
    String tanggal = parts[0];
    String hari = parts[1];

    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              width: 80,
              decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.all(Radius.circular(14))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    tanggal,
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    hari,
                    style: TextStyle(fontWeight: FontWeight.w400),
                  )
                ],
              ),
            ),
            Row(
              children: [
                Container(
                  height: 60,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomLeft: Radius.circular(12)
                    ),
                    color: Colors.white
                  ),
                  child: Column(
                    children: [
                      Text('$checkin'),
                      Text('Check-in',style: TextStyle(fontSize: 8),),
                    ],
                  ),
                ),
                Container(
                  height: 60,
                  padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(12),
                        bottomRight: Radius.circular(12)
                      ),
                      color: Colors.teal
                    ),
                  child:Center(
                    child: 
                    Text('Detail',style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold)),
                  )
                ),
                SizedBox(width: 10,),
                Container(
                  height: 60,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomLeft: Radius.circular(12)
                    ),
                    color: Colors.white
                  ),
                  child: Column(
                    children: [
                      Text('$checkout'),
                      Text('Check-out',style: TextStyle(fontSize: 8),),
                    ],
                  ),
                ),
                Container(
                  height: 60,
                  padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(12),
                        bottomRight: Radius.circular(12)
                      ),
                      color: Colors.teal
                    ),
                  child:Center(
                    child: 
                    Text('Detail',style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold)),
                  )
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(10),
              width: 50,
              height: 60,
              decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center, 
                  crossAxisAlignment: CrossAxisAlignment.center, 
                children :[ 
                  Text(
                    "Bukti Ijin",
                    style: TextStyle(fontSize: 8, fontWeight: FontWeight.w500),
                  )
                ]
              ),
            ),
            
            // Column(
            //   children: [
            //     Text('Check-in: $checkin'),
            //     Text('Check-out: $checkout'),
            //   ],
            // ),
            // ElevatedButton(
            //   onPressed: () => _popupDetail(context),
            //   child: Text('Detail'),
            // ),
          ],
        ),
      ),
    );
  }

  void _popupDetail(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      //aksi
                    },
                    child: Text('Check-In'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      //aksi
                    },
                    child: Text('Check-Out'),
                  ),
                ],
              ),
              Row(
                children: [
                  Text('Check-in: ',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('06:45'),
                ],
              ),
              SizedBox(height: 16),
              Container(
                width: double.infinity,
                height: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage('image/Batik.png'),
                        fit: BoxFit.cover)),
              )
            ],
          ),
        );
      },
    );
  }
}
