import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map<String, dynamic> data = {};
  late String bgApp;

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    bgApp = data["isDayTime"] == true ? "day.jpg" : "night.jpg";
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[900],
        body: Stack(children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/$bgApp"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          BackdropFilter(
            filter: ui.ImageFilter.blur(sigmaX: 2, sigmaY: 2),
            child: Container(
              decoration: BoxDecoration(color: Colors.white.withOpacity(0.1)),
              child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton.icon(
                          style: ButtonStyle(
                            iconColor: MaterialStateProperty.all(Colors.white),
                          ),
                          onPressed: () async {
                            dynamic result = await Navigator.pushNamed(
                                context, '/pick_country');
                            if (result != null) {
                              setState(() {
                                data = {
                                  "time": result['time'],
                                  "location": result['location'],
                                  "isDayTime": result['isDayTime']
                                };
                              });
                            }
                          },
                          icon: const Icon(
                            Icons.location_on,
                            size: 35,
                          ),
                          label: const Text(
                            "Pick locations",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: "Poppins"),
                          )),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "${data['time']}",
                        style: const TextStyle(
                            fontSize: 55,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontFamily: "Poppins"),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "${data['location']}",
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontFamily: "Poppins"),
                      ),
                    ]),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
