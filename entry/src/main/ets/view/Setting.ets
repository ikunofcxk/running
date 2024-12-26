
import ItemData from '../viewmodel/SettingItemData';
import mainViewModel from '../viewmodel/SettingMainViewModel';
import { prompt, router } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';
import promptAction from '@ohos.promptAction';
/**
 * Setting tab content
 */
@Entry
@Component
export default struct Setting {
  @Builder
  settingCell(item: ItemData) {
    Row() {
      Row({}) {
        Image(item.img)
          .height('22vp')
          .margin({
            left: '16vp',
            right: '12vp'
          })
        Text(item.title)
          .fontSize('16fp')
      }

      if (item.others === undefined) {
        Image($r('app.media.right_grey'))
          .width('12vp')
          .height('24vp')
      } else {
        Toggle({ type: ToggleType.Switch, isOn: false })
      }
    }
    .justifyContent(FlexAlign.SpaceBetween)
    .width('100%')
    .padding({
      left: '8vp',
      right: '22vp'
    })
  }

  build() {
    Scroll() {
      Column({ space: 12 }) {
        Text($r('app.string.mainPage_tabTitles_mine'))
          .width('100%')
          .margin({
            top: '48vp',
            bottom: '12vp'
          })
          .fontWeight(700)
          .fontSize('26fp')

        Row() {
          Image($r('app.media.jay'))
            .width('48vp')
            .height('48vp')
          Column() {
            Text($r('app.string.username'))
              .fontSize('20fp')
            Text($r('app.string.setting_account_email'))
              .fontSize('12fp')
              .margin({ top: '4vp' })
          }
          .alignItems(HorizontalAlign.Start)
          .margin({ left: '12vp' })
        }
        .alignItems(VerticalAlign.Center)
        .width('100%')

        List({ space: 12 }) {
          ForEach(mainViewModel.getSettingListData(), (item: ItemData[], index: number) => {
            ListItemGroup() {
              ForEach(item, (cell: ItemData, cellIndex) => {
                ListItem() {
                  this.settingCell(cell)

                }
                .height('48vp')
              })
            }
            .onClick(() => {
              // 弹出消息
              promptAction.showToast({
                message: '本项目为移动互联网大作业所做'//弹窗内容
              });
            })
            .divider({
              strokeWidth: '1vp',
              color: '#0d000000',
              startMargin: '42vp',
              endMargin: '24vp'
            })
            .backgroundColor('#ffffff')
            .borderRadius('16vp')

          }, (item: ItemData) => JSON.stringify(item))
        }

        .scrollBar(BarState.Off)
        .width('100%')
        .padding({
          top: '4vp',
          bottom: '4vp'
        })


        Blank()

        Button($r('app.string.setting_button'), { type: ButtonType.Capsule })
          .width('90%')
          .height('40vp')
          .fontSize('16fp')
          .fontColor('#FA2A2D')
          .fontWeight(FontWeight.Medium)
          .backgroundColor('#E5E8EA')
          .margin({ bottom: '16vp' })
          .onClick(()=>{
            router.pushUrl({
              url: 'pages/LoginPage/shouye'
            })
          }
          )
      }
      .height('100%')

    }
    .width('100%')
    .height('100%')
  }
}

