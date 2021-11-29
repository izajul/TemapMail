class MyException implements Exception {
  final _message;
  final _reason;

  MyException([this._message, this._reason]);

  String toString() {
    return "$_reason$_message";
  }
}

class DataFetchingException extends MyException {
  DataFetchingException([String? message])
      : super(message, "Error During Communication: ");
}

class BadRequestException extends MyException {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

class UnauthorisedException extends MyException {
  UnauthorisedException([message]) : super(message, "Unauthorised Request: ");
}

class InvalidInputException extends MyException {
  InvalidInputException([String? message]) : super(message, "Invalid Input: ");
}

class NetworkNotAvailableException extends MyException {
  NetworkNotAvailableException([String? message])
      : super(message, "Network Not Found: ");
}

class UnprocessableException extends MyException {
  UnprocessableException([String? message])
      : super(message, "Entry Rejected: ");
}

class NoContentException extends MyException {
  NoContentException([String? message]) : super(message, "No Content: ");
}
