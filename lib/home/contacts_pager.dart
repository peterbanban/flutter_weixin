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
  _ContactItem({this.contactsBean, this.onPressed, this.isGroupTitle});

  final ContactsBean contactsBean;
  final VoidCallback onPressed;
  final bool isGroupTitle;

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
  @override
  State<StatefulWidget> createState() {
    return _ContactsPageState();
  }
}

class _ContactsPageState extends State<ContactsPager> {
  final ContactsPageData _contactsPageData = ContactsPageData.mock();
  final List<ContactsBean> _contacts = [];

  @override
  void initState() {
    super.initState();
    _contacts
      ..addAll(_contactsPageData.contactsBeans)
      ..addAll(_contactsPageData.contactsBeans)
      ..addAll(_contactsPageData.contactsBeans);
    _contacts.sort((ContactsBean a, ContactsBean b) => a.nameIndex.compareTo(b.nameIndex));
    _contacts.insertAll(0, _contactsPageData.functionContactsBean);
  }

  @override
  Widget build(BuildContext context) {
    bool isGroupTitle = false;
    final List<Widget> _letters = INDEX_BAR_WORDS.map((String word) {  // 遍历List并创建匿名方法获取结果集
      return Expanded(child: Text(word));
    }).toList();

    return Stack(
        children: <Widget>[
          ListView.builder(
              itemCount: _contacts.length,
              itemBuilder: (BuildContext context, int index) {
                if (index == _contactsPageData.functionContactsBean.length) {
                  isGroupTitle = true;
                } else if (index > _contactsPageData.functionContactsBean.length
                    &&
                    _contacts[index].nameIndex != _contacts[index - 1].nameIndex
                ) {
                  isGroupTitle = true;
                } else {
                  isGroupTitle = false;
                }

                if (index < _contactsPageData.functionContactsBean.length) {
                  return _ContactItem(
                    contactsBean: _contacts[index],
                    isGroupTitle: isGroupTitle,
                  );
                } else {
                  return _ContactItem(
                    contactsBean: _contacts[index],
                    isGroupTitle: isGroupTitle,
                  );
                }
              }),
          Positioned(
            width: AppSizes.ContactIndexBar,
            right: 0.0,
            top: 0.0,
            bottom: 0.0,
            child: Container(
              child: Column(
                children: _letters,
              ),
            ),
          )
        ]);
  }
}
