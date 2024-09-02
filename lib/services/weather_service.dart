
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app_using_bloc/models/weather_model.dart';

class WeatherServices {
  final Dio dio;

  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = '24159db25e6b4f34ae2195456241307';
  WeatherServices(this.dio);
  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=10');
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
       return weatherModel;
    } on DioException catch (e) {
      final String errorMessage =
          e.response?.data['error']['message'] ?? 'oops there was an error, try';
      throw Exception(errorMessage);
    }catch (e){
      log(e.toString());
      throw Exception('oops there was an error, try');
    }
  }
}
