import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTab extends StatelessWidget {
  CustomTab({@required this.title});

  final String title;
  
  @override
  Widget build(BuildContext context) {
    return Tab(
        child: Row(
          children: [
          Text('#',style: TextStyle(color: Color.fromARGB(255, 191, 0, 220),fontSize: 20,fontWeight: FontWeight.bold),),
            Text(this.title,
                style: GoogleFonts.getFont('Allerta Stencil', fontSize: 18,fontWeight: FontWeight.w100)),
          ],
        ));
  }
}
