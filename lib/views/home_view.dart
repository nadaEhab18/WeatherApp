import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_using_bloc/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app_using_bloc/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app_using_bloc/constant/widgets/logoApp.dart';
import 'package:weather_app_using_bloc/widgets/noResult.dart';
import 'package:weather_app_using_bloc/widgets/noWeatherBody.dart';
import 'package:weather_app_using_bloc/constant/widgets/searchIcon.dart';
import 'package:weather_app_using_bloc/widgets/weatherInfoBody.dart';
import 'package:weather_app_using_bloc/widgets/weatherLoading.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const LogoApp(),
        actions: [
          const SearchIcon(),
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherStates>(
        builder: (context, state) {
          if (state is WeatherInitialState) {
            return NoWeatherBody();
          } else if (state is WeatherLoadingState) {
            return WeatherLoading();
          } else if (state is WeatherSuccessState) {
            return WeatherInfoBody();
          } else {
            return NoResult();
          }
        },
      ),
    );
  }
}


