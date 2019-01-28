import 'package:flutter/material.dart';
import 'package:flutter_weixin/home/constants.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class NavigationItemView {
  final String _title;
  final IconData _icon;
  final IconData _selectIcon;
  final Color _color;
  final BottomNavigationBarItem item;

  NavigationItemView({Key key, String title, IconData icon, Color color, IconData selectedIcon}):
        _title = title,
        _icon = icon,
        _color = color,
        _selectIcon = selectedIcon,
        item = new BottomNavigationBarItem(
            icon: Icon(icon, color: Color(AppConstants.TabIconNormal),),
            activeIcon: Icon(selectedIcon, color: Color(AppConstants.TabIconSelected),),
            title: Text(title, style: TextStyle(
              fontSize: 14.0,
              color: Color(AppConstants.TabIconNormal)
            )),
            backgroundColor: Colors.white);
}

class _HomePageState extends State<HomePage> {
  List<NavigationItemView> _navigationItemViews;

  @override
  void initState() {
    super.initState();

    _navigationItemViews = [
      NavigationItemView(
        title: '微信',
        icon: IconData(
            0xe627,
            fontFamily: AppColorFonts.IconFontFamily
        ),
        selectedIcon: IconData(
            0xe6310,
            fontFamily: AppColorFonts.IconFontFamily
        ),
      ),

      NavigationItemView(
        title: '通讯录',
        icon: IconData(
            0xe655,
            fontFamily: AppColorFonts.IconFontFamily
        ),
        selectedIcon: IconData(
            0xe6c2,
            fontFamily: AppColorFonts.IconFontFamily
        ),
      ),

      NavigationItemView(
        title: '发现',
        icon: IconData(
            0xe618,
            fontFamily: AppColorFonts.IconFontFamily
        ),
        selectedIcon: IconData(
            0xe600,
            fontFamily: AppColorFonts.IconFontFamily
        ),
      ),

      NavigationItemView(
        title: '我',
        icon: IconData(
            0xe60d,
            fontFamily: AppColorFonts.IconFontFamily
        ),
        selectedIcon: IconData(
            0xe608,
            fontFamily: AppColorFonts.IconFontFamily
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBar navigationBar = BottomNavigationBar(
        items: _navigationItemViews.map((NavigationItemView view){
          return view.item;
        }).toList(),
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        onTap: (int index){

        },
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('微信'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              print("点击了搜索按钮");
            },
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              print("显示下拉列表");
            },
          ),
        ],
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.white,
      ),
      bottomNavigationBar: navigationBar,
    );
  }
}
