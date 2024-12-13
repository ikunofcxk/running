@Entry
@Component
export default struct Match {

  private settings: RenderingContextSettings = new RenderingContextSettings(true)
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings)
  private runningTimes: number = 35
  private maxTimes: number = 40

  updateRunningTimes(newRunningTimes: number): void {
    this.runningTimes = newRunningTimes;
  }
  onMatchClick(): void {
    //待定
  }


  build() {
    Column() {
      // 外弧度
      Canvas(this.context)
        .width(180) // 修改宽度为原来的两倍
        .height(180) // 修改高度为原来的两倍
        .margin({ top: -70 })
        .onReady(() => {
          this.context.strokeStyle = '#ff5a5757'
          this.context.lineWidth = 3; // 设置圆环的宽度
          this.context.beginPath(); // 开启路径
          this.context.arc(90, 90, 80, 0, 6.28) // 绘制圆弧，半径也放大两倍
          this.context.stroke() // 刷新一下
        })
      // 内部弧度
      Canvas(this.context)
        .width(180) // 修改宽度为原来的两倍
        .height(180) // 修改高度为原来的两倍
        .margin({ top: -70 })
        .onReady(() => {
          this.context.lineWidth = 3;
          this.context.strokeStyle = '#ff5a5757' // 设置圆环的宽度
          this.context.beginPath(); // 开启路径
          this.context.arc(90, 90, 60, 0, 6.28) // 绘制圆弧，半径也放大两倍
          this.context.stroke() // 刷新一下
        })
      // 填充
      Canvas(this.context)
        .width(180) // 修改宽度为原来的两倍
        .height(180) // 修改高度为原来的两倍
        .margin({ top: -70 })
        .onReady(() => {
          this.context.lineWidth = 15; // 设置圆环的宽度
          this.context.strokeStyle = '#ff28c40f'
          this.context.beginPath();
          // 开启路径//this.runningTimes / this.maxTimes * 6.28
          this.context.arc(90, 90, 70, 4.71,4.71 + this.runningTimes / this.maxTimes * 6.28 ) // 绘制圆弧，半径也放大两倍
          this.context.stroke() // 刷新一下
        })

      Text(`当前跑步次数为：${this.runningTimes}`)
        .fontSize(16)
        .margin({ top: 50, bottom: 5 });

      // 显示学期目标
      Text(`学期目标：${this.maxTimes}次`)
        .fontSize(12)
        .fontColor('#808080') // 灰色小字
        .margin({ bottom: 40 });

      // 添加一个按钮
      Button('点击开始匹配')
        .width('80%')
        .height(50)
        .backgroundColor('#4CAF50')
        .foregroundColor('#FFFFFF')
        .fontSize(18)

        .onClick(() => this.onMatchClick());

    }
    .width('100%')
    .height('100%')

    .backgroundColor('#F0F0F0')
  }
}
