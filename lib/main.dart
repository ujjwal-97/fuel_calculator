// ignore_for_file: use_key_in_widget_constructors, deprecated_member_use

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Trip Cost Calculator', home: FuelForm());
  }
}

class FuelForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FuelFormState();
}

class _FuelFormState extends State<FuelForm> {
  final _currencies = ['Dollars', 'Euro', 'Rupees'];
  String _currency = 'Rupees';
  TextEditingController distanceController = TextEditingController();
  String result = "";

  @override
  Widget build(BuildContext context) {
    TextStyle? textStyle = Theme.of(context).textTheme.titleMedium;
    return Scaffold(
        appBar: AppBar(
          title: const Text("Hello"),
          backgroundColor: Colors.blueAccent,
        ),
        body: Container(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: <Widget>[
              TextField(
                controller: distanceController,
                decoration: InputDecoration(
                    labelText: 'Distance',
                    hintText: "e.g. 124",
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
                keyboardType: TextInputType.number,
              ),
              DropdownButton<String>(
                  items: _currencies.map((String value) {
                    return DropdownMenuItem<String>(
                        value: value, child: Text(value));
                  }).toList(),
                  value: _currency,
                  onChanged: (value) {
                    _onDropDownChanged(value!);
                  }),
              RaisedButton(
                  color: Theme.of(context).primaryColorDark,
                  textColor: Theme.of(context).primaryColorLight,
                  child: const Text('Submit'),
                  onPressed: () {
                    setState(() {
                      result = distanceController.text;
                    });
                  }),
              Text(result + " " + _currency),
            ],
          ),
        ));
  }

  void _onDropDownChanged(String value) {
    setState(() {
      _currency = value;
    });
  }
}
