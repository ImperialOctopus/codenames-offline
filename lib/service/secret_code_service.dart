import 'dart:math';

class SecretCodeService {
  String encode(List<bool> bits) {
    bits
        .asMap()
        .map<int, int>(
            (k, v) => MapEntry(k, v ? pow(2, bits.length - k - 1).toInt() : 0))
        .values
        .reduce((a, b) => a + b);
  }

  List<bool> decode(String string) {}
}
