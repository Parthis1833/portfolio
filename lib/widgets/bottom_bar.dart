import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'custom_icon_button.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomBar extends StatelessWidget {
  BottomBar({Key? key}) : super(key: key);

  Color pinterest = const Color.fromARGB(255, 205, 30, 36);
  Color instagram = const Color(0xFFE1306C);
  Color facebook = const Color.fromARGB(255, 59, 88, 152);
  Color linkedin = const Color.fromARGB(255, 36, 136, 190);
  Color twitter = const Color.fromARGB(255, 85, 172, 238);
  Color discord = const Color.fromARGB(255, 114, 137, 218);
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Align(
            alignment: Alignment.center,
            child: Container(
              height: 2,
              width: screenWidth * 0.9,
              color: Colors.white,
            )),
        Container(
          height: screenHeight * 0.20,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                        "assets/Vector 2.svg",
                        width: 14,
                        height: 17,
                        ),
                        Text("parthisj03@gmail.com",
                            style: GoogleFonts.getFont(
                              'Allerta Stencil',
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: const Color.fromRGBO(123, 135, 156, 1),
                            ))
                      ],
                    ),
                    Text(
                        "Web designeer and front-end developer based",
                        style: GoogleFonts.getFont(
                          'Allerta Stencil',
                          fontWeight: FontWeight.w400,
                        )
                    )
                  ],
                ),

                const Text(
                  ' © Copyright  2023. Made by Parthish',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Barlow',
                    fontSize: 12.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Media',
                        style: GoogleFonts.getFont(
                          'Allerta Stencil',
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Row(
                        children: [
                          CustomIconButton(
                            iconData: FontAwesomeIcons.facebook,
                            url: 'https://www.facebook.com/joshi.parthis.73?mibextid=ZbWKwL',
                            color: facebook,
                          ),
                          InkWell(
                            onTap: () {
                              String url =
                                  'https://www.instagram.com/joshi_parthis';
                              launch(url);
                            },
                            child: ShaderMask(
                              shaderCallback: (Rect bounds) {
                                return const LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Color(0xff405DE6),
                                    Color(0xff5851DB),
                                    Color(0xff833AB4),
                                    Color(0xffC13584),
                                    Color(0xffFD1D1D),
                                    Color(0xffF56040),
                                    Color(0xffFFC312),
                                    Color(0xffFFD55A),
                                  ],
                                ).createShader(bounds);
                              },
                              child: const Icon(
                                FontAwesomeIcons.instagram,
                                size: 43,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          CustomIconButton(
                            iconData: FontAwesomeIcons.pinterest,
                            url: 'https://in.pinterest.com/parthisj03/',
                            color: pinterest,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          CustomIconButton(
                            iconData: FontAwesomeIcons.linkedin,
                            url: 'https://in.pinterest.com/parthisj03/',
                            color: linkedin,
                          ),
                          CustomIconButton(
                            iconData: FontAwesomeIcons.twitter,
                            url: 'https://in.pinterest.com/parthisj03/',
                            color: twitter,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          CustomIconButton(
                            iconData: FontAwesomeIcons.discord,
                            url: 'https://in.pinterest.com/parthisj03/',
                            color: discord,
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
