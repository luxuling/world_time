import 'package:flutter/material.dart';
import 'package:world_real_time/services/time_service.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setTime() async {
    TimeService now = TimeService(location: "Jakarta", img: 'indonesia.png');
    await now.getDate();
    // ignore: use_build_context_synchronously
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      "time": now.time,
      "location": now.location,
      "isDayTime": now.isDay
    });
  }

  @override
  void initState() {
    super.initState();
    setTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: const SafeArea(
          child: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: SpinKitPouringHourGlassRefined(
            size: 50,
            color: Colors.white,
          ),
        ),
      )),
    );
  }
}
