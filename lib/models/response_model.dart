class ResponseModel {
  bool _isSuccess;
  String _message;

  //private properties cannot be wrapped around in the {} in the constructor
  //public properties are needed to use {} and required keyword
  ResponseModel(this._isSuccess, this._message);

  //getter method to access private properties
  String get message => _message;
  bool get isSuccess => _isSuccess;
}
