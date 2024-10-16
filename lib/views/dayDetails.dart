
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_using_bloc/constant/widgets/logoApp.dart';
import 'package:weather_app_using_bloc/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app_using_bloc/models/weather_model.dart';
import 'package:weather_app_using_bloc/widgets/dailyForecastWidget.dart';

class DayDetails extends StatelessWidget {
  const DayDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel =
    BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title:  LogoApp(),

      ),

      body:Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.blueGrey,
                Colors.white70,
                Colors.lightBlue.shade200,
              ],
            ),),
        child: ListView(
          children: [
            dailyForeCastWidget(
              dayNumber: 'One',
              dayWeatherCondition: '${weatherModel.weatherConditionDay1}',
              dayDate: '${weatherModel.date.year} - ${weatherModel.date.month} - ${weatherModel.date.day}',
              dayImage: '${weatherModel.image}',
              dayMaxTemp: weatherModel.maxTemp,
              dayMinTemp: weatherModel.minTemp,
              dayHumidity: weatherModel.humidityDay1,
              dayWindSpeed: weatherModel.windSpeedDay1,
            ),

            dailyForeCastWidget(
              dayNumber: 'Two',
              dayWeatherCondition: '${weatherModel.weatherConditionDay2}',
              dayDate: '${weatherModel.date.year} - ${weatherModel.date.month} - ${weatherModel.date.day+1}',
              dayImage: '${weatherModel.imageDay2}',
              dayMaxTemp: weatherModel.maxTempDay2,
              dayMinTemp: weatherModel.minTempDay2,
              dayHumidity: weatherModel.humidityDay2,
              dayWindSpeed: weatherModel.windSpeedDay2,
            ),
            dailyForeCastWidget(
              dayNumber: 'Three',
              dayWeatherCondition: '${weatherModel.weatherConditionDay3}',
              dayDate: '${weatherModel.date.year} - ${weatherModel.date.month} - ${weatherModel.date.day+2}',
              dayImage: '${weatherModel.imageDay3}',
              dayMaxTemp: weatherModel.maxTempDay3,
              dayMinTemp: weatherModel.minTempDay3,
              dayHumidity: weatherModel.humidityDay3,
              dayWindSpeed: weatherModel.windSpeedDay3,
            ),


          ],
        ),
      )
    );
  }
}



