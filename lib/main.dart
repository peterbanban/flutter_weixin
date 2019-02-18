import 'package:flutter/material.dart';
import './home/home_page.dart';
import './home/constants.dart' show AppConstants;

void main() => runApp(MaterialApp(
  title: '微信',
  theme: ThemeData.light().copyWith(
    primaryColor: Color(AppConstants.AppBarColor),
    cardColor: Color(AppConstants.AppBarColor)
  ),
  home: HomePage(),
));