// import 'package:app/api/api_model.dart';
import 'package:app/widgets/genrelist.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

class Pagetwo extends StatefulWidget {
  const Pagetwo({super.key});
  // Books data;

  @override
  State<Pagetwo> createState() => _PagetwoState();
}

class _PagetwoState extends State<Pagetwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(right: 8, left: 8),
        child: ListView.builder(
          itemBuilder: (context, position) {
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: GenreList(
                    // data: data,
                    ),
              ),
            );
          },
          itemCount: 15,
        ),
      ),
    );
  }
}
