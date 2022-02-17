import 'package:flutter/material.dart';
import 'package:sampleapp/constant/widgets_constant.dart';
import 'package:sampleapp/widget/widget.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20 * WidgetsConstant.height),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 30.0 * WidgetsConstant.width),
            child: const Text(
              'Category',
              style: TextStyle(color: Colors.white, fontSize: 19.0),
            ),
          ),
          SizedBox(
            height: 140 * WidgetsConstant.height,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 15,
                itemBuilder: (BuildContext context, int index) =>
                    const CategoryListCard()),
          ),
        ],
      ),
    );
  }
}
