import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/api/modelData.dart';

class DataService{
  Future<WeatherResponse> getWeather(String city) async{
    //https://api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}

    final query={'q':city,'appid':'e08d96c0341da04394dd7a98653dd013', 'units':'metric'};
    Uri uri=Uri.https('api.openweathermap.org', '/data/2.5/weather',query);
    final response= await http.Client().get(uri);
    final json=jsonDecode(response.body);
    return WeatherResponse.fromJson(json);
  }
}