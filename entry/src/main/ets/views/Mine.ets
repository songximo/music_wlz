import { getSongList } from '../apis';
import { SongItemType, SongItem } from '../models/Index.ets';

@Component
export default struct Mine {
  @State showList: [SongItemType[]] = [[]];
  columnList: number[] = [0, 1, 2, 3];
  async aboutToAppear() {
    const songList: SongItemType[] = await getSongList() as SongItemType[];
    this.columnList.forEach(item => {
      this.showList[item] = songList.map(item => new SongItem(item))
        .sort(() => Math.random() - 0.5);
    });
  }
  build() {
    Column() {
      // 背景
      Column() {
        GridRow({ gutter: 8 }) {
          ForEach(this.columnList, (item: number) => {
            GridCol({ span: 3 }) {
              SongCard({ songs: this.showList[item] })
            }
          })
        }
      }
      .scale({ x: 1.15, y: 1.15, centerX: '50%', centerY: '0' })
      .height('75%')
      .width('100%')
      .backgroundColor('#000')
      // 个人信息
      Column() {
        Column() {
          Image($r('app.media.logo'))
            .width('90%')
        }
        .backgroundColor(Color.Black)
        .width(80)
        .aspectRatio(1)
        .borderRadius(80)
        .offset({ y: -40 })
        Column({ space: 12 }) {
          Row({ space: 8 }) {
            Text('黑马云音乐')
              .fontColor(Color.White)
              .fontSize(20)
            Image($r('app.media.ic_vip'))
              .width(40)
          }
          .offset({ y: -15 })
          Row() {
            Image($r('app.media.ic_boy'))
              .width(14)
              .fillColor('#ff23496b')
              .margin({ right: 4 })
            Text('00后')
              .fontColor('#555')
              .margin({ right: 12 })
              .fontSize(14)
            Text('双子座')
              .fontColor('#555')
              .margin({ right: 12 })
              .fontSize(14)
            Text('北京')
              .fontColor('#555')
              .margin({ right: 12 })
              .fontSize(14)
            Text('歌龄·2年')
              .fontColor('#555')
              .margin({ right: 12 })
              .fontSize(14)
          }
          Row() {
            Text('1 关注')
              .fontColor('#555')
              .margin({ right: 12 })
              .fontSize(14)
            Text('10万 粉丝')
              .fontColor('#555')
              .margin({ right: 12 })
              .fontSize(14)
            Text('167万 赞')
              .fontColor('#555')
              .margin({ right: 12 })
              .fontSize(14)
          }
        }
      }
      .width('100%')
      .height('25%')
      .backgroundColor('#121215')
    }
    .width('100%')
  }
}

@Component
struct SongCard {
  @Prop songs: SongItemType[] = [];
  build() {
    List({ space: 12 }) {
      ForEach(this.songs, (item: SongItemType) => {
        ListItem() {
          Stack() {
            Image(item.img)
              .width('100%')
          }
          .width('100%')
          .aspectRatio(1)
          .borderRadius(8)
          .clip(true)
        }
      })
    }
    .width('100%')
    .height('100%')
  }
}

/*
@Component
export default struct Mine {
  @State showList: [SongItemType[]] = [[]];
  columnList: number[] = [0, 1, 2, 3];
  @State cardScale: number = 1.0;

  async aboutToAppear() {
    const songList: SongItemType[] = await getSongList() as SongItemType[];
    this.columnList.forEach(item => {
      this.showList[item] = songList.map(item => new SongItem(item))
        .sort(() => Math.random() - 0.5);
    });
  }

  build() {
    Column() {
      // 顶部歌单区域
      Column() {
        GridRow({ gutter: 8 }) {
          ForEach(this.columnList, (item: number) => {
            GridCol({ span: 3 }) {
              SongCard({ songs: this.showList[item] })
            }
          })
        }
      }
      .width('100%')
      .height('75%')
      .backgroundColor('#000')
      .scale({ x: 1.15, y: 1.15, centerX: '50%', centerY: '0' })

      // 个人信息区域
      Column() {
        // 头像
        Column() {
          Image($r('app.media.logo'))
            .width('90%')
        }
        .width(85)
        .aspectRatio(1)
        .backgroundColor(Color.Black)
        .border({ width: 3, color: '#ffffff' })
        .borderRadius(50)
        .shadow({ radius: 10, color: '#00000050' })
        .offset({ y: -42 })

        // 昵称 + VIP
        Column({ space: 6 }) {
          Row({ space: 8 }) {
            Text('黑马云音乐')
              .fontColor(Color.White)
              .fontSize(22)
              .fontWeight(FontWeight.Bold)

            Image($r('app.media.ic_vip'))
              .width(38)
          }

          // 标签栏
          Row({ space: 10 }) {
            Text('00后')
              .fontColor('#999')
              .fontSize(13)
            Text('双子座')
              .fontColor('#999')
              .fontSize(13)
            Text('北京')
              .fontColor('#999')
              .fontSize(13)
            Text('歌龄·2年')
              .fontColor('#999')
              .fontSize(13)
          }

          // 数据统计
          Row({ space: 0 }) {
            Column({ space: 3 }) {
              Text('1')
                .fontColor(Color.White)
                .fontSize(16)
                .fontWeight(FontWeight.Medium)
              Text('关注')
                .fontColor('#888')
                .fontSize(12)
            }
            .layoutWeight(1)

            Column({ space: 3 }) {
              Text('10万')
                .fontColor(Color.White)
                .fontSize(16)
                .fontWeight(FontWeight.Medium)
              Text('粉丝')
                .fontColor('#888')
                .fontSize(12)
            }
            .layoutWeight(1)

            Column({ space: 3 }) {
              Text('167万')
                .fontColor(Color.White)
                .fontSize(16)
                .fontWeight(FontWeight.Medium)
              Text('获赞')
                .fontColor('#888')
                .fontSize(12)
            }
            .layoutWeight(1)
          }
          .width('80%')
          .margin({ top: 10 })
        }
        .offset({ y: -20 })
      }
      .width('100%')
      .height('25%')
      .backgroundColor('#121215')
    }
    .width('100%')
    .height('100%')
  }
}

@Component
struct SongCard {
  @Prop songs: SongItemType[] = [];
  @State isHover: boolean = false;

  build() {
    List({ space: 12 }) {
      ForEach(this.songs, (item: SongItemType) => {
        ListItem() {
          Stack() {
            Image(item.img)
              .width('100%')
              .height('100%')
          }
          .width('100%')
          .aspectRatio(1)
          .borderRadius(10)
          .clip(true)
          .shadow({ radius: 6, color: '#00000030' })
          .scale({ x: this.isHover ? 1.04 : 1, y: this.isHover ? 1.04 : 1 })
          .onHover((isHover) => this.isHover = isHover)
        }
      })
    }
    .width('100%')
    .height('100%')
    .scrollBar(BarState.Off)
  }
}
*/

