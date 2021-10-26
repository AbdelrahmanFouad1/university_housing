import 'package:dio/dio.dart';
import 'package:university_housing/shard/components/components.dart';

class DioHelper{
  static late Dio dio;

  static init(){
      dio = Dio(
        BaseOptions(
          baseUrl: 'https://graduation-projec.herokuapp.com/api/',
          receiveDataWhenStatusError: true,
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

    // dio.options.headers = {
    //   'Content-Type': 'application/json',
    // };

    try{
      return await dio.post(
        url,
        data: data,
        queryParameters: query,
        options: Options(
          headers: {'Content-Type': 'application/json'},
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

    dio.options.headers = {
      'Content-Type': 'application/json',
      // 'User-Agent': 'PostmanRuntime/7.28.4',
      // 'Accept': '*/*',
      // 'Accept-Encoding': 'gzip, deflate, br',
      // 'Connection': 'keep-alive',
      'Authorization' : 'Bearer $token',
    };

    return await dio.post(
      url,
      queryParameters: query,
    );


  }

}