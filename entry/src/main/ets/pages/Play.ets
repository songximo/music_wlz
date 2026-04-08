import { SongItem, PlayState } from '../models/Index';
@Entry
@Component
struct Play {
  @State panelHeight: string = '0%';
  @State playState: PlayState = new PlayState();
  @State rotateAngle: number = 0;
  //定义动画对象，主要用于实现唱片的旋转效果
  animatorResult = this.getUIContext().createAnimator({
    duration: 1000 * 15,
    easing: 'linear',
    delay: 0,
    fill: 'none',
    direction: 'normal',
    iterations: -1,
    begin: 0,
    end: 360
  })
  aboutToAppear() {
    //用于在动画对象接收到帧时，控制唱片的旋转角度发生变化
    this.animatorResult.onFrame = val => {
      this.rotateAngle = val;
    };
  }
  build() {
    Stack({ alignContent: Alignment.Bottom }) {
      // 播放区域
      Stack() {
        //在步骤5中实现
      }
      .width('100%')
      .height('100%')
      .backgroundColor(Color.Transparent)
      Column() {
        Column()
          .width('100%')
          .layoutWeight(1)
          .onClick(() => {
            this.panelHeight = '0%';//
          })
        // 播放列表区域，默认隐藏
        Column() {
          //在步骤8中实现
        }
        .height(400)
      }
      .height(this.panelHeight)
      .animation({ duration: 300 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#333')
  }
}
