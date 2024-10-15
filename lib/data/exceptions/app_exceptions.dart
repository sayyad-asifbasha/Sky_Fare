class AppException implements Exception
{
  final _message;
  final _prefix;
  AppException([this._message,this._prefix ]);

  @override
  String toString()
  {
    return '$_message$_prefix';
  }
}

class NoInternetException extends AppException{
  NoInternetException([String ?message]):super(message, "No Internet Connection");
}
class UnauthorisedException extends AppException{
  UnauthorisedException([String ?message]):super(message, "You don`t have access");
}
class FetechDataException extends AppException{
  FetechDataException([String ?message]):super(message, "Invalid Details");
}
class NotFoundException extends AppException{
  NotFoundException([String ?message]):super(message, "Invalid Credentials");
}