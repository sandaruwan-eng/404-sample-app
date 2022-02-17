import 'dart:math';
import 'package:flutter/material.dart';
import 'package:sampleapp/constant/widgets_constant.dart';

class CategoryListCard extends StatelessWidget {
  const CategoryListCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _appTheme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.only(
          left: 30 * WidgetsConstant.width, top: 10.0 * WidgetsConstant.height),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        width: 100 * WidgetsConstant.width,
        child: Padding(
          padding: EdgeInsets.all(8.0 * WidgetsConstant.width),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Icon(
                Icons.book,
                size: 20,
                color: Colors.white,
              ),
              Padding(
                padding: EdgeInsets.only(top: 3 * WidgetsConstant.height),
                child: SizedBox(
                    height: 57.0 * WidgetsConstant.height,
                    child: Text(
                      'Delight your users with Flutters built-in beautiful Material Design',
                      style: _appTheme.textTheme.overline!.merge(
                        const TextStyle(color: Colors.white),
                      ),
                    )),
              ),
              const Icon(
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
