import 'package:geolocator/geolocator.dart';

class GetLocation{
  double lat;
  double long;

  Future<void> getCurrentLocation() async
  {  print("I am here");
     try{
          Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.medium);

          lat=position.latitude;
          long = position.longitude;

     }
     catch(e){
       print(e);
       print("I am having an error");
     }
  }
}

