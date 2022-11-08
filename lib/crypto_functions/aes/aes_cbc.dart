import 'dart:convert';
import 'package:cryptography/cryptography.dart';

class Aes_cbc{

  Future<void> getAEScbc(var text) async{
    final message = utf8.encode(text);

    final algorithm = AesCbc.with128bits(macAlgorithm: Hmac.sha256(),);
    final secretKey = await algorithm.newSecretKey();
    final nonce = algorithm.newNonce();

    // Encrypt
    final secretBox = await algorithm.encrypt(
      message,
      secretKey: secretKey,
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

