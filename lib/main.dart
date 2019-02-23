import 'package:flutter/material.dart';
import './home/home_page.dart';
import './home/constants.dart' show AppColors;

void main() => runApp(MaterialApp(
  title: '微信',
  theme: ThemeData.light().copyWith(
    primaryColor: Color(AppColors.AppBarColor),
    cardColor: Color(AppColors.AppBarColor)
  ),
  home: HomePage(),
));