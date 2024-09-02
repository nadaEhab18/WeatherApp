import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_using_bloc/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app_using_bloc/models/weather_model.dart';
import 'package:weather_app_using_bloc/services/weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherStates>{
  GetWeatherCubit() :  super(WeatherInitialState());

   WeatherModel? weatherModel;
  getWeather({required String cityName}) async {
    try{
       weatherModel = await WeatherServices(Dio())
        .getCurrentWeather(cityName: cityName);
    emit(WeatherLoadedState());
  }catch(e){
      emit(WeatherFailureState());
    }
  }

}