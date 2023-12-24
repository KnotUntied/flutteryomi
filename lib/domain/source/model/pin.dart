import 'package:freezed_annotation/freezed_annotation.dart';

part 'pin.freezed.dart';

enum Pin {
  unpinned(0x0),
  pinned(0x1),
  actual(0x2);

  const Pin(this.code);

  final int code;
}

@freezed
class Pins with _$Pins {
  const Pins._();
  const factory Pins({@Default(0x0) required int code}) = _Pins;

  bool contains(Pin pin) => (pin.code & code) == pin.code;
  
  Pins operator +(Pin pin) => Pins(code: code | pin.code);
  
  Pins operator -(Pin pin) => Pins(code: code ^ pin.code);

  factory Pins.unpinned() => _Pins(code: Pin.unpinned.code);
  factory Pins.pinned() => _Pins(code: Pin.pinned.code | Pin.actual.code);
}

Pins pins(List<Pin> pins) {
  int result = pins.fold<int>(0x0, (p, e) => p |= e.code);
  return Pins(code: result);
}
