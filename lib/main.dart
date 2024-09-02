import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_using_bloc/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app_using_bloc/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app_using_bloc/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) =>
            BlocBuilder<GetWeatherCubit, WeatherStates>(
              builder: (context, state) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  theme: ThemeData(
                    primarySwatch: getThemeColor(
                        BlocProvider
                            .of<GetWeatherCubit>(context)
                            .weatherModel
                            ?.weatherCondition),
                  ),
                  home: HomeView(),
                );
              },
            ),
      ),
    );
  }
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

