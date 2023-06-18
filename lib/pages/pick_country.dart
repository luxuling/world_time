import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:world_real_time/services/time_service.dart';

class CountryPick extends StatefulWidget {
  const CountryPick({super.key});

  @override
  State<CountryPick> createState() => _CountryPickState();
}

class _CountryPickState extends State<CountryPick> {
  List<TimeService> locations = [
    TimeService(location: 'Jakarta', img: 'indonesia.png'),
    TimeService(location: 'Seoul', img: 'south_korea.png'),
    TimeService(location: 'New York', img: 'usa.png'),
    TimeService(location: 'Chicago', img: 'usa.png'),
    TimeService(location: 'Nairobi', img: 'kenya.png'),
    TimeService(location: 'Athens', img: 'greece.png'),
    TimeService(location: 'London', img: 'uk.png'),
  ];

  void updateTime(index) async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: SpinKitPouringHourGlassRefined(
              size: 50,
              color: Colors.white,
            ),
          );
        });

    TimeService instance = locations[index];
    await instance.getDate();
    // ignore: use_build_context_synchronously
    Navigator.of(context).pop();
    // ignore: use_build_context_synchronously
    Navigator.pop(context, {
      "time": instance.time,
      "location": instance.location,
      "isDayTime": instance.isDay
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          "Country Time Pick",
          style: TextStyle(fontFamily: "Poppins"),
        ),
        elevation: 0,
        backgroundColor: Colors.grey[900],
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 3),
              child: Card(
                  child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].img}'),
                ),
              )),
            );
          }),
    );
  }
}
