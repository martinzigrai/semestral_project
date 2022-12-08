import 'package:flutter/material.dart';
import 'crypto_functions/cryptography/sha/sha_1.dart';
import 'crypto_functions/cryptography/sha/sha_224.dart';
import 'crypto_functions/cryptography/sha/sha_256.dart';
import 'crypto_functions/cryptography/sha/sha_384.dart';
import 'crypto_functions/cryptography/sha/sha_512.dart';

import 'crypto_functions/cryptography/aes/aes_cbc.dart';
import 'crypto_functions/cryptography/aes/aes_gcm.dart';

import 'crypto_functions/cryptography/ed/ed_25519.dart';

import 'crypto_functions/crypto/sha/sha_1c.dart';
import 'crypto_functions/crypto/sha/sha_224c.dart';
import 'crypto_functions/crypto/sha/sha_256c.dart';
import 'crypto_functions/crypto/sha/sha_384c.dart';
import 'crypto_functions/crypto/sha/sha_512c.dart';

import 'crypto_functions/pointy_castle/sha/sha_1p.dart';
import 'crypto_functions/pointy_castle/sha/sha_224p.dart';
import 'crypto_functions/pointy_castle/sha/sha_256p.dart';
import 'crypto_functions/pointy_castle/sha/sha_384p.dart';
import 'crypto_functions/pointy_castle/sha/sha_512p.dart';
import 'crypto_functions/pointy_castle/sha/sha3_224p.dart';
import 'crypto_functions/pointy_castle/sha/sha3_256p.dart';
import 'crypto_functions/pointy_castle/sha/sha3_384p.dart';
import 'crypto_functions/pointy_castle/sha/sha3_512p.dart';

import 'crypto_functions/pointy_castle/aes/aes_cbc_p.dart';
import 'crypto_functions/pointy_castle/aes/aes_ccm_p.dart';
import 'crypto_functions/pointy_castle/aes/aes_ecb_p.dart';
import 'crypto_functions/pointy_castle/aes/aes_gcm_p.dart';

import 'crypto_functions/pointy_castle/ecdsa/ecdsa-192_sign_verify_p.dart';
import 'crypto_functions/pointy_castle/ecdsa/ecdsa-224_sign_verify_p.dart';
import 'crypto_functions/pointy_castle/ecdsa/ecdsa-256_sign_verify_p.dart';
import 'crypto_functions/pointy_castle/ecdsa/ecdsa-384_sign_verify_p.dart';
import 'crypto_functions/pointy_castle/ecdsa/ecdsa-521_sign_verify_p.dart';

import 'crypto_functions/pointy_castle/rsa/rsa-1024_sign_verify_p.dart';
import 'crypto_functions/pointy_castle/rsa/rsa-2048_sign_verify_p.dart';
import 'crypto_functions/pointy_castle/rsa/rsa-3072_sign_verify_p.dart';

import 'crypto_functions/encrypt/aes/aes_cbc_e.dart';
import 'crypto_functions/encrypt/aes/aes_ecb_e.dart';

import 'crypto_functions/ninja/rsa/rsa-1024_sign_verify_n.dart';
import 'crypto_functions/ninja/rsa/rsa-2048_sign_verify_n.dart';
import 'crypto_functions/ninja/rsa/rsa-3072_sign_verify_n.dart';

void main() => runApp(MaterialApp(
  home: BleTest(),
));

class BleTest extends StatefulWidget {
  @override
  State<BleTest> createState() => _BleTestState();
}

class _BleTestState extends State<BleTest>{

  //final myController = TextEditingController();
  //late var form_text;

  //funkcie z kniznice cryptography
  Sha_1 sh1 = Sha_1('cryptography SHA 1');
  Sha_224 sh224 = Sha_224('cryptography SHA 224');
  Sha_256 sh256 = Sha_256('cryptography SHA 256');
  Sha_384 sh384 = Sha_384('cryptography SHA 384');
  Sha_512 sh512 = Sha_512('cryptography SHA 512');

  Aes_cbc aescbc = Aes_cbc('cryptography AES-cbc');
  Aes_gcm aesgcm = Aes_gcm('cryptography AES-gcm');

  Ed_25519 ed = Ed_25519('cryptography ED25519');

  //funkcie z kniznice crypto
  Sha_1c sh1c = Sha_1c('crypto SHA 1');
  Sha_224c sh224c = Sha_224c('crypto SHA 224');
  Sha_256c sh256c = Sha_256c('crypto SHA 256');
  Sha_384c sh384c = Sha_384c('crypto SHA 384');
  Sha_512c sh512c = Sha_512c('crypto SHA 512');

  //funkcie z kniznice pointycastle
  Sha_1p sh1p = Sha_1p('pointycastle SHA 1');
  Sha_224p sh224p = Sha_224p('pointycastle SHA 224');
  Sha_256p sh256p = Sha_256p('pointycastle SHA 256');
  Sha_384p sh384p = Sha_384p('pointycastle SHA 384');
  Sha_512p sh512p = Sha_512p('pointycastle SHA 512');
  Sha3_224p sh3224p = Sha3_224p('pointycastle SHA3 224');
  Sha3_256p sh3256p = Sha3_256p('pointycastle SHA3 256');
  Sha3_384p sh3384p = Sha3_384p('pointycastle SHA3 384');
  Sha3_512p sh3512p = Sha3_512p('pointycastle SHA3 512');

  Aes_cbc_p aescbc_p = Aes_cbc_p('pointycastle AES-cbc');
  Aes_ccm_p aesccm_p = Aes_ccm_p('pointycastle AES-ccm');
  Aes_gcm_p aesgcm_p = Aes_gcm_p('pointycastle AES-gcm');
  Aes_ecb_p aesecb_p = Aes_ecb_p('pointycastle AES-ecb');

  ECDSA_sign_verify_192 ecdsa_sign_verify_192_p = ECDSA_sign_verify_192('pointycastle ECDSA-192');
  ECDSA_sign_verify_224 ecdsa_sign_verify_224_p = ECDSA_sign_verify_224('pointycastle ECDSA-224');
  ECDSA_sign_verify_256 ecdsa_sign_verify_256_p = ECDSA_sign_verify_256('pointycastle ECDSA-256');
  ECDSA_sign_verify_384 ecdsa_sign_verify_384_p = ECDSA_sign_verify_384('pointycastle ECDSA-384');
  ECDSA_sign_verify_521 ecdsa_sign_verify_521_p = ECDSA_sign_verify_521('pointycastle ECDSA-521');

  RSA_sign_verify_1024 rsa_sign_verify_1024_p = RSA_sign_verify_1024('pointycastle RSA-1024');
  RSA_sign_verify_2048 rsa_sign_verify_2048_p = RSA_sign_verify_2048('pointycastle RSA-2048');
  RSA_sign_verify_3072 rsa_sign_verify_3072_p = RSA_sign_verify_3072('pointycastle RSA-3072');

  //funkcie z kniznice encrypt
  Aes_cbc_e aes_cbc_e = Aes_cbc_e('encrypt AES-cbc');
  Aes_ecb_e aes_ecb_e = Aes_ecb_e('encrypt AES-ecb');

  //funkcie z kniznice ninja
  RSA_sign_verify_1024_n rsa_sign_verify_1024_n = RSA_sign_verify_1024_n('ninja RSA-1024');
  RSA_sign_verify_2048_n rsa_sign_verify_2048_n = RSA_sign_verify_2048_n('ninja RSA-2048');
  RSA_sign_verify_3072_n rsa_sign_verify_3072_n = RSA_sign_verify_3072_n('ninja RSA-3072');

  /*@override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }*/

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Testovanie kryptograficých primitív'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0,120.0,0,0),
        child: Column(
          children: <Widget>[
              Center(
                child: TextButton(
                  child: Text('TEST', style: TextStyle(fontSize: 50.0),),
                  onPressed: () {
                    setState(() {
                      //cryptography
                      sh1.report();
                      sh224.report();
                      sh256.report();
                      sh384.report();
                      sh512.report();

                      aescbc.report();
                      aesgcm.report();

                      ed.report();

                      //crypto
                      sh1c..report();
                      sh224c.report();
                      sh256c.report();
                      sh384c.report();
                      sh512c.report();

                      //pointycastle
                      sh1p.report();
                      sh224p.report();
                      sh256p.report();
                      sh384p.report();
                      sh512p.report();
                      sh3224p.report();
                      sh3256p.report();
                      sh3384p.report();
                      sh3512p.report();

                      aescbc_p.report();
                      aesccm_p.report();
                      aesgcm_p.report();
                      aesecb_p.report();

                      ecdsa_sign_verify_192_p.report();
                      ecdsa_sign_verify_224_p.report();
                      ecdsa_sign_verify_256_p.report();
                      ecdsa_sign_verify_384_p.report();
                      ecdsa_sign_verify_521_p.report();

                      rsa_sign_verify_1024_p.report();
                      rsa_sign_verify_2048_p.report();
                      rsa_sign_verify_3072_p.report();

                      //encrypt
                      aes_cbc_e.report();
                      aes_ecb_e.report();

                      //ninja
                      rsa_sign_verify_1024_n.report();
                      rsa_sign_verify_2048_n.report();
                      rsa_sign_verify_3072_n.report();
                    });
                  },
                ),
              ),
          ],
        ),
      ),
      /*body: Padding(
        padding: const EdgeInsets.fromLTRB(0,120.0,0,0),
        child: Column(
          children: <Widget>[
            /*TextField(
              controller: myController,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Text',
              ),
            ),*/
            SizedBox(height: 20.0),
            TextButton(
              child: Text('SHA', style: TextStyle(fontSize: 20.0),),
              onPressed: () {
                form_text = myController.text;
                setState(() {
                  //cryptography
                  sh1.getHash(form_text);
                  sh224.getHash(form_text);
                  sh256.getHash(form_text);
                  sh384.getHash(form_text);
                  sh512.getHash(form_text);

                  //crypto
                  sh1c.getHash(form_text);
                  sh224c.getHash(form_text);
                  sh256c.getHash(form_text);
                  sh384c.getHash(form_text);
                  sh512c.getHash(form_text);

                  //pointycastle
                  sh1p.getHash(form_text);
                  sh224p.getHash(form_text);
                  sh256p.getHash(form_text);
                  sh384p.getHash(form_text);
                  sh512p.getHash(form_text);
                  sh3224p.getHash(form_text);
                  sh3256p.getHash(form_text);
                  sh3384p.getHash(form_text);
                  sh3512p.getHash(form_text);
                });
                myController.clear();
              },
            ),
           /* SizedBox(height: 20.0),
            TextButton(
              child: Text('AES', style: TextStyle(fontSize: 20.0),),
              onPressed: (){
                form_text = myController.text;
                setState(() {
                  //cryptography
                  aescbc.getAEScbc(form_text);
                  aesgcm.getAESgcm(form_text);

                  //pointycastle
                  aescbc_p.getAES(form_text);
                  aesccm_p.getAES(form_text);
                  aesgcm_p.getAES(form_text);
                  aesecb_p.getAES(form_text);

                  //encrypt
                  aes_cbc_e.getAES(form_text);
                  aes_ecb_e.getAES(form_text);
                });
                myController.clear();
              },
            ),
            SizedBox(height: 20.0),
            TextButton(
              child: Text('ED25519', style: TextStyle(fontSize: 20.0),),
              onPressed: (){
                form_text = myController.text;
                setState(() {
                  ed.getEd(form_text);
                });
                myController.clear();
              },
            ),
            SizedBox(height: 20.0),
            TextButton(
              child: Text('ECDSA', style: TextStyle(fontSize: 20.0),),
              onPressed: (){
                form_text = myController.text;
                setState(() {
                  ecdsa_sign_verify_192_p.getECDSA_sign_verify(form_text);
                  ecdsa_sign_verify_224_p.getECDSA_sign_verify(form_text);
                  ecdsa_sign_verify_256_p.getECDSA_sign_verify(form_text);
                  ecdsa_sign_verify_384_p.getECDSA_sign_verify(form_text);
                  ecdsa_sign_verify_521_p.getECDSA_sign_verify(form_text);
                });
                myController.clear();
              },
            ),
            SizedBox(height: 20.0),
            TextButton(
              child: Text('RSA', style: TextStyle(fontSize: 20.0),),
              onPressed: (){
                form_text = myController.text;
                setState(() {
                  //pointycastle
                  rsa_sign_verify_1024_p.getRSA_sign_verify(form_text);
                  rsa_sign_verify_2048_p.getRSA_sign_verify(form_text);
                  rsa_sign_verify_3072_p.getRSA_sign_verify(form_text);

                  //ninja
                  rsa_sign_verify_1024_n.getRSA_sign_verify_n(form_text);
                  rsa_sign_verify_2048_n.getRSA_sign_verify_n(form_text);
                  rsa_sign_verify_3072_n.getRSA_sign_verify_n(form_text);
                });
                myController.clear();
              },*/
            ),
          ],
        ),
      ),*/
    );
  }
}

