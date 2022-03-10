import 'package:budget_tracker_ui/pages/anmition/fadeanimation.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum Gender {
  Email,
  password,
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color enabled = const Color(0xFF827F8A);
  Color enabledtxt = Colors.white;
  Color deaible = Colors.grey;
  Color backgroundColor = Color.fromARGB(255, 0, 0, 0);
  bool ispasswordev = true;
  Gender selected;

  @override
  Widget build(BuildContext context) {
    var we = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        body: SingleChildScrollView(
          child: Expanded(
            flex: 1,
            child: SizedBox(
              width: we,
              height: he,
              child: Column(
                children: <Widget>[
                  FadeAnimation(
                    delay: 0.8,
                    child: CachedNetworkImage(
                      imageUrl:
                          "https://media-exp1.licdn.com/dms/image/C4D22AQG4S08wP3tUTw/feedshare-shrink_800/0/1623069208078?e=1648684800&v=beta&t=hHTmPnIDbgA34YiPqPoU4gwJ4OnyUbcSsaGe9xTqDjs",
                      width: we * 0.9,
                      height: he * 0.4,
                    ),
                  ),
                  SizedBox(
                    height: he * 0.01,
                  ),
                  FadeAnimation(
                    delay: 1,
                    child: Container(
                      margin: const EdgeInsets.only(right: 150.0),
                      child: Text(
                        "",
                        style: GoogleFonts.heebo(
                            color: Colors.grey, letterSpacing: 0.5),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: he * 0.04,
                  ),
                  FadeAnimation(
                    delay: 1,
                    child: Container(
                      width: we * 0.9,
                      height: he * 0.071,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: selected == Gender.Email
                            ? enabled
                            : backgroundColor,
                      ),
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        onTap: () {
                          setState(() {
                            selected = Gender.Email;
                          });
                        },
                        decoration: InputDecoration(
                          enabledBorder: InputBorder.none,
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.email_outlined,
                            color:
                                selected == Gender.Email ? enabledtxt : deaible,
                          ),
                          hintText: 'Email',
                          hintStyle: TextStyle(
                            color:
                                selected == Gender.Email ? enabledtxt : deaible,
                          ),
                        ),
                        style: TextStyle(
                            color:
                                selected == Gender.Email ? enabledtxt : deaible,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: he * 0.02,
                  ),
                  FadeAnimation(
                    delay: 1,
                    child: Container(
                      width: we * 0.9,
                      height: he * 0.071,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: selected == Gender.password
                              ? enabled
                              : backgroundColor),
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        onTap: () {
                          setState(() {
                            selected = Gender.password;
                          });
                        },
                        decoration: InputDecoration(
                            enabledBorder: InputBorder.none,
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.lock_open_outlined,
                              color: selected == Gender.password
                                  ? enabledtxt
                                  : deaible,
                            ),
                            suffixIcon: IconButton(
                              icon: ispasswordev
                                  ? Icon(
                                      Icons.visibility_off,
                                      color: selected == Gender.password
                                          ? enabledtxt
                                          : deaible,
                                    )
                                  : Icon(
                                      Icons.visibility,
                                      color: selected == Gender.password
                                          ? enabledtxt
                                          : deaible,
                                    ),
                              onPressed: () =>
                                  setState(() => ispasswordev = !ispasswordev),
                            ),
                            hintText: 'Sifre',
                            hintStyle: TextStyle(
                                color: selected == Gender.password
                                    ? enabledtxt
                                    : deaible)),
                        obscureText: ispasswordev,
                        style: TextStyle(
                            color: selected == Gender.password
                                ? enabledtxt
                                : deaible,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: he * 0.02,
                  ),
                  FadeAnimation(
                    delay: 1,
                    child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "Giris Yap",
                          style: GoogleFonts.heebo(
                            color: Colors.black,
                            letterSpacing: 0.5,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: TextButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 255, 76, 5),
                            padding: const EdgeInsets.symmetric(
                                vertical: 15.0, horizontal: 80),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)))),
                  ),
                  SizedBox(
                    height: he * 0.01,
                  ),
                  FadeAnimation(
                    delay: 1,
                    child: Text("sifremi unuttum",
                        style: GoogleFonts.heebo(
                          color:
                              Color.fromARGB(255, 245, 79, 13).withOpacity(0.9),
                          letterSpacing: 0.5,
                        )),
                  ),
                  SizedBox(height: he * 0.12),
                  FadeAnimation(
                    delay: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("",
                            style: GoogleFonts.heebo(
                              color: Colors.grey,
                              letterSpacing: 0.5,
                            )),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
