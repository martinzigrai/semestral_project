import 'dart:convert';
import 'package:cryptography/cryptography.dart';

class Aes_gcm {

  Future<void> getAESgcm(var text) async {
    final message = utf8.encode(text);

    final algorithm = AesGcm.with128bits();
    final secretKey = await algorithm.newSecretKey();
    final nonce = algorithm.newNonce();

    // Encrypt
    final secretBox = await algorithm.encrypt(
      message,
      secretKey: secretKey,
      nonce: nonce,
    );
    print('Ciphertext: ${secretBox.cipherText}');

    // Decrypt
    final clearText = await algorithm.decrypt(
      secretBox,
      secretKey: secretKey,
    );
    print('Cleartext: $clearText');
    print(utf8.decode(clearText));
  }
}