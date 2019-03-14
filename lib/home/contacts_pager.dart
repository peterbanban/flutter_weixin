import 'package:flutter/material.dart';
import 'package:flutter_weixin/home/constants.dart';
import 'package:flutter_weixin/model/contacts_bean.dart'
    show ContactsPageData, ContactsBean;

const INDEX_BAR_WORDS = [
  "%" , "*",
  "A", "B", "C", "D", "E", "F", "G",
  "H", "I", "J", "K", "L", "M", "N",
  "O", "P", "Q", "R", "S", "T", "U",
  "V", "W", "X", "Y", "Z"
];

class _ContactItem extends StatelessWidget {
  _ContactItem({
    @required this.contactsBean,
    this.onPressed,
    this.isGroupTitle
  });

  final ContactsBean contactsBean;
  final VoidCallback onPressed;
  final bool isGroupTitle;
  final BUTTON_HEIGHT = 48.0;
  static const MARGIN_VERTICAL = 10.0;
  static const GROUP_TITLE_HEIGHT = 24.0;

  static double getHeight(bool hasGroupTitle){
    final _buttonHeight = MARGIN_VERTICAL * 2
        + AppSizes.DividerWidth
        + AppSizes.ContactAvatarSize;
    if (hasGroupTitle) {
      return _buttonHeight + GROUP_TITLE_HEIGHT;
    }
    return _buttonHeight;
  }

  @override
  Widget build(BuildContext context) {
    Widget _contactItemContent;

    if (isGroupTitle) {
      _contactItemContent = Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 16.0, top: 4.0, bottom: 4.0),
            color: Color(AppColors.ContactGroupBg),
            child: Text(contactsBean.nameIndex, style: AppStyles.ContactItemTextStyle)
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16.0),
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: !isGroupTitle ? Color(AppColors.DividerColor) : Colors.transparent,
                  width: AppSizes.DividerWidth,
                )
              )
            ),
            child: Row(
              children: <Widget>[
                contactsBean.avatar.contains('http') ||
                    contactsBean.avatar.contains('https') ?
                Image.network(
                  contactsBean.avatar,
                  width: AppSizes.ContactAvatarSize,
                ) :
                Image.asset(
                  contactsBean.avatar, width: AppSizes.ContactAvatarSize,
                ),
                SizedBox(width: 10.0),
                Text(contactsBean.name)
              ],
            ),
          ),
        ],
      );
    } else {
      _contactItemContent = Container(
          margin: const EdgeInsets.symmetric(horizontal: 16.0),
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                width: AppSizes.DividerWidth,
                color: Color(AppColors.DividerColor)
              )
            )
          ),
          child: Row(
            children: <Widget>[
              contactsBean.avatar.contains('http') ||
                  contactsBean.avatar.contains('https') ?
              Image.network(
                contactsBean.avatar,
                width: AppSizes.ContactAvatarSize,
              ) :
              Image.asset(
                contactsBean.avatar, width: AppSizes.ContactAvatarSize,
              ),
              SizedBox(width: 10.0),
              Text(contactsBean.name)
            ],
          )
      );
    }

    return _contactItemContent;
  }
}

class ContactsPager extends StatefulWidget {
  Color _indexBarBg = Colors.transparent;

  @override
  State<StatefulWidget> createState() {
    return _ContactsPageState();
  }
}

class _ContactsPageState extends State<ContactsPager> {
  ScrollController _scrollController;
  final ContactsPageData _contactsPageData = ContactsPageData.mock();
  final List<ContactsBean> _contacts = [];
  final Map _letterPosMap = {INDEX_BAR_WORDS[0]:0.0};

  @override
  void initState() {
    super.initState();
    _contacts..addAll(_contactsPageData.contactsBeans)..addAll(
        _contactsPageData.contactsBeans)..addAll(
        _contactsPageData.contactsBeans);
    _contacts.sort((ContactsBean a, ContactsBean b) =>
        a.nameIndex.compareTo(b.nameIndex));
    _contacts.insertAll(0, _contactsPageData.functionContactsBean);
    _scrollController = new ScrollController();
    var _totalPos = _contactsPageData.functionContactsBean.length *
        _ContactItem.getHeight(false);
    for (int i = _contactsPageData.functionContactsBean.length ; i < _contacts.length; i ++) {
      bool _hasGroupTitle = true;
      if (i > 0 && _contacts[i].nameIndex == _contacts[i - 1].nameIndex) {
        _hasGroupTitle = false;
      }
      if (_hasGroupTitle) {
        _letterPosMap[_contacts[i].nameIndex] = _totalPos;
      }
      _totalPos += _ContactItem.getHeight(_hasGroupTitle);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    bool isGroupTitle = false;
    final List<Widget> _letters = INDEX_BAR_WORDS.map((String word) {  // 遍历List并创建匿名方法获取结果集
      return Expanded(
          child: Text(word,
            style: TextStyle(fontSize: 11.0,)
          )
      );
    }).toList();

    return Stack(
        children: <Widget>[
          ListView.builder(
              controller: _scrollController,
              itemCount: _contacts.length,
              itemBuilder: (BuildContext context, int index) {
                if (index == _contactsPageData.functionContactsBean.length) {
                  isGroupTitle = true;
                } else if (index > _contactsPageData.functionContactsBean.length
                    && _contacts[index].nameIndex != _contacts[index - 1].nameIndex
                ) {
                  isGroupTitle = true;
                } else {
                  isGroupTitle = false;
                }
                return _ContactItem(
                  contactsBean: _contacts[index],
                  isGroupTitle: isGroupTitle,
                );;
              }),
          Positioned(
            width: AppSizes.ContactIndexBar,
            right: 0.0,
            top: 10.0,
            bottom: 10.0,
            child: Container(
//              alignment: Alignment.center,
              padding: EdgeInsets.only(top: 10, bottom: 10),
              color: widget._indexBarBg,
                child: GestureDetector(
                  onVerticalDragDown: (DragDownDetails details) {
                    _scrollController.animateTo(_letterPosMap["M"], duration: Duration(milliseconds: 200), curve: Curves.easeIn);
                  },
                  onVerticalDragEnd: (DragEndDetails details) {
                  },
                  onVerticalDragCancel: () {
                  },
                  child: Column(
                    children: _letters,
                  ),
                ),
            ),
          )
        ]);
  }
}
