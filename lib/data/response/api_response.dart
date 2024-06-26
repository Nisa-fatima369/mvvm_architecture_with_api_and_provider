import 'package:mvvm_architecture_with_api_and_provider/data/response/status.dart';

class ApiResponse<T>{
  Status? status;
  String? message;
  T? data;

  ApiResponse(this.status, this.message, this.data);

  ApiResponse.loading() : status = Status.LOADING;
  ApiResponse.completed() : status = Status.COMPLETED;
  ApiResponse.error() : status = Status.ERROR;

  @override
  String toString() {
    return 'Status : $status \n Message : $message \n Data : $data';
  }

}