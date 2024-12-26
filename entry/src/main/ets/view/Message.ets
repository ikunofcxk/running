//import { List, ListItem, Text, Row, Column, Image, VerticalAlign, HorizontalAlign, FontWeight } from '@ohos.ace.ability';
import MessageData from '../viewmodel/MessageData';

import { router } from '@kit.ArkUI';
import ListChatItem, { ChatItemData } from '../component/ListChatItem'
@Entry
@Component
export default struct MessageList {
  @State chatList: ChatItemData[] = [
    {
      headSrc: $r("app.media.menu"),
      nickname: "系统通知",
      content: "更新完成",
      time: "17:21"
    },
    {
      headSrc: $r("app.media.simple_pig"),
      nickname: "猪",
      content: "",
      time: "15:38"
    },
    {
      headSrc: $r("app.media.hihi"),
      nickname: "牢妹",
      content: "哥哥哥哥，有急事",
      time: "刚才"
    },
  {
    headSrc: $r("app.media.hihi"),
    nickname: "牢妹的小号",
     content: "快回我信息！",
      time: "刚才"
  },{
      headSrc: $r("app.media.hihi"),
      nickname: "牢妹的小小号",
      content: "真不骗你，急事啊啊啊啊啊",
      time: "刚才"
  },{
    headSrc: $r("app.media.hihi"),
    nickname: "牢妹的小3号",
    content: "求你了回我个消息",
    time: "刚才"
  },
    {
      headSrc: $r("app.media.daijinbao"),
      nickname: "客户代金保",
      content: "这是我们公司的报价，希望您能考虑下",
      time: "昨天"
    },
    {
      headSrc: $r("app.media.zhaoquan"),
      nickname: "赵经理",
      content: "天凉注意填衣",
      time: "17:21"
    },
    {
      headSrc: $r("app.media.hihi"),
      nickname: "牢妹",
      content: "哥哥哥哥，有急事",
      time: "刚才"
    },
    {
      headSrc: $r("app.media.hihi"),
      nickname: "牢妹",
      content: "哥哥哥哥，有急事",
      time: "刚才"
    }

  ]
  build() {
    Column() {
      Text('我的信息')
        .fontSize(24)
        .fontWeight(400)
        .width('100%')
        .textAlign(TextAlign.Start)
        .padding({ left: 16, top: 8 })
        .fontFamily('HarmonyHeiTi-Bold')
        .lineHeight(33)

      Scroll() {
        List() {
          ForEach(this.chatList, (item: ChatItemData) => {
            ListItem() {
              ListChatItem({ data: item })
            }
            .onClick(() => {
              router.pushUrl({
                url: 'pages/chat/ChatPage',
                params: {
                  name: item.nickname,
                  headSrc: item.headSrc
                }
              })
            })
          })
          ListItem() {
            Divider().color(Color.Transparent).strokeWidth(0)
          }
        }

        .divider({
          strokeWidth: 0.8,
          color: '#f0f0f0',
          startMargin: 90,
          endMargin: 0
        })
        .backgroundColor(Color.White)
        .layoutWeight(1)
        .padding({ left: 0, right: 0, top: 0, bottom: 0 });
      }
      .width("100%")
      .height("100%")
      .backgroundColor("#EDEDED")
      .padding({ left: 0, right: 0, top: 0, bottom: 0 });



    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F0F0F0')
    .padding({ left: 0, right: 0, top: 0, bottom: 0 });
  }

  navigateTo(url: string) {
    switch (url) {
      case 'pages/contact/GroupChatPage':
        this.navigateToCreateGroup()
        break
      default:
        console.error(`Unknown page: ${url}`)
    }
  }

  private navigateToCreateGroup() {
    router.pushUrl({ url: 'pages/contact/GroupChatPage'})
  }




}
