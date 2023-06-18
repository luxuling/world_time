import 'package:flutter/material.dart';
import 'package:world_real_time/pages/home.dart';
import 'package:world_real_time/pages/loading.dart';
import 'package:world_real_time/pages/pick_country.dart';

void main() {
  runApp(MaterialApp(
    title: "World Real Time",
    initialRoute: "/",
    routes: {
      "/": (context) => const Loading(),
      "/home": (context) => const Home(),
      "/pick_country": (context) => const CountryPick()
    },
  ));
}
