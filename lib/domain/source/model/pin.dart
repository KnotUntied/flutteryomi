enum Pin {
  unpinned(0x0),
  pinned(0x1),
  actual(0x2);

  const Pin(this.code);

  final int code;
}

class Pins {
  const Pins([this.code = 0x0]);
  final int code;

  bool contains(Pin pin) => (pin.code & code) == pin.code;
  
  Pins operator +(Pin pin) => Pins(code | pin.code);
  
  Pins operator -(Pin pin) => Pins(code ^ pin.code);

  static const unpinned = Pins(0x0);
  static const pinned = Pins(0x1 | 0x2);
}

Pins pins(List<Pin> pins) => Pins(pins.fold<int>(0x0, (p, e) => p |= e.code));
