import 'package:bbl/screens/user/user_sign.dart';
import 'package:flutter/material.dart';
import 'package:bbl/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class Select extends StatelessWidget {
  const Select({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 300),
          child: Center(
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    runApp(MaterialApp(
                      home: UserSign(),
                      debugShowCheckedModeBanner: false,
                      theme: ThemeData(
                        primarySwatch: primSwat,
                      ),
                    ));
                  },
                  style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(),
                    padding: EdgeInsets.symmetric(horizontal: 60, vertical: 20)
                  ),
                  child: Text("User",
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w700, color: Colors.white, fontSize: 25)),
                ),
                SizedBox(height: 20,),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(),
                    padding: EdgeInsets.symmetric(horizontal: 60, vertical: 20)
                  ),
                  child: Text("Driver",
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w700, color: Colors.white, fontSize: 25)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
