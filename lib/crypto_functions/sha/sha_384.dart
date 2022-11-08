import 'dart:convert';

import 'package:cryptography/cryptography.dart';

class Sha_384 {

  Future<void> getHash(var text) async {
    final message = utf8.encode(text);
    final algorithm = Sha384();
    final hash = await algorithm.hash(message);
    print('Hash SHA384: ${hash.bytes}');
  }
}