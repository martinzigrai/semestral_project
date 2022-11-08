import 'package:flutter/material.dart';
import 'crypto_functions/sha/sha_1.dart';
import 'crypto_functions/sha/sha_224.dart';
import 'crypto_functions/sha/sha_256.dart';
import 'crypto_functions/sha/sha_384.dart';
import 'crypto_functions/sha/sha_512.dart';

import 'crypto_functions/aes/aes_cbc.dart';
import 'crypto_functions/aes/aes_gcm.dart';

import 'package:blecrypto/crypto_functions/ed/ed_25519.dart';

void main() => runApp(MaterialApp(
  home: BleTest(),
));

class BleTest extends StatefulWidget {
  @override
  State<BleTest> createState() => _BleTestState();
}

class _BleTestState extends State<BleTest>{

  final myController = TextEditingController();
  late var form_text;
  Sha_1 sh1 = Sha_1();
  Sha_224 sh224 = Sha_224();
  Sha_256 sh256 = Sha_256();
  Sha_384 sh384 = Sha_384();
  Sha_512 sh512 = Sha_512();

  Aes_cbc aescbc = Aes_cbc();
  Aes_gcm aesgcm = Aes_gcm();

  Ed_25519 ed = Ed_25519();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

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
            TextField(
              controller: myController,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Text',
              ),
            ),
            SizedBox(height: 20.0),
            TextButton(
              child: Text('SHA', style: TextStyle(fontSize: 20.0),),
              onPressed: () {
                form_text = myController.text;
                setState(() {
                  sh1.getHash(form_text);
                  sh224.getHash(form_text);
                  sh256.getHash(form_text);
                  sh384.getHash(form_text);
                  sh512.getHash(form_text);
                });
                myController.clear();
              },
            ),
            SizedBox(height: 20.0),
            TextButton(
              child: Text('AES', style: TextStyle(fontSize: 20.0),),
              onPressed: (){
                form_text = myController.text;
                setState(() {
                  aescbc.getAEScbc(form_text);
                  aesgcm.getAESgcm(form_text);
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
          ],
        ),
      ),
    );
  }
}

