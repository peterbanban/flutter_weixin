import 'package:flutter/material.dart';
import 'constants.dart' show AppSizes, AppColors, AppStyles;
import 'package:flutter_weixin/model/conversation_bean.dart' show ConversationBean, ConversationPageData, Device;

class _ConversationItem extends StatelessWidget {
  const _ConversationItem({Key key, this.conversationBean})
      : assert (conversationBean != null),
        super(key: key);
  final ConversationBean conversationBean;
  
  @override
  Widget build(BuildContext context) {

    //头像
    Widget avatar;
    if(conversationBean.isAvatarFromNet()){
      avatar = Image.network(
          conversationBean.avatar,
          width: AppSizes.ConversationAvatarSize,
          height: AppSizes.ConversationAvatarSize);
    } else{
      avatar = Image.asset(
          conversationBean.avatar,
          width: AppSizes.ConversationAvatarSize,
          height: AppSizes.ConversationAvatarSize);
    }

    Widget avatarContainer;
    if (conversationBean.unReadMsgCount > 0) {
      // 未读消息角标
      Widget unReadMsgCountText = Container(
        alignment: Alignment.center,
        width: AppSizes.UnReadMsgNotifyDotSize,
        height: AppSizes.UnReadMsgNotifyDotSize,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
              AppSizes.UnReadMsgNotifyDotSize / 2.0),
          color: Color(AppColors.NotifyDotBg),
        ),
        child: Text(conversationBean.unReadMsgCount.toString(),
            style: AppStyles.UnReadMsgCountDotStyle),
      );

      // 头像容器
      avatarContainer = Stack( // 堆栈式布局，类似absoluteLayout
        overflow: Overflow.visible,
        children: <Widget>[
          avatar,
          Positioned( // 不设置默认左上角，设置为0，0 为右上角，此后正值表示左/下移动。负值表示右/上移动
            right: -6.0,
            top: -6.0,
            child: unReadMsgCountText,
          )
        ],
      );
    } else {
      avatarContainer = avatar;
    }

    return Container (
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(     // 声明了Decoration后color需要写在里面而不能写在外面
          color: Color(AppColors.ConversationItemBg),
          border: Border(
            bottom: BorderSide(
                color: Color(AppColors.DividerColor),
                width: AppSizes.DividerWidth
            ),
          )
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          avatarContainer,
          Container(width: 10.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(conversationBean.title, style: AppStyles.TitleStyle),
                Container(height: 5.0),
                Text(conversationBean.des, style: AppStyles.DesStyle)
              ],
            ),
          ),
          Container(width: 10.0),
          Column(
            children: <Widget>[
              Text(conversationBean.updateAt, style: AppStyles.DesStyle),
              Container(height: 10.0),
              Image.asset(
                  'assets/images/ic_silent.png',
                  width: AppSizes.MuteSize,
                  color: conversationBean.isMute ? Color(AppColors.muteBg) : Colors.transparent
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _DeviceInfoItem extends StatelessWidget {
  final Device device;
  const _DeviceInfoItem({
    this.device
  }) : assert(device != null);

  String get iconName {    // get 方法不需要括号
    return device == Device.WIN ? 'assets/images/ic_windows.png' : 'assets/images/ic_mac.png';
  }

  String get deviceName {
    return device == Device.WIN ? 'Wndows' : 'MAC';
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.only(left: 24.0, top: 10.0, right: 24.0, bottom: 10.0),
      decoration: BoxDecoration(
        color: Color(AppColors.otherDeviceItemBg),
        border: Border(
          bottom: BorderSide(
            width: AppSizes.DividerWidth,
            color: Color(AppColors.DividerColor)
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(iconName,
            width: 24.0,
            color: Color(AppColors.otherDeviceItemIconColor),
          ),
          SizedBox(width: 16.0),
          Text(deviceName + " 微信已登录，手机通知已关闭", style: AppStyles.OtherDeviceInfoItemStyle)
        ],
      ),
    );
  }

}

class ConversationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ConversationPageState();
  }

}

class _ConversationPageState extends State<ConversationPage>{
  final ConversationPageData data = ConversationPageData.mock();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          if (data.device != null){
            if (index == 0) {
              return _DeviceInfoItem(device: data.device);
            }
            return _ConversationItem(conversationBean: data.conversations[index - 1]);
          }else {
            return _ConversationItem(conversationBean: data.conversations[index]);
          }
        },
      itemCount: data.device != null ? data.conversations.length + 1 : data.conversations.length,
    );
  }

}