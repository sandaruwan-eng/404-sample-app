import 'package:flutter/material.dart';
import 'package:sampleapp/constant/widgets_constant.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: 70 * WidgetsConstant.height, left: 30 * WidgetsConstant.width),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundColor: Colors.white,
            radius: 22,
            child: CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/images/profile.png'),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.0 * WidgetsConstant.width),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                Text(
                  "Hi,",
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  "Peter Jhon",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 18),
                )
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.only(right: 18.0 * WidgetsConstant.width),
            child: const Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
