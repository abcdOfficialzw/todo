class Strings {
  static WheelPicker wheelPicker = const WheelPicker();
  static Counter counter = const Counter();

  // Error labels
  static const generalErrorTitle = 'Oops, something went wrong!';
}

class WheelPicker {
  const WheelPicker();

  final titleText = 'Wheel Picker';
  final countText = 'count';
  final stepsText = 'steps';
  final multiplierText = 'multiplier';
  final spacingText = 'spacing';
}

class Counter {
  const Counter();

  final option1 = 10;
  final option2 = 20;
  final option3 = 30;
}
