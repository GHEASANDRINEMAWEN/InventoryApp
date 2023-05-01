import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../widgets/default_scaffold.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  late DateTime _selectedDate;

  get key2 => null;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Calendar'),
        ),
        body: Column(
          children: [
            TableCalendar(
              firstDay: DateTime.utc(2010, 10, 20),
              lastDay: DateTime.utc(2040, 10, 20),
              focusedDay: _selectedDate,
              selectedDayPredicate: (date) => isSameDay(date, _selectedDate),
              onDaySelected: (date, events) {
                setState(() {
                  _selectedDate = date;
                });
              },
            ),
            Expanded(
              child: TableWidget(selectedDate: _selectedDate, key: key2),
            ),
          ],
        ),
      ),
    );
  }
}

class TableWidget extends StatelessWidget {
  final DateTime selectedDate;

  const TableWidget({required Key key, required this.selectedDate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          height: double.infinity,
          child: DataTable(
            columns: const [
              DataColumn(
                label: Text('Product name'),
              ),
              DataColumn(
                label: Text('Type of transaction'),
              ),
              DataColumn(
                label: Text('Quantity'),
              ),
              DataColumn(
                label: Text('Total Price'),
              ),
            ],
            rows: const [
              DataRow(cells: [
                DataCell(Text('coco')),
                DataCell(Text('sold')),
                DataCell(Text('100')),
                DataCell(Text('2000')),
              ]),
              DataRow(cells: [
                DataCell(Text('banana')),
                DataCell(Text('bought')),
                DataCell(Text('30')),
                DataCell(Text('400')),
              ]),
              DataRow(cells: [
                DataCell(Text('onion')),
                DataCell(Text('sold')),
                DataCell(Text('70')),
                DataCell(Text('700')),
              ]),
            ],
          )),
    );
  }
}



// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'TableCalendar(Coding Ninjas)',
//       theme: ThemeData(
//         primarySwatch: Colors.orange,
//       ),
//       home: new Column(
//       children: <Widget>[
//         TableBasicsExample(),
//         ViewStock(),
//       ],
//     ),
//     );
//   }
// }

// class TableBasicsExample extends StatefulWidget {
//   @override
//   _TableBasicsExampleState createState() => _TableBasicsExampleState();
// }

// class _TableBasicsExampleState extends State {
//   CalendarFormat _calendarFormat = CalendarFormat.month;
//   DateTime _focusedDay = DateTime.now();
//   DateTime? _selectedDay;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('TableCalendar(Calendar 2023)'),
//       ),
//       body: TableCalendar(
//         firstDay: DateTime.utc(2010, 10, 20),
//         lastDay: DateTime.utc(2040, 10, 20),
//         focusedDay: _focusedDay,
//         calendarFormat: _calendarFormat,
//         selectedDayPredicate: (day) {
//           // Use `selectedDayPredicate` to determine which day is currently selected.
//           // If this returns true, then `day` will be marked as selected.
//           // Using `isSameDay` is recommended to disregard
//           // the time-part of compared DateTime objects.
//           return isSameDay(_selectedDay, day);
//         },
//         onDaySelected: (selectedDay, focusedDay) {
//           if (!isSameDay(_selectedDay, selectedDay)) {
//             // Call `setState()` when updating the selected day
//             setState(() {
//               _selectedDay = selectedDay;
//               _focusedDay = focusedDay;
//             });
//           }
//         },
//         onFormatChanged: (format) {
//           if (_calendarFormat != format) {
//             // Call `setState()` when updating calendar format
//             setState(() {
//               _calendarFormat = format;
//             });
//           }
//         },
//         onPageChanged: (focusedDay) {
//           // No need to call `setState()` here
//           _focusedDay = focusedDay;
//         },
//       ),
     
//     );
    
//   }
  
  
// }


// class ViewStock extends StatefulWidget {
//   const ViewStock({super.key});

//   @override
//   State<StatefulWidget> createState() {
//     return _ViewStockState();
//   }
// }

// class _ViewStockState extends State<ViewStock> {
//   @override
//   Widget build(BuildContext context) {
//     return DefaultScaffold(
//       floatingButton: FloatingActionButton(
//         child: const Icon(Icons.add),
//         onPressed: () {},
//       ),
//       title: "View Stock",
//       body: Container(
//         clipBehavior: Clip.hardEdge,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           boxShadow: [
//             BoxShadow(
//               color: Colors.blue.withOpacity(0.3),
//               spreadRadius: 4,
//               blurRadius: 10,
//               offset: const Offset(0, 3),
//             ),
//           ],
//           borderRadius: const BorderRadius.all(Radius.circular(10)),
//         ),
//         child: DataTable(
//           headingTextStyle: const TextStyle(
//             color: Colors.white,
//             fontSize: 24,
//             fontWeight: FontWeight.w300,
//           ),
//           headingRowHeight: 80,
//           dataRowHeight: 80,
//           headingRowColor: MaterialStateColor.resolveWith(
//             (states) {
//               return Colors.blue.shade400;
//             },
//           ),
//           columns: const [
//             DataColumn(
//               label: Text('Product name'),
//             ),
//             DataColumn(
//               label: Text('Quantity'),
//             ),
//             DataColumn(
//               label: Text('Price'),
//             ),
//           ],
//           rows: const [
//             DataRow(cells: [
//               DataCell(Text('coco')),
//               DataCell(Text('100')),
//               DataCell(Text('2000')),
//             ]),
//             DataRow(cells: [
//               DataCell(Text('banana')),
//               DataCell(Text('30')),
//               DataCell(Text('400')),
//             ]),
//             DataRow(cells: [
//               DataCell(Text('onion')),
//               DataCell(Text('70')),
//               DataCell(Text('700')),
//             ]),
//             DataRow(cells: [
//               DataCell(Text('Rice')),
//               DataCell(Text('20')),
//               DataCell(Text('1000')),
//             ]),
//             DataRow(cells: [
//               DataCell(Text('beans')),
//               DataCell(Text('30')),
//               DataCell(Text('100')),
//             ]),
//             DataRow(cells: [
//               DataCell(Text('potato')),
//               DataCell(Text('50')),
//               DataCell(Text('500')),
//             ]),
//           ],
//         ),
//       ),
//     );
//   }
// }
