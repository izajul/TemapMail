class ApiResponse<T> {
  late ResponseStatus status;
  T? data;
  String? message;

  ApiResponse.initiate(this.message) : status = ResponseStatus.INITIATE;

  ApiResponse.loading(this.message) : status = ResponseStatus.LOADING;

  ApiResponse.completed(this.data) : status = ResponseStatus.COMPLETED;

  ApiResponse.error(this.message) : status = ResponseStatus.ERROR;
}

enum ResponseStatus { INITIATE, LOADING, COMPLETED, ERROR }
