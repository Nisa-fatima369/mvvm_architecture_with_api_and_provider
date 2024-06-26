
import 'dart:convert';
import 'dart:io';
import 'package:mvvm_architecture_with_api_and_provider/data/app_exception.dart';
import 'package:mvvm_architecture_with_api_and_provider/data/network/base_api_services.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiServices{
  @override
  Future getGetApiResponse(String url) async{

    dynamic responseJson;
    try{
      final response = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    }
    on SocketException{
      throw FetchDataException('No Internet connection');
    
    }
    return responseJson;
  }

  @override
  Future getPostApiResponse(String url,dynamic data) async{
    dynamic responseJson;
    try{
      final response = await http.post(
        Uri.parse(url),
        body: data,
      ).timeout(const Duration(seconds: 10)
      );
      responseJson = returnResponse(response);
    }
    on SocketException{
      throw FetchDataException('No Internet connection');
    
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response){
    switch(response.statusCode){
      case 200:
        var responseJson = jsonDecode(response.body.toString());
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException('Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }


}