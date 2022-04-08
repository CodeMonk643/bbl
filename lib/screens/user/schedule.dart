import 'package:bbl/colors.dart';
import 'package:bbl/screens/user/success.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:intl/intl.dart';

class Schedule extends StatefulWidget {
  const Schedule({Key? key}) : super(key: key);

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  DateTime date = DateTime.now();
  TextEditingController _textEditingController = TextEditingController();
  // TimeOfDay _time = TimeOfDay(hour: 7, minute: 15);
  double value = 10;
  int selectedValue = 0;

  Future<Null> selectDate(BuildContext context) async {
    DateTime? _datepicker = await showDatePicker(
        context: context,
        initialDate: date,
        confirmText: "SELECT",
        firstDate: DateTime.now().subtract(Duration(days: 0)),
        lastDate: DateTime.now().add(Duration(days: 2)));

    if (_datepicker != null && _datepicker != date) {
      setState(() {
        date = _datepicker;
        _textEditingController
        ..text = DateFormat("dd/MMM/yyyy").format(date)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: _textEditingController.text.length,
            affinity: TextAffinity.upstream));
      });
    }
  }

  // void selectTime(BuildContext context) async {
  //   final TimeOfDay? newTime = await showTimePicker(
  //     context: context,
  //     initialTime: _time,
  //   );
  //   if (newTime != null) {
  //     setState(() {
  //       _time = newTime;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: SafeArea(
              child: Column(
        children: [
          SizedBox(height: 80),
          Center(
            child: Text(
              "Schedule your pickup",
              style: GoogleFonts.montserrat(fontSize: 30),
            ),
          ),
          SizedBox(height: 15),
          Center(
            child: Container(
              height: 3,
              width: 140,
              color: Colors.greenAccent[400],
            ),
          ),
          SizedBox(height: 40),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                // DatePicker Text Field
                TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "DD/MM/YYYY",
                      labelText: "Enter date",
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              selectDate(context);
                            });
                          },
                          icon: Icon(Icons.calendar_month_outlined))),
                ),
                SizedBox(
                  height: 20,
                ),
                // Time Picker Text Field
                // TextField(
                //   decoration: InputDecoration(
                //       border: OutlineInputBorder(),
                //       hintText: "HH:MM",
                //       labelText: "Enter time",
                //       suffixIcon: IconButton(
                //           onPressed: () {
                //             setState(() {
                //               selectTime(context);
                //             });
                //           },
                //           icon: Icon(Icons.timelapse))),
                // ),
                Text("Select time slot",
                    style: GoogleFonts.montserrat(fontSize: 15)),
                RadioListTile(
                    value: 0,
                    groupValue: selectedValue,
                    title: Text("Morning",
                        style: GoogleFonts.montserrat(fontSize: 15)),
                    subtitle: Text("9:00AM - 12:00PM",
                        style: GoogleFonts.montserrat()),
                    onChanged: (_value) {
                      setState(() {
                        selectedValue = _value as int;
                        print("Morning");
                      });
                    }),
                RadioListTile(
                    value: 1,
                    groupValue: selectedValue,
                    title: Text("Afternoon",
                        style: GoogleFonts.montserrat(fontSize: 15)),
                    subtitle: Text("1:00AM - 4:00PM",
                        style: GoogleFonts.montserrat()),
                    onChanged: (_value) {
                      setState(() {
                        selectedValue = _value as int;
                        print("Afternoon");
                      });
                    }),
                RadioListTile(
                    value: 2,
                    groupValue: selectedValue,
                    title: Text("Evening",
                        style: GoogleFonts.montserrat(fontSize: 15)),
                    subtitle: Text("5:00AM - 7:00PM",
                        style: GoogleFonts.montserrat()),
                    onChanged: (_value) {
                      setState(() {
                        selectedValue = _value as int;
                        print("Evening");
                      });
                    }),
                SizedBox(height: 40),
                Text(
                  "Select the amount of waste(in kg)",
                  style: GoogleFonts.montserrat(fontSize: 15),
                ),
                SfSlider(
                    value: value,
                    min: 0.0,
                    max: 20.0,
                    showLabels: true,
                    enableTooltip: true,
                    tooltipShape: SfPaddleTooltipShape(),
                    onChanged: (newValue) {
                      setState(() {
                        value = newValue;
                      });
                    }),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Select type of waste",
                  style: GoogleFonts.montserrat(fontSize: 15),
                ),
                SizedBox(height: 20),
                RadioListTile(
                    value: 0,
                    groupValue: selectedValue,
                    title: Text(
                      "Organic Waste",
                      style: GoogleFonts.montserrat(fontSize: 15),
                    ),
                    subtitle: Text(
                        "Contains vegetable and fruit peels, kitchen waste",
                        style: GoogleFonts.montserrat()),
                    onChanged: (_value) {
                      setState(() {
                        selectedValue = _value as int;
                      });
                    }),
                RadioListTile(
                    value: 1,
                    groupValue: selectedValue,
                    title: Text(
                      "Recyclable Waste",
                      style: GoogleFonts.montserrat(fontSize: 15),
                    ),
                    subtitle:
                        Text("Contains paper, metal, glass", style: GoogleFonts.montserrat()),
                    onChanged: (_value) {
                      setState(() {
                        selectedValue = _value as int;
                      });
                    }),
                RadioListTile(
                    value: 2,
                    groupValue: selectedValue,
                    title: Text(
                      "Toxic Waste",
                      style: GoogleFonts.montserrat(fontSize: 15),
                    ),
                    subtitle: Text(
                        "Contains vaccines, medicines, paint, chemicals",
                        style: GoogleFonts.montserrat()),
                    onChanged: (_value) {
                      setState(() {
                        selectedValue = _value as int;
                      });
                    }),
                RadioListTile(
                    value: 3,
                    groupValue: selectedValue,
                    title: Text(
                      "Electronic Waste",
                      style: GoogleFonts.montserrat(fontSize: 15),
                    ),
                    subtitle: Text("Contains batteries, electronic devices",
                        style: GoogleFonts.montserrat()),
                    onChanged: (_value) {
                      setState(() {
                        selectedValue = _value as int;
                      });
                    }),
                SizedBox(height: 20),
                ElevatedButton(
                    onPressed: () {
                      runApp(MaterialApp(
                        home: Success(),
                        debugShowCheckedModeBanner: false,
                        theme: ThemeData(primarySwatch: primSwat),
                      ));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Schedule",
                          style: GoogleFonts.montserrat(
                              fontSize: 15, color: Colors.white)),
                    ))
              ],
            ),
          ),
        ],
      ))),
    );
  }
}
