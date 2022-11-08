import 'dart:convert';
import 'package:cryptography/cryptography.dart';

class Ed_25519{

  Future<void> getEd(var text) async{
    final algorithm = Ed25519();

    final keyPair = await algorithm.newKeyPair();

    final message = utf8.encode(text);
    final signature = await algorithm.sign(message, keyPair: keyPair);
    print('Signature bytes: ${signature.bytes}');
    print('Public key: ${signature.publicKey}');

    final isSignatureCorrect = await algorithm.verify(message, signature: signature);
    print('$isSignatureCorrect');

  }

}