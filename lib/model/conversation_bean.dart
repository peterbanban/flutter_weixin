import 'package:flutter/material.dart';
import 'package:flutter_weixin/home/constants.dart';

enum Device {
  MAC, WIN
}

class ConversationBean {
  const ConversationBean(
      {@required this.avatar,
      @required this.title,
      @required this.updateAt,
      this.des,
      this.titleColor: AppColors.TitleTextColor,
      this.isMute: false,
      this.unReadMsgCount: 0,
      this.displayDot: false})
      : assert(avatar != null),
        assert(title != null),
        assert(updateAt != null);

  final String avatar;
  final String title;
  final int titleColor;
  final String des;
  final String updateAt;
  final bool isMute;
  final int unReadMsgCount;
  final bool displayDot;

  bool isAvatarFromNet() {
    if(this.avatar.indexOf('http') == 0 ||
      this.avatar.indexOf('https') == 0) {
      return true;
    }
    return false;
  }

}

const List<ConversationBean> mockConversations = [
  const ConversationBean(
    avatar: 'assets/images/ic_file_transfer.png',
    title: '文件传输助手',
    des: '',
    updateAt: '19:56',
  ),
  const ConversationBean(
    avatar: 'assets/images/ic_tx_news.png',
    title: '腾讯新闻',
    des: '我这的新闻都是吹牛逼的，要看还得下载腾讯新闻客户端',
    updateAt: '17:20',
    isMute: true,
  ),
  const ConversationBean(
    avatar: 'assets/images/ic_wx_games.png',
    title: '微信游戏',
    titleColor: 0xff586b95,
    des: '下载游戏都要去TapTap哦！',
    updateAt: '17:12',
    isMute: true,
  ),
  const ConversationBean(
    avatar: 'https://randomuser.me/api/portraits/men/10.jpg',
    title: '汤姆丁',
    des: '今晚要一起去吃肯德基吗？',
    updateAt: '17:56',
    isMute: true,
    unReadMsgCount: 1,
  ),
  const ConversationBean(
    avatar: 'https://randomuser.me/api/portraits/women/10.jpg',
    title: 'Tina Morgan',
    des: '晚自习是什么来着？你知道吗，看到的话赶紧回复我',
    updateAt: '17:58',
    isMute: false,
    unReadMsgCount: 3,
  ),
  const ConversationBean(
    avatar: 'assets/images/ic_fengchao.png',
    title: '蜂巢智能柜',
    titleColor: 0xff586b95,
    des: '你有一个快递在门口快递柜等着你',
    updateAt: '17:12',
  ),

  const ConversationBean(
    avatar: 'https://www.randomuser.me/portraits/women/1.jpg',
    title: 'YunYun',
    updateAt: '昨天',
    isMute: false,
    des: "吃饭了吗",
    unReadMsgCount: 1,
  ),
  const ConversationBean(
    avatar: 'https://www.randomuser.me/portraits/women/2.jpg',
    title: 'Lily',
    updateAt: '昨天',
    isMute: false,
    des: "约会去",
    unReadMsgCount: 1,
  ),
  const ConversationBean(
    avatar: 'https://www.randomuser.me/portraits/women/3.jpg',
    title: 'Harry',
    updateAt: '昨天',
    isMute: false,
    des: "吃饭了吗",
    unReadMsgCount: 0,
  ),
  const ConversationBean(
    avatar: 'https://www.randomuser.me/portraits/women/4.jpg',
    title: 'Floower',
    updateAt: '昨天',
    isMute: false,
    des: "想你了 宝贝",
    unReadMsgCount: 0,
  ),
  const ConversationBean(
    avatar: 'https://www.randomuser.me/portraits/women/5.jpg',
    title: 'Lily',
    updateAt: '昨天',
    isMute: false,
    des: "在干嘛",
    unReadMsgCount: 10,
  ),
  const ConversationBean(
    avatar: 'https://www.randomuser.me/portraits/women/6.jpg',
    title: 'Hory',
    updateAt: '昨天',
    isMute: false,
    des: "起来嗨",
    unReadMsgCount: 2,
  ),
  const ConversationBean(
    avatar: 'https://www.randomuser.me/portraits/women/7.jpg',
    title: 'Love',
    updateAt: '昨天',
    isMute: false,
    des: "哈哈哈哈哈哈哈哈哈",
    unReadMsgCount: 0,
  ),
  const ConversationBean(
    avatar: 'https://www.randomuser.me/portraits/women/8.jpg',
    title: 'Laugh',
    updateAt: '昨天',
    isMute: false,
    des: "呵呵呵呵呵呵呵呵呵呵",
    unReadMsgCount: 1,
  ),
  const ConversationBean(
    avatar: 'https://www.randomuser.me/portraits/women/9.jpg',
    title: 'Lily',
    updateAt: '昨天',
    isMute: false,
    des: "嘿嘿嘿嘿嘿嘿嘿",
    unReadMsgCount: 0,
  ),
  const ConversationBean(
    avatar: 'https://www.randomuser.me/portraits/women/10.jpg',
    title: 'Lily',
    updateAt: '昨天',
    isMute: false,
    des: "吃饭了吗",
    unReadMsgCount: 1,
  ),
  const ConversationBean(
    avatar: 'https://www.randomuser.me/portraits/men/1.jpg',
    title: 'Linken',
    updateAt: '昨天',
    isMute: false,
    des: "。。。。。。。。。",
    unReadMsgCount: 0,
  ),
  const ConversationBean(
    avatar: 'https://www.randomuser.me/portraits/men/2.jpg',
    title: 'Dawei',
    updateAt: '昨天',
    isMute: false,
    des: "吃饭了吗",
    unReadMsgCount: 0,
  ),
  const ConversationBean(
    avatar: 'https://www.randomuser.me/portraits/men/3.jpg',
    title: 'Jack',
    updateAt: '昨天',
    isMute: false,
    des: "吃饭了吗",
    unReadMsgCount: 0,
  ),
  const ConversationBean(
    avatar: 'https://www.randomuser.me/portraits/men/4.jpg',
    title: 'Tomo',
    updateAt: '昨天',
    isMute: false,
    des: "打球去",
    unReadMsgCount: 0,
  ),
  const ConversationBean(
    avatar: 'https://www.randomuser.me/portraits/men/5.jpg',
    title: 'Row',
    updateAt: '昨天',
    isMute: false,
    des: "打球去",
    unReadMsgCount: 0,
  ),
  const ConversationBean(
    avatar: 'https://www.randomuser.me/portraits/men/6.jpg',
    title: 'Huha',
    updateAt: '昨天',
    isMute: false,
    des: "打球去",
    unReadMsgCount: 0,
  ),
  const ConversationBean(
    avatar: 'https://www.randomuser.me/portraits/men/7.jpg',
    title: 'Lily',
    updateAt: '昨天',
    isMute: false,
    des: "打球去",
    unReadMsgCount: 0,
  ),
  const ConversationBean(
    avatar: 'https://www.randomuser.me/portraits/men/8.jpg',
    title: 'Lily',
    updateAt: '昨天',
    isMute: false,
    des: "打球去",
    unReadMsgCount: 0,
  ),
  const ConversationBean(
    avatar: 'https://www.randomuser.me/portraits/men/9.jpg',
    title: 'Lily',
    updateAt: '昨天',
    isMute: false,
    des: "打球去",
    unReadMsgCount: 0,
  ),
  const ConversationBean(
    avatar: 'https://www.randomuser.me/portraits/men/10.jpg',
    title: 'XiaoMing',
    updateAt: '昨天',
    isMute: false,
    des: "打球去",
    unReadMsgCount: 0,
  ),
];

const mockConversationData = {
  'deviceInfo' : Device.MAC,
  'conversations' : mockConversations
};

class ConversationPageData {
  const ConversationPageData({
    this.device,
    this.conversations
});
  final Device device;
  final List<ConversationBean> conversations;

  static mock(){
    return ConversationPageData(device: Device.MAC, conversations: mockConversations);
  }
}