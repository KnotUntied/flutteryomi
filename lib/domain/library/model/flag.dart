abstract class Flag {
  int get flag;
}

abstract class Mask {
  int get mask;
}

abstract class FlagWithMask implements Flag, Mask {}

extension FlagMethods on int {
  bool contains(Flag other) {
    if (other is Mask) {
      return other.flag == (this & (other as FlagWithMask).mask);
    } else {
      return other.flag == this;
    }
  }

  int addFlag(Flag other) {
    if (other is Mask) {
      return (this & ~(other as FlagWithMask).mask) | (other.flag & other.mask);
    } else {
      return this | other.flag;
    }
  }
}

extension FlagPlusFlag on Flag {
  int operator +(Flag other) {
    if (other is Mask) {
      return (flag & ~(other as FlagWithMask).mask) | (other.flag & other.mask);
    } else {
      return flag | other.flag;
    }
  }
}
