import Setting from "../view/Setting";


import Message from "../view/Message";

import { router } from "@kit.ArkUI";

@Entry
@Component
struct Running {
  @State currentIndex: number = 0;

  // 更新当前索引的函数
  changeIndex(index: number) {
    this.currentIndex = index;
  }

  // 创建一个 TabsController 实例
  private tabsController: TabsController = new TabsController()

  @Builder tabBuilder(title: string, targetIndex: number, selectedImg: Resource, normalImg: Resource) {
    Column() {
      Image(this.currentIndex === targetIndex ? selectedImg : normalImg)
        .size({ width: 25, height: 25 })
      Text(title)
        .fontColor(this.currentIndex === targetIndex ? '#1698CE' : '#6B6B6B')
    }
    .width('100%')
    .height(50)
    .justifyContent(FlexAlign.Center)
    .onClick(()=>{
      this.currentIndex = targetIndex
      this.tabsController.changeIndex(this.currentIndex)
    })

  }

  build() {
    Column() {
      Tabs({ barPosition: BarPosition.End,
        controller:this.tabsController
      }) {


        TabContent() {
          Message()
        }
        .tabBar(this.tabBuilder('消息', 0, $r('app.media.Message_s'),$r('app.media.Message')))

        TabContent() {
          Column() {
            // 图片
            Button({ type: ButtonType.Circle }) {
              Image($r('app.media.running'))
                .width(90)
                .height(90)
            }
            // 文字
            Text('点击分享心情给朋友')
              .fontSize(14)
              .margin({ top: 5 }) // 设置文字与图片的间距
          }
          .onClick(()=>{
            router.pushUrl({
              url:"pages/Moment/MomentPage"
            })
          })
          .alignItems(HorizontalAlign.Center) // 设置容器内元素水平居中对齐
          .width('100%') // 设置容器宽度为100%
          .height('50%') // 设置容器高度为100%

        }
        .tabBar(this.tabBuilder('动态', 1, $r('app.media.Post_s'),$r('app.media.Post')))


        TabContent() {
          Setting()
        }
        .padding({
          left: '12vp',
          right: '12vp'
        })
        .backgroundColor('#F1F3F5')
        .tabBar(this.tabBuilder('我的', 2, $r('app.media.Mine_s'),$r('app.media.Mine')))
      }
      .scrollable(false)
    }

  }
}
