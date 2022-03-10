bool isNumber(String string) {
  final number = num.tryParse(string);
  if (number == null) {
    return false;
  }
  return true;
}
