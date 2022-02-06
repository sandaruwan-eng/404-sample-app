import 'package:flutter/material.dart';
import 'package:sampleapp/style_guide/colors.dart';
import 'package:sampleapp/widget/widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          Profile(),
          SearchBar(),
          CategoryList(),
          BottomPart(),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: floatingActionButtonColor,
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(
          Icons.add,
          size: 35,
        ),
      ),
    );
  }
}
