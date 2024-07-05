import 'package:flutter/material.dart';
import "package:weather_app/models/weather_model.dart";

class WeatherCard extends StatelessWidget {

  final Weather? weatherData;
  final String? errorMsg;
  const WeatherCard({super.key,this.weatherData,this.errorMsg});

  @override
  Widget build(BuildContext context) {
    Widget weatherDetails;
    if(errorMsg!.isNotEmpty){
      weatherDetails=Text(errorMsg!);
    }
    else{
      weatherDetails=Column(
        children: [
          Text(weatherData!.cityName),
          Text("${weatherData!.temperature}"),
        ],
      );
    }
    return Card( 
      // color: Colors.black,
      shape: RoundedRectangleBorder( 
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(color: Colors.grey, width: 1),
      ),
      // child: Container( 
      //   height: 50,
      //   child: Column(children: [ 
      //     Text("${weatherData!.temperature}")
      //   ],),
      // ),
      child: Container( 
        height: 50,
        child: Column(children: [ 
          weatherDetails
        ],),
      ),
    );
  }
}