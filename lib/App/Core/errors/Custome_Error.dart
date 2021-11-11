class CustomException implements Exception {
  final String message;
  final int statusCode;

  //CustomException([this.message, this.statusCode]);
  CustomException({required this.message, required this.statusCode});

  // String toString() {
  // return "$statusCode$message";
  // }
}

// class FetchDataException extends CustomException {
//   FetchDataException([String? message])
//   : super(message, "Error During Communication: ");
// }

// class BadRequestException extends CustomException {
//   BadRequestException([message]) : super(message, "Invalid Request: ");
// }

// class UnauthorisedException extends CustomException {
//   UnauthorisedException([message]) : super(message, "Unauthorised: ");
// }

// class InvalidInputException extends CustomException {
//   InvalidInputException([String? message]) : super(message, "Invalid Input: ");
// }