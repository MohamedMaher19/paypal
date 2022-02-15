import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_braintree/flutter_braintree.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,

      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('paypal'),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(15),
          height: 100,
          width: double.infinity,
          child: ElevatedButton(
            child: Text(
              'please choose the way to pay',
              style: TextStyle(
                fontSize: 22
              ),
            ),
            onPressed: () async {
              var request = BraintreeDropInRequest(
                  tokenizationKey: 'sandbox_cs83fywp_zq4jnsck8wm585s9',
                  collectDeviceData: true,
                  paypalRequest: BraintreePayPalRequest(
                      amount: '10.00',
                      displayName: 'paypal payment'
                  ),
                  cardEnabled: true
              );
              BraintreeDropInResult? result =
              await BraintreeDropIn.start(request);
              if( result != null){
                print (result.paymentMethodNonce.description);
                print(result.paymentMethodNonce.nonce);
              }
            }
            ,
          ),
        ),

      ),
    );
  }
}
