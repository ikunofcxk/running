
import {BannerClass} from '../viewmodel/BannerClass';
import {ArticleClass} from '../viewmodel/ArticleClass';
@Entry
@Component
struct Post {
  @State message: string = '今日美图';

  build() {
    Column() {
      Text(this.message)
        .fontSize(24)
        .fontWeight(700)
        .width('100%')
        .textAlign(TextAlign.Start)
        .padding({ left: 16 })
        .fontFamily('HarmonyHeiTi-Bold')
        .lineHeight(33)
      Scroll() {
        Column() {
          Banner()
          TutorialView()
        }
      }
      .layoutWeight(1)
      .scrollBar(BarState.Off)
      .align(Alignment.TopStart)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F1F3F5')
  }
}

@Component
struct Banner {
  @State bannerList: Array<BannerClass> = [
    new BannerClass('pic0', $r('app.media.fig4'),
      'https://developer.huawei.com/consumer/cn/training/course/video/C101718352529709527'),
    new BannerClass('pic1', $r('app.media.fig4'),
      'https://developer.huawei.com/consumer/cn/'),
    new BannerClass('pic2', $r('app.media.fig4'),
      'https://developer.huawei.com/consumer/cn/deveco-studio/'),
    new BannerClass('pic3', $r('app.media.fig4'),
      'https://developer.huawei.com/consumer/cn/arkts/'),
    new BannerClass('pic4', $r('app.media.fig4'),
      'https://developer.huawei.com/consumer/cn/arkui/'),
    new BannerClass('pic5', $r('app.media.fig4'),
      'https://developer.huawei.com/consumer/cn/sdk')
  ];

  build() {
    Swiper() {
      ForEach(this.bannerList, (item: BannerClass, index: number) => {
        Image(item.imageSrc)
          .objectFit(ImageFit.Contain)
          .width('100%')
          .padding({ top: 11, left: 16, right: 16 })
          .borderRadius(16)
      }, (item: BannerClass, index: number) => item.id)
    }
    .autoPlay(true)
    .loop(true)
    .indicator(
      new DotIndicator()
        .color('#1a000000')
        .selectedColor('#0A59F7'))
  }
}

@Component
struct TutorialItem {
  @Prop tutorialItem: ArticleClass;

  build() {
    Row() {
      Column() {
        Text(this.tutorialItem.title)
          .height(19)
          .width('100%')
          .fontSize(14)
          .textAlign(TextAlign.Start)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .maxLines(1)
          .fontWeight(400)
          .margin({ top: 4 })
        Text(this.tutorialItem.brief)
          .height(32)
          .width('100%')
          .fontSize(12)
          .textAlign(TextAlign.Start)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .maxLines(2)
          .fontWeight(400)
          .fontColor('rgba(0, 0, 0, 0.6)')
          .margin({ top: 5 })
      }
      .height('100%')
      .layoutWeight(1)
      .alignItems(HorizontalAlign.Start)
      .margin({ right: 12 })

      Image(this.tutorialItem.imageSrc)
        .height(64)
        .width(108)
        .objectFit(ImageFit.Cover)
        .borderRadius(16)
    }
    .width('100%')
    .height(88)
    .borderRadius(16)
    .backgroundColor(Color.White)
    .padding(12)
    .alignItems(VerticalAlign.Top)
  }
}

@Component
struct EnablementItem {
  @Prop enablementItem: ArticleClass;

  build() {
    Column() {
      Image(this.enablementItem.imageSrc)
        .width('100%')
        .objectFit(ImageFit.Cover)
        .height(96)
        .borderRadius({
          topLeft: 16,
          topRight: 16
        })
      Text(this.enablementItem.title)
        .height(19)
        .width('100%')
        .fontSize(14)
        .textAlign(TextAlign.Start)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .maxLines(1)
        .fontWeight(400)
        .padding({ left: 12, right: 12 })
        .margin({ top: 8 })
      Text(this.enablementItem.brief)
        .height(32)
        .width('100%')
        .fontSize(12)
        .textAlign(TextAlign.Start)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .maxLines(2)
        .fontWeight(400)
        .fontColor('rgba(0, 0, 0, 0.6)')
        .padding({ left: 12, right: 12 })
        .margin({ top: 2 })
    }
    .width(160)
    .height(169)
    .borderRadius(16)
    .backgroundColor(Color.White)
  }
}



@Preview
@Component
struct TutorialView {
  @State tutorialList: Array<ArticleClass> = [
    new ArticleClass('1', $r('app.media.fig4'), '我太喜欢乐跑了',
      '步道乐跑，那是一种让人沉醉的运动，一旦爱上，便无法自拔。每当踏上那片充满活力的跑道，我的心情便如阳光般明媚。乐跑，已成为我生活中不可或缺的一部分，那份热爱，早已深入骨髓。',
      'https://developer.huawei.com/consumer/cn/forum/home?all=1'),
    new ArticleClass('2', $r('app.media.chicken'), '能不能别黑我家咯咯了',
      '你干嘛哎呦',
      'https://developer.huawei.com/consumer/cn/forum/home?all=1'),
  ];

  build() {
    Column() {
      Text('他人动态')
        .fontColor('#182431')
        .fontSize(16)
        .fontWeight(500)
        .fontFamily('HarmonyHeiTi-medium')
        .textAlign(TextAlign.Start)
        .padding({ left: 16 })
        .margin({ bottom: 8.5 })
      List({ space: 12 }) {
        ForEach(this.tutorialList, (item: ArticleClass) => {
          ListItem() {
            TutorialItem({ tutorialItem: item })
          }
        }, (item: ArticleClass) => item.id)
      }
      .scrollBar(BarState.Off)
      .padding({ left: 16, right: 16 })
    }
    .margin({ top: 18 })
    .alignItems(HorizontalAlign.Start)
  }
}

export default Post;