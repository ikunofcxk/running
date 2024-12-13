
import MessageData from './MessageData';

class MessageViewModel {
  // 示例消息数据
    messageList: Array<MessageData> = [
    new MessageData(1,'系统通知',$r('app.media.menu'),'您的账号安全级别提升成功。', '2024-12-15 10:00',true),
    new MessageData(2,'你家咯咯',$r('app.media.chicken'),'你还有没树枝了', '2024-12-15 19:00',true),
    new MessageData(3,'ikun',$r('app.media.chicken'),'你们毁了他的医生！', '2024-12-16 17:00',false)
  // ...更多消息数据
  ];

  // 获取消息列表数据的方法
  public getMessageListData(): MessageData[] {
    return this.messageList;
  }
}
export default new MessageViewModel();