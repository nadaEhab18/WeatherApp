import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_using_bloc/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app_using_bloc/models/weather_model.dart';
import 'package:weather_app_using_bloc/views/dayDetails.dart';
import 'package:weather_app_using_bloc/widgets/dayForecast.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel =
        BlocProvider.of<GetWeatherCubit>(context).weatherModel!;

    return Container(
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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weatherModel.cityName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
            Text(
              'Time: ${weatherModel.date.hour}:${weatherModel.date.minute}',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network(
                  'https:${weatherModel.image!}',
                ),
                Text(
                  '${weatherModel.temp.round()}°C',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                Text(
                '${weatherModel.weatherCondition}',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                ),

              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  'assets/images/hot.png',
                  height: 50,
                  width: 50,
                ),
                Text(
                  'Temp Max \n${weatherModel.maxTemp.round()}°C',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Image.asset(
                  'assets/images/temperature.png',
                  height: 70,
                  width: 70,
                ),
                Text(
                  'Temp Min \n${weatherModel.minTemp.round()}°C',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.blueGrey.shade500),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ForeCost for 3 Days :',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  DayForecast(
                    day: 'Day One',
                    dayImage: weatherModel.image!,
                    dayCondition: weatherModel.weatherConditionDay1,
                    dayMaxTemp: weatherModel.maxTemp,
                    dayMinTemp: weatherModel.minTemp,
                  ),
                  Divider(
                    color: Colors.white70,
                    thickness: 1,
                  ),
                  DayForecast(
                    day: 'Day Two',
                    dayImage: weatherModel.imageDay2!,
                    dayCondition: weatherModel.weatherConditionDay2,
                    dayMaxTemp: weatherModel.maxTempDay2,
                    dayMinTemp: weatherModel.minTempDay2,
                  ),

                  Divider(
                    color: Colors.white70,
                    thickness: 1,
                  ),
                  DayForecast(
                    day: 'Day Three',
                    dayImage: weatherModel.imageDay3!,
                    dayCondition: weatherModel.weatherConditionDay3,
                    dayMaxTemp: weatherModel.maxTempDay3,
                    dayMinTemp: weatherModel.minTempDay3,
                  ),

                  GestureDetector(
                    onTap: () {
                      var getWeatherCubit =
                          BlocProvider.of<GetWeatherCubit>(context);
                      getWeatherCubit.getWeather(
                          cityName: weatherModel.cityName);
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return DayDetails();
                      }));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'More Details',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Icon(
                          Icons.double_arrow_sharp,
                          size: 20,
                          color: Colors.white,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

