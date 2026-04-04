import 'package:dio/dio.dart';
import 'package:flutter_breaking/constant/strings.dart';

class webservese{
  Dio ?dio;
  webservese(){

    BaseOptions baseoptios=BaseOptions(
      baseUrl: BasUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: Duration(seconds: 20),
receiveTimeout: Duration(seconds: 20)
    );

    dio=Dio(baseoptios);

  }
  Future<List<dynamic>>getAllCherectors()async{

try {
  Response response = await dio!.get("character");
  print(response.data.toString());
  final data=response.data;
  return data['results'];
}
catch(e){



  print(e.toString());



  return [];
}
  }









}