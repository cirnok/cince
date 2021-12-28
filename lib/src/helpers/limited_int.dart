import 'package:cince/cince.dart';

@immutable
class LimitedInt {
  const LimitedInt(
    this.value, {
    required this.min,
    required this.max,
  });

  final int value;
  final int min;
  final int max;

  int call() {
    return value;
  }

  LimitedInt operator +(num other) {
    return _transform(value + other);
  }

  LimitedInt operator -(num other) {
    return _transform(value - other);
  }

  LimitedInt operator *(num other) {
    return _transform(value * other);
  }

  LimitedInt operator /(num other) {
    return _transform(value / other);
  }

  @override
  bool operator ==(Object other) {
    return value == other;
  }

  @override
  int get hashCode => value.hashCode;

  LimitedInt _transform(num other) {
    var result = other;
    if (other > value) {
      result = max;
    } else if (other < value) {
      result = min;
    }

    return LimitedInt(result.toInt(), min: min, max: max);
  }
}
