import router from '@ohos.router';
import promptAction from '@ohos.promptAction';
@Entry
@Component
struct LoginPage{
  //@State verificationCode: string = "获取验证码"
  @State account :string = ''
  @State password :string =''
  @State isCountingDown:boolean = false
  @State Countdown:number=60
  private intervalID:number = 0
  build() {
    Column() {
      Image($r("app.media.running"))
        .width(120)
        .height(120)
        .margin({ top: 50, bottom: 20 })
      Text("17750888778")
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 40 })
      Row() {
        Text("密码")
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .margin({ right: 10 })
        TextInput({ placeholder: "请填写微信密码" })
          .width('50%')
          .height(44)
          .backgroundColor(Color.White)
          .margin({ right: 10 })
          .onChange((value: string) => {
            this.account = value})
        /*Button(this.verificationCode)
          .width('30%')
          .height(44)
          .backgroundColor(Color.White)
          .fontColor("#07C160")
          .borderRadius(0)
          .onClick(()=>this.startCountDown())*/
      }
      .width('90%')
      .padding(10)
      .backgroundColor(Color.White)
      .borderRadius(8)
      .margin({ bottom: 10 })


      Button("登录")
        .width('80%')
        .height(44)
        .backgroundColor("#07C160")
        .fontColor(Color.White)
          // 在Login页面中
        .onClick(() => {
          router.pushUrl({
            url: 'pages/main'
          })
        })

      Blank()



    }
    .width('100%')
    .height('100%')
    .backgroundColor("#F7F7F7")
  }
}
