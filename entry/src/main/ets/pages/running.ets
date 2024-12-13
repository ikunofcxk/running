import Setting from "../view/Setting";

import MessageView from "../view/Post";
import Message from "../view/Message";
import Match from "../view/Match";
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
          Match()
        }
        .tabBar(this.tabBuilder('匹配约跑', 0, $r('app.media.matchRunning_s'),$r('app.media.matchRunning')))

        TabContent() {
          MessageView()
        }
        .tabBar(this.tabBuilder('动态', 1, $r('app.media.Post_s'),$r('app.media.Post')))

        TabContent() {
          Message()
        }
        .tabBar(this.tabBuilder('消息', 2, $r('app.media.Message_s'),$r('app.media.Message')))

        TabContent() {
          Setting()
        }
        .padding({
          left: '12vp',
          right: '12vp'
        })
        .backgroundColor('#F1F3F5')
        .tabBar(this.tabBuilder('我的', 3, $r('app.media.Mine_s'),$r('app.media.Mine')))
      }
      .scrollable(false)
    }

  }
}
