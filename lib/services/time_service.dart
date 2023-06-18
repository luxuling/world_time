import 'package:http/http.dart';
import 'dart:convert';

import 'package:intl/intl.dart';

class TimeService {
  late String location;
  late String time;
  late String img;
  late bool isDay;

  TimeService({required this.location, required this.img});

  Future<void> getDate() async {
    try {
      var url =
          Uri.parse('https://api.api-ninjas.com/v1/worldtime?city=$location');
      var headers = <String, String>{
        'X-Api-Key': '/4oYErZu//390VOncTbvEw==WnhqqvolzP6n62LB'
      };

      Response response = await get(url, headers: headers);
      Map data = jsonDecode(response.body);
      String datetime = data["datetime"];

      DateTime now = DateTime.parse(datetime);

      String formated = DateFormat.jm().format(now);
      time = formated;
      isDay = now.hour > 6 && now.hour < 20 ? true : false;
    } catch (e) {
      time = "Error occurred";
    }
  }
}
