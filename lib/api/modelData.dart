/*
{
  "weather": [
    {
      "main": "Clear",
      "description": "clear sky",
      "icon": "01d"
    }
  ],
  "main": {
    "temp": 282.55,
    "feels_like": 281.86,
    "temp_min": 280.37,
    "temp_max": 284.26,
    "pressure": 1023,
    "humidity": 100
  },
  "wind": {
    "speed": 1.5,
  },
  "name": "Mountain View",
  }


 */
class WeatherResponse{
   var city;
   final dynamic temp;
   final dynamic humidity;
   final dynamic wind;
   var icon;
   var description;
  WeatherResponse({this.city,this.temp,this.humidity,this.wind,this.icon,this.description});
  factory WeatherResponse.fromJson( Map<String,dynamic> json){
    return WeatherResponse(
        city: json['name'],
        temp: json['main']['temp'],
        humidity: json['main']['humidity'],
        wind: json['wind']['speed'],
        icon: json['weather'][0]['icon'],
        description: json['weather'][0]['description']
    );
  }
}