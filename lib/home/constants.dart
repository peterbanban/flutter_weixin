import 'package:flutter/material.dart';
class AppColors {
  static const AppBarColor = 0xff303030;
  static const TabIconNormal = 0xff999999;
  static const TabIconSelectedColor = 0xff46c11b;
  static const AppbarPopupMenuTextColor = 0xffffffff;
  static const TitleTextColor = 0xff353535;
  static const ConversationItemBg = 0xffffffff;
  static const DesTextColor = 0xff9e9e9e;
  static const DividerColor = 0xffd9d9d9;
  static const NotifyDotBg = 0xffff3e3e;
  static const NotifyDotText = 0xfff5f5f5;
  static const muteBg = 0xffd8d8d8;
  static const otherDeviceItemBg = 0xfff5f5f5;
  static const otherDeviceItemTextColor = 0xff606062;
  static const otherDeviceItemIconColor = 0xff606062;
  static const ContactItemNameTextColor = 0xff888888;
  static const ContactGroupBg = 0xffebebeb;
}

class AppStyles {
  static const TitleStyle = TextStyle(
    fontSize: 14.0,
    color: Color(AppColors.TitleTextColor),
  );

  static const DesStyle = TextStyle(
    fontSize: 12.0,
    color: Color(AppColors.DesTextColor),
  );

  static const UnReadMsgCountDotStyle = TextStyle(
    fontSize: 12.0,
    color: Color(AppColors.NotifyDotText)
  );

  static const OtherDeviceInfoItemStyle = TextStyle(
    fontSize: 13.0,
    color: Color(AppColors.otherDeviceItemTextColor)
  );

  static const ContactItemTextStyle = TextStyle(
      fontSize: 14.0,
      color: Color(AppColors.ContactItemNameTextColor)
  );
}

class AppSizes{
  static const ConversationAvatarSize = 48.0;
  static const DividerWidth = 0.5;
  static const UnReadMsgNotifyDotSize = 20.0;
  static const MuteSize = 18.0;
  static const OtherDeviceInfoItemHeight = 18.0;
  static const ContactAvatarSize = 36.0;
}

class AppColorFonts {
  static const IconFontFamily = 'appIconFont';
}