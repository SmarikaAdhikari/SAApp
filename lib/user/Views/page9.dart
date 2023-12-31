
import 'package:flutter/material.dart';


class PageNine extends StatefulWidget {
  const PageNine({super.key});

  @override
  State<PageNine> createState() => _PageNineState();
}

class _PageNineState extends State<PageNine> {
  List<String> items = [
    ' 1',
    ' 2',
    ' 3',
  ];
  // bool _isChecked = false;
  bool _isCheckedValue1 = false;
  bool _isCheckedValue2 = false;
  bool _isCheckedValue3 = false;
  bool _isCheckedValue4 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ListView(
            padding: const EdgeInsets.all(8.0),
            children: items
                .map(
                  (text) => Column(
                    children: [
                      Card(
                        child: CheckboxListTile(
                            title: const Text("Book 1 is done reading"),
                            value: _isCheckedValue1,
                            onChanged: (value) {
                              if (value != null) {
                                setState(() {
                                  _isCheckedValue1 = value;
                                });
                              } else {
                                setState(() {
                                  _isCheckedValue1 = false;
                                });
                              }
                            }),
                      ),
                      Card(
                        child: CheckboxListTile(
                            title: const Text("Book 2 is done reading"),
                            value: _isCheckedValue2,
                            onChanged: (value) {
                              if (value != null) {
                                setState(() {
                                  _isCheckedValue2 = value;
                                });
                              } else {
                                setState(() {
                                  _isCheckedValue2 = false;
                                });
                              }
                            }),
                      ),
                      Card(
                        child: CheckboxListTile(
                            title: const Text("Book 3 is done reading"),
                            value: _isCheckedValue3,
                            onChanged: (value) {
                              if (value != null) {
                                setState(() {
                                  _isCheckedValue3 = value;
                                });
                              } else {
                                setState(() {
                                  _isCheckedValue3 = false;
                                });
                              }
                            }),
                      ),
                      Card(
                        child: CheckboxListTile(
                            title: const Text("Book 4 is done reading"),
                            value: _isCheckedValue4,
                            onChanged: (value) {
                              if (value != null) {
                                setState(() {
                                  _isCheckedValue4 = value;
                                });
                              } else {
                                setState(() {
                                  _isCheckedValue4 = false;
                                });
                              }
                            }),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          final snackBar = SnackBar(
                            content: const Text('Yay! A SnackBar!'),
                            action: SnackBarAction(
                              label: 'Undo',
                              onPressed: () {},
                            ),
                          );

                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
                        child: const Text('Show SnackBar'),
                      ),
                    ],
                  ),
                )
                .toList()));
  }
}
