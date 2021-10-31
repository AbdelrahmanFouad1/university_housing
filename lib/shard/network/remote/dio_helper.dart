
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:university_housing/moduls/login/cubit/cubit.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/network/local/cache_helper.dart';

import '../end_point.dart';

class DioHelper{
  static late Dio dio;

  static init(){
      dio = Dio(
        BaseOptions(
          baseUrl: BASE_URL,
          receiveDataWhenStatusError: true,
          connectTimeout: 5000,
          receiveTimeout: 3000,
        ),
      );

  }

  static Future<Response?> postData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String? token,
  })async
  {


    try{
      return await dio.post(
        url,
        data: data,
        queryParameters: query,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization' : 'Bearer ${token??''}'
          },
        ),
      );
    }on DioError catch(e){
      var message =  e.response!.data['message'].toString();
      showToast(message: message, state: ToastStates.ERROR);
    }

  }

  static Future<Response?> getData({
    required String url,
    Map<String, dynamic>? query,
    String? token,
  })async
  {
    // dio.options.headers = {
    //   'Content-Type': 'application/json',
    //   // 'User-Agent': 'PostmanRuntime/7.28.4',
    //   // 'Accept': '*/*',
    //   // 'Accept-Encoding': 'gzip, deflate, br',
    //   // 'Connection': 'keep-alive',
    //   'Authorization' : 'Bearer $token',
    // };

    try{
      return await dio.get(
        url,
        // queryParameters: query??null,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization' : 'Bearer ${token??''}',
          },
        ),
      );
    }on DioError catch(e){
      var message =  e.response!.data.toString();
      showToast(message: message, state: ToastStates.ERROR);
    }

  }

}