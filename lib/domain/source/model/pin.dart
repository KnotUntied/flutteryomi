const int _unpinnedCode = 0x0;

class Pin {
  final int code;
  const Pin(this.code);
  static const Pin unpinned = Pin(_unpinnedCode);
  static const Pin pinned = Pin(0x1);
  static const Pin actual = Pin(0x2);
}

class Pins {
  final int code;
  Pins({this.code = _unpinnedCode});
  
  bool contains(Pin pin) => (pin.code & code) == pin.code;
  
  Pins operator +(Pin pin) => Pins(code: code | pin.code);
  
  Pins operator -(Pin pin) => Pins(code: code ^ pin.code);
  
  static final Pins unpinned = Pins(code: Pin.unpinned.code);
  static final Pins pinned = Pins(code: Pin.pinned.code | Pin.actual.code);
}

Pins pins(List<Pin> pins) {
  int result = 0x0;
  for (var pin in pins) {
    result |= pin.code;
  }
  return Pins(code: result);
}
