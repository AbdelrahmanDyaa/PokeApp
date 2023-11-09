import 'package:dio/dio.dart';
import 'end_points.dart';

class DioHelper{
  static Dio? dio;


  static void init(){
    dio = Dio(
        BaseOptions(
            baseUrl: EndPoints.pokeUrl,
            receiveDataWhenStatusError: true,

        )
    );
  }

  static Future<Response> get({
    required String endpiont,
    String? token,
  }) async {
    try {

      Response? response = await  dio?.get(
        endpiont,

      );

      return response!;

    }catch(e){
      rethrow;
    }
  }


  static  Future<Response?> put({
    required String endpiont,
    Map<String,dynamic>? body,
    Map<String,dynamic>? params,
    String? token,


  }) async {
    try {
      dio?.options.headers ={
        "Authorization" : "Token token=\"$token\"",
      };

      Response? response = await  dio?.put(
        endpiont,
        data: body,
        queryParameters: params,
      );
      return response!;
    }catch(e){
      rethrow;
    }
  }

  static  Future<Response?> post({
    required String endpiont,
    Map<String,dynamic>? body,
    Map<String,dynamic>? params,
    String? token,


  }) async {
    try {
      dio?.options.headers ={
        "Authorization" : "Token token=\"$token\"",
      };

      Response? response = await  dio?.post(
        endpiont,
        data: body,
        queryParameters: params,
      );
      return response!;
    }catch(e){
      rethrow;
    }
  }
}
