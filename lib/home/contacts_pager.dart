import 'package:flutter/material.dart';
import 'package:flutter_weixin/home/constants.dart';
import 'package:flutter_weixin/model/contacts_bean.dart'
    show ContactsPageData, ContactsBean;

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
            padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 10.0, bottom: 10.0),
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
          padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 10.0, bottom: 10.0),
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

    return Container(
        child: Container(
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      width: AppSizes.DividerWidth,
                      color: Color(AppColors.DividerColor)))),
          child: _contactItemContent
        ));
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
    return ListView.builder(
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
        });
  }
}
