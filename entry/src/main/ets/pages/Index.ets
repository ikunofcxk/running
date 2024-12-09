import { router } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct Index {
  build() {
    Column() {
      Image($r("app.media.running"))
        .width('600px')
        .margin({ top: 140 });

      Text("点击开始约跑北操之旅")
        .fontSize(24)
        .fontWeight('bold') // 加粗字体
        .margin({ top: 180 });

    }
    .width("100%")
    .onClick(() => {
      // 直接在点击事件中调用router.push进行页面跳转
      router.pushUrl({ url: 'pages/running' }).then(() => {
        console.info('Succeeded in jumping to the second page.')

      }).catch((err: BusinessError) => {
        console.error(`Failed to jump to the second page. Code is ${err.code}, message is ${err.message}`)
      })


    });
  }
}
