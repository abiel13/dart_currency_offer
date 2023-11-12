import 'package:flutter/material.dart';

class CurrencyConverterMaterial extends StatefulWidget {
  const CurrencyConverterMaterial({super.key});
  @override
  State createState() => _CurrencyState();
}

class _CurrencyState extends State {
  final TextEditingController textEditingController = TextEditingController();
  double result = 0;

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
        borderSide: BorderSide(
          width: 0,
        ),
        borderRadius: BorderRadius.all(Radius.circular(25)));

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            'currency converter',
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: const Color.fromRGBO(55, 55, 55, 1),
        body: Center(
            child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: Text(
                  'NGN ${result.toStringAsFixed(3)}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: Colors.white,
                  ),
                ),
              ),
              TextField(
                controller: textEditingController,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                ),
                decoration: const InputDecoration(
                  hintText: 'pleas Enter the amount in Usd',
                  prefixIcon: Icon(Icons.monetization_on),
                  prefixIconColor: Colors.white,
                  filled: true,
                  fillColor: Colors.black,
                  enabledBorder: border,
                  focusedBorder: border,
                ),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: TextButton(
                    onPressed: () {
                      setState(() {
                        result =
                            double.parse(textEditingController.text) * 1000;
                      });
                    },
                    style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.black),
                        foregroundColor: MaterialStatePropertyAll(Colors.white),
                        minimumSize: MaterialStatePropertyAll(
                            Size(double.infinity, 50))),
                    child: const Text('Convert')),
              )
            ],
          ),
        )));
  }
}
