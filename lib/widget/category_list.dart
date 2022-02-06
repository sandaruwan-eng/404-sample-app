import 'package:flutter/material.dart';
import 'package:sampleapp/widget/widget.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 30.0),
            child: Text(
              'Category',
              style: TextStyle(color: Colors.white, fontSize: 19.0),
            ),
          ),
          SizedBox(
            height: 130,
            child: Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 15,
                  itemBuilder: (BuildContext context, int index) =>
                      const CategoryListCard()),
            ),
          ),
        ],
      ),
    );
  }
}
