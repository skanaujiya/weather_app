import 'package:get/get.dart';
import 'package:weather_app/api/dataservice.dart';
import 'package:weather_app/api/modelData.dart';

class Controller extends GetxController{
  DataService _currentData=DataService();
   WeatherResponse? _response;

   putCity(String city) async{
    _response=await _currentData.getWeather(city);
    update();
  }
  WeatherResponse? getWeather(){
     return _response;
  }
}