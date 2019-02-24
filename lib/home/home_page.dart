import 'package:flutter/material.dart';
import 'package:flutter_weixin/home/constants.dart';
import 'conversation_page.dart';
import 'contacts_pager.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

enum ActionItem {
  GROUP_CHAT,
  ADD_FRIEND,
  QR_SCAN,
  PAYMENT,
  HELP
}

class NavigationItemView {
  final BottomNavigationBarItem item;

  NavigationItemView({Key key, String title, IconData icon, Color color, IconData selectedIcon}):
        item = new BottomNavigationBarItem(
            icon: Icon(icon,
//              color: Color(AppColors.TabIconNormal),
            ),
            activeIcon: Icon(selectedIcon,
//              color: Color(AppColors.TabIconSelectedColor),
            ),
            title: Text(title, style: TextStyle(
              fontSize: 14.0,
//              color: Color(AppColors.TabIconNormal)
            )),
            backgroundColor: Colors.white);
}

class _HomePageState extends State<HomePage> {
  PageController _pageController;
  List<Widget> _pages;
  List<NavigationItemView> _navigationItemViews;
  int _currentSelectIndex = 0;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentSelectIndex);
    _pages = [
      ConversationPage(),
      ContactsPager(),
      Container(color: Colors.blue),
      Container(color: Colors.yellow)
    ];
    _navigationItemViews = [
      NavigationItemView(
        title: '微信',
        icon: IconData(
            0xe627,
            fontFamily: AppColorFonts.IconFontFamily,
        ),
        selectedIcon: IconData(
            0xe631,
            fontFamily: AppColorFonts.IconFontFamily,
        ),
      ),

      NavigationItemView(
        title: '通讯录',
        icon: IconData(
            0xe655,
            fontFamily: AppColorFonts.IconFontFamily,
        ),
        selectedIcon: IconData(
            0xe6c2,
            fontFamily: AppColorFonts.IconFontFamily,
        ),
      ),

      NavigationItemView(
        title: '发现',
        icon: IconData(
            0xe618,
            fontFamily: AppColorFonts.IconFontFamily,
        ),
        selectedIcon: IconData(
            0xe600,
            fontFamily: AppColorFonts.IconFontFamily,
        ),
      ),

      NavigationItemView(
        title: '我',
        icon: IconData(
            0xe60d,
            fontFamily: AppColorFonts.IconFontFamily,
        ),
        selectedIcon: IconData(
            0xe608,
            fontFamily: AppColorFonts.IconFontFamily,
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
        fixedColor: const Color(AppColors.TabIconSelectedColor),
        currentIndex: _currentSelectIndex,
        onTap: (int index){
          setState(() {
            _currentSelectIndex = index;
            _pageController.animateToPage(
                _currentSelectIndex
                , duration: Duration(microseconds: 200)
                , curve: Curves.easeInOut);
          });
        },
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('微信'),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(IconData(
              0xe62b,
              fontFamily: AppColorFonts.IconFontFamily,
            ),
              size: 22.0,
            ),
            onPressed: () {
            },
          ),
          Container(width: 15.0),
          PopupMenuButton(
            itemBuilder:(BuildContext context) {
              return <PopupMenuItem<ActionItem>>[
                PopupMenuItem(
                  child: _buildPopupMenuItem(0xe627, '添加朋友'),
                  value: ActionItem.ADD_FRIEND,
                ),
                PopupMenuItem(
                  child: _buildPopupMenuItem(0xe617, '发起群聊'),
                  value: ActionItem.GROUP_CHAT,
                ),
                PopupMenuItem(
                  child: _buildPopupMenuItem(0xe62d, '扫一扫'),
                  value: ActionItem.QR_SCAN,
                ),
                PopupMenuItem(
                  child: _buildPopupMenuItem(0xe642, '收付款'),
                  value: ActionItem.PAYMENT,
                ),
                PopupMenuItem(
                  child: _buildPopupMenuItem(0xe623, '帮助与反馈'),
                  value: ActionItem.HELP,
                ),
              ];
            },
            icon: Icon(IconData(
                0xe613,
                fontFamily: AppColorFonts.IconFontFamily,
            ),
                size: 22.0,
            ),
            onSelected: (ActionItem selected) {
              print('点击了$selected');
            },
          ),
          Container(width: 10.0),
        ],
        backgroundColor: Color(AppColors.AppBarColor),
      ),
      body: PageView.builder(
        itemBuilder: (BuildContext context, int index) {
          return _pages[index];
        },
        controller: _pageController,
        itemCount: _pages.length,
        onPageChanged: (int index) {
          setState(() {
            _currentSelectIndex = index;
          });
        },
      ),
      bottomNavigationBar: navigationBar,
    );
  }

  _buildPopupMenuItem(int icon, String title) {
    return Row(
      children: <Widget>[
        Icon(IconData(
          icon,
          fontFamily: AppColorFonts.IconFontFamily
        ),
        size: 22.0,
        color: const Color(AppColors.AppbarPopupMenuTextColor),),
        Container(width: 12.0),
        Text(
          title,
          style: TextStyle(color: const Color(AppColors.AppbarPopupMenuTextColor),
          ),
        ),
      ],
    );
  }
}
