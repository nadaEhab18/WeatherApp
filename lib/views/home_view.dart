import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_using_bloc/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app_using_bloc/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app_using_bloc/views/search_view.dart';
import 'package:weather_app_using_bloc/widgets/noWeatherBody.dart';
import 'package:weather_app_using_bloc/widgets/weatherInfoBody.dart';

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
          title: const Text('Weather App'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const SearchView();
                }));
              },
              icon: Icon(
                Icons.search,
              ),
            ),
          ],
        ),
        body: BlocBuilder<GetWeatherCubit, WeatherStates>(
          builder: (context, state) {
            if (state is WeatherInitialState) {
              return NoWeatherBody();
            } else if (state is WeatherLoadedState) {
              return WeatherInfoBody();
            } else {
              return Text('oops There was an Error');
            }
          },
        ));
  }
}
