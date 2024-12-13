//import { List, ListItem, Text, Row, Column, Image, VerticalAlign, HorizontalAlign, FontWeight } from '@ohos.ace.ability';
import MessageData from '../viewmodel/MessageData';
import MessageViewModel from '../viewmodel/MessageViewModel';

@Entry
@Component
export default struct MessageList {
  @Builder
  messageCell(item: MessageData) {
    Row() {
      Image(item.img)
        .objectFit(ImageFit.Cover)
        .height('50vp')
        .width('50vp')
        .margin({
          left: '16vp',
          right: '12vp'
        })
      Column() {
        Text(item.title)
          .fontSize('16fp')
          .fontWeight(FontWeight.Bold)
        Text(item.content)
          .fontSize('14fp')
          .maxLines(1)
        Text(item.time)
          .fontSize('12fp')
      }
      .flexGrow(1)
      .alignItems(HorizontalAlign.Start)

      if (item.unread) {
        Text('未读')
          .fontSize('12fp')
          //./color('#FF0000')
          .margin({
            right: '16vp'
          })
      }
    }
    .width('100%')
    .height('80vp')
    .alignItems(VerticalAlign.Center)
    .padding({
      top: '8vp',
      bottom: '8vp'
    })
  }

  build() {
    Column() {
      Text('我的信息')
        .fontSize('20fp')
        .fontWeight(FontWeight.Bold)
        .margin({
          top: '16vp',
          bottom: '16vp',
          left: '16vp',
          right: '16vp'
        })

      Scroll() {
        List({
          space: 8,
        }) {
          ForEach(MessageViewModel.getMessageListData(), (item: MessageData) => {
            ListItem() {
              this.messageCell(item)
            }
            .backgroundColor('#F0F0F0') // 设置列表项的背景颜色
          })
        }
        .scrollBar(BarState.Off)
        .width('100%')
        .height('100%')
        .divider({
          strokeWidth: '1vp',
          color: '#E0E0E0'
        })
        .backgroundColor('#F0F0F0') // 设置列表的背景颜色
      }
      .width('100%')
      .height('100%')
      .backgroundColor('#F0F0F0') // 设置整个滚动区域的背景颜色
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F0F0F0')
  }
}
