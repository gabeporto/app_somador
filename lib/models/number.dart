class Number {
  static final Number instance = Number._();

  double _counter = 0;

  Number._();

  double getCounter() {
    return _counter;
  }

  void setCounter(double value) {
    _counter = value;
  }
}
