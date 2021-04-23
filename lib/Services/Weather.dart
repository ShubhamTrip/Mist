
import 'package:mist/Services/GeoLocation.dart';
import 'package:mist/Services/Networking.dart';
class Weather{
  double lati;
  double longi;

  Future<dynamic> getWeatherData() async{
    GetLocation getlocation = GetLocation();

    lati = getlocation.lat;
    longi = getlocation.long;

    String url = "http://api.openweathermap.org/data/2.5/weather?lat=${lati}&lon=${longi}&appid=c42b2b792dad4b03c64d2298518ca661&units=metric";

    NetworkHelper networkHelper = NetworkHelper(url);

    var weatherData = await networkHelper.getData();

    return weatherData;

  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}