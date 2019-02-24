import 'package:meta/meta.dart';
//enum ContactsType{
//  FUNCTION,
//  ENTERPRISE,
//  PERSONAL,
//}

class ContactsBean {
  const ContactsBean({
    @required this.avatar,
    @required this.name,
    this.nameIndex});

  final String avatar;
  final String name;
  final String nameIndex;
}

class ContactsPageData {
  final List<ContactsBean> functionContactsBean = [
    const ContactsBean(
      avatar: 'assets/images/ic_new_friend.png',
      name: '新的朋友',
    ),
    const ContactsBean(
      avatar: 'assets/images/ic_group_chat.png',
      name: '群聊',
    ),
    const ContactsBean(
      avatar: 'assets/images/ic_tag.png',
      name: '标签',
    ),
    const ContactsBean(
      avatar: 'assets/images/ic_public_account.png',
      name: '公众号',
    ),
  ];

  final List<ContactsBean> contactsBeans = [
    const ContactsBean(
      avatar: 'https://randomuser.me/api/portraits/men/53.jpg',
      name: 'Maurice Sutton',
      nameIndex: 'M',
    ),
    const ContactsBean(
      avatar: 'https://randomuser.me/api/portraits/women/76.jpg',
      name: 'Jerry',
      nameIndex: 'J',
    ),
    const ContactsBean(
      avatar: 'https://randomuser.me/api/portraits/women/17.jpg',
      name: 'Dangdang',
      nameIndex: 'D',
    ),
    const ContactsBean(
      avatar: 'https://randomuser.me/api/portraits/women/55.jpg',
      name: 'Teddy',
      nameIndex: 'T',
    ),
    const ContactsBean(
      avatar: 'https://randomuser.me/api/portraits/women/11.jpg',
      name: 'Steave',
      nameIndex: 'S',
    ),
    const ContactsBean(
      avatar: 'https://randomuser.me/api/portraits/women/65.jpg',
      name: 'Vivian',
      nameIndex: 'V',
    ),
    const ContactsBean(
      avatar: 'https://randomuser.me/api/portraits/women/50.jpg',
      name: 'Mary',
      nameIndex: 'M',
    ),
    const ContactsBean(
      avatar: 'https://randomuser.me/api/portraits/women/91.jpg',
      name: 'David',
      nameIndex: 'D',
    ),
    const ContactsBean(
      avatar: 'https://randomuser.me/api/portraits/women/60.jpg',
      name: 'Bob',
      nameIndex: 'B',
    ),
    const ContactsBean(
      avatar: 'https://randomuser.me/api/portraits/men/60.jpg',
      name: 'Jeff Green',
      nameIndex: 'J',
    ),
    const ContactsBean(
      avatar: 'https://randomuser.me/api/portraits/men/45.jpg',
      name: 'Adam',
      nameIndex: 'A',
    ),
    const ContactsBean(
      avatar: 'https://randomuser.me/api/portraits/men/7.jpg',
      name: 'Michel',
      nameIndex: 'M',
    ),
    const ContactsBean(
      avatar: 'https://randomuser.me/api/portraits/men/35.jpg',
      name: 'Green',
      nameIndex: 'G',
    ),
    const ContactsBean(
      avatar: 'https://randomuser.me/api/portraits/men/64.jpg',
      name: 'Jack Ma',
      nameIndex: 'J',
    ),
    const ContactsBean(
      avatar: 'https://randomuser.me/api/portraits/men/86.jpg',
      name: 'Tom',
      nameIndex: 'T',
    ),
    const ContactsBean(
      avatar: 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1537868900176&di=ddbe94a75a3cc33f880a5f3f675b8acd&imgtype=0&src=http%3A%2F%2Fs2.sinaimg.cn%2Fmw690%2F003wRTwMty6IGZWzd2p31',
      name: '张伟',
      nameIndex: 'Z',
    ),
    const ContactsBean(
      avatar: 'https://timgsa.baidu.com/timg?image&quality=80&size=b10000_10000&sec=1537858866&di=fe35e4465c73122f14e1c9475dd68e47&src=http://a2.att.hudong.com/63/26/01300001128119143503262347361.jpg',
      name: '张益达',
      nameIndex: 'Z',
    ),
  ];

  static ContactsPageData mock() {
    return ContactsPageData();
  }
}
