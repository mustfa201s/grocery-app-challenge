import 'package:challenges/core/resources/manager_colors.dart';
import 'package:challenges/core/resources/manager_styles.dart';
import 'package:flutter/material.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ManagerColors.transparent,
      body: Center(
        child: Text(
          'User Screen',
          style: getRegularTextStyle(
              fontSize: 22,
              color: ManagerColors.lightGreyColor
          ),
        ),
      ),
    );
  }
}
