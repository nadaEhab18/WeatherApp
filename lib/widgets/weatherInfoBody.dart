
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_using_bloc/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app_using_bloc/models/weather_model.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    WeatherModel weatherModel = BlocProvider.of<GetWeatherCubit>(context).weatherModel!;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
           getThemeColor(weatherModel.weatherCondition),
            getThemeColor(weatherModel.weatherCondition)[300]!,
            getThemeColor(weatherModel.weatherCondition)[50]!,

          ],
        )
      ),
      child: Padding(padding: const EdgeInsets.symmetric(horizontal: 16),
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
              Text(weatherModel.cityName,
             style: TextStyle(fontWeight: FontWeight.bold,

             fontSize: 32,
             ),
             ),
         Text('updated at ${weatherModel.date.hour}:${weatherModel.date.minute}',
          style: TextStyle(
            fontSize: 24,
          ),
        ),

              const SizedBox(height: 32,),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Image.network(
                 'https:${weatherModel.image!}',),
                  Text(weatherModel.temp.round().toString(),
                   style: TextStyle(
                     fontWeight: FontWeight.bold,
                     fontSize: 32,
                   ),
                 ),

                  Column(
                   children: [
                     Text('Maxtemp: ${weatherModel.maxTemp.round().toString()}',
                       style: TextStyle(
                         fontSize: 16,
                       ),
                     ),
                     Text('Mintemp: ${weatherModel.minTemp.round().toString()}',
                       style: TextStyle(
                         fontSize: 16,
                       ),),
                       ],
                 ),
               ],
             ),

              Text(weatherModel.weatherCondition,
               style: TextStyle(fontWeight: FontWeight.bold,

                 fontSize: 32,
               ),
             ),

           ],
         ),
      ),
    );
  }

  MaterialColor getThemeColor(String? condition) {
    if (condition == null) {
      return Colors.blue;
    }
    if (condition == 'Sunny' || condition == 'Clear') {
      return Colors.orange;
    } else if (condition == 'Partly cloudy' ||
        condition == 'Cloudy' ||
        condition == 'Overcast' ||
        condition == 'Mist' ||
        condition == 'Fog') {
      return Colors.grey;
    } else if (condition.contains('rain')) {
      return Colors.blue;
    } else if (condition.contains('snow') || condition.contains('showers')) {
      return Colors.lightBlue;
    } else if (condition.contains('sleet') || condition.contains('ice')) {
      return Colors.blueGrey;
    } else if (condition.contains('drizzle') ||
        condition == 'Freezing drizzle') {
      return Colors.cyan;
    } else if (condition.contains('thunder')) {
      return Colors.purple;
    } else if (condition == 'Blizzard' || condition == 'Heavy snow') {
      return Colors.indigo;
    } else {
      return Colors.blue; // Default color if the condition is not matched
    }
  }

}
