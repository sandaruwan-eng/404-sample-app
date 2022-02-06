import 'dart:math';
import 'package:flutter/material.dart';

class CategoryListCard extends StatelessWidget {
  const CategoryListCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, top: 10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        width: 100,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const <Widget>[
              Icon(
                Icons.book,
                size: 20,
                color: Colors.white,
              ),
              Padding(
                padding: EdgeInsets.only(top: 3),
                child: SizedBox(
                    height: 57.0,
                    child: Text(
                      'Delight your users with Flutters built-in beautiful Material Design',
                      style: TextStyle(fontSize: 10, color: Colors.white),
                    )),
              ),
              Icon(
                Icons.add,
                size: 20,
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
