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
  final double _formDistance = 5.0;
  String _currency = 'Rupees';
  TextEditingController distanceController = TextEditingController();
  TextEditingController avgController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  String result = '';

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
              Padding(
                  padding: EdgeInsets.only(
                      top: _formDistance, bottom: _formDistance),
                  child: TextField(
                    controller: distanceController,
                    decoration: InputDecoration(
                        labelText: 'Distance',
                        hintText: "e.g. 124",
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                    keyboardType: TextInputType.number,
                  )),
              Padding(
                  padding: EdgeInsets.only(
                      top: _formDistance, bottom: _formDistance),
                  child: TextField(
                    controller: avgController,
                    decoration: InputDecoration(
                        labelText: 'Distance per Unit',
                        hintText: "e.g. 17",
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                    keyboardType: TextInputType.number,
                  )),
              Padding(
                  padding: EdgeInsets.only(
                      top: _formDistance, bottom: _formDistance),
                  child: Row(children: [
                    Expanded(
                        child: TextField(
                      controller: priceController,
                      decoration: InputDecoration(
                          labelText: 'Price',
                          hintText: "e.g. 1.65",
                          labelStyle: textStyle,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                      keyboardType: TextInputType.number,
                    )),
                    Container(
                      width: _formDistance * 5,
                    ),
                    Expanded(
                        child: DropdownButton<String>(
                            items: _currencies.map((String value) {
                              return DropdownMenuItem<String>(
                                  value: value, child: Text(value));
                            }).toList(),
                            value: _currency,
                            onChanged: (value) {
                              _onDropDownChanged(value!);
                            }))
                  ])),
              Row(
                children: <Widget>[
                  Expanded(
                      child: RaisedButton(
                          color: Theme.of(context).primaryColorDark,
                          textColor: Theme.of(context).primaryColorLight,
                          child: const Text(
                            'Submit',
                            textScaleFactor: 1.5,
                          ),
                          onPressed: () {
                            setState(() {
                              result = _calculate();
                            });
                          })),
                  Expanded(
                      child: RaisedButton(
                          color: Theme.of(context).buttonColor,
                          textColor: Theme.of(context).primaryColorDark,
                          child: const Text(
                            'Reset',
                            textScaleFactor: 1.5,
                          ),
                          onPressed: () {
                            setState(() {
                              result = _reset();
                            });
                          })),
                ],
              ),
              Text(result),
            ],
          ),
        ));
  }

  void _onDropDownChanged(String value) {
    setState(() {
      _currency = value;
    });
  }

  String _calculate() {
    double _distance = double.parse(distanceController.text);
    double _fuelcost = double.parse(priceController.text);
    double _consuption = double.parse(avgController.text);
    double _totalCost = _distance / _consuption * _fuelcost;
    String _result = 'The total cost of your trip is ' +
        _totalCost.toStringAsFixed(2) +
        ' ' +
        _currency;
    return _result;
  }

  String _reset() {
    distanceController.text = '';
    avgController.text = '';
    priceController.text = '';
    setState(() {
      result = '';
    });
    return result;
  }
}
