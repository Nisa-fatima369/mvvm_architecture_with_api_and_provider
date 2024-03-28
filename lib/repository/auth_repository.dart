import 'package:mvvm_architecture_with_api_and_provider/data/network/base_api_services.dart';
import 'package:mvvm_architecture_with_api_and_provider/data/network/network_api_services.dart';
import 'package:mvvm_architecture_with_api_and_provider/resource/app_url.dart';

class AuthRepository{
  BaseApiServices apiServices = NetworkApiServices();

  Future<dynamic> loginApi(dynamic data) async{
    try{
      final response = await apiServices.getPostApiResponse(AppUrl.loginEndPoint, data);
      return response;
    }
    catch(e){
      throw(e);
    }
  }

  Future<dynamic> signUpApi(dynamic data) async{
    try{
      final response = await apiServices.getPostApiResponse(AppUrl.registerEndPoint, data);
      return response;
    }
    catch(e){
      throw(e);
    }
  }
}