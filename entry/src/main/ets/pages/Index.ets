/*
@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  build() {
    RelativeContainer() {
      Text(this.message)
        .id('HelloWorld')
        .fontSize($r('app.float.page_text_font_size'))
        .fontWeight(FontWeight.Bold)
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
        .onClick(() => {
          this.message = 'Welcome';
        })
    }
    .height('100%')
    .width('100%')
  }
}*/


import { TabType } from '../models';
import Recommend from '../views/Recommend';
import Find from '../views/Find';
import Moment from '../views/Moment';
import Mine from '../views/Mine';

import { SAFE_TOP, SAFE_BOTTOM } from '../constants';

@Entry
@Component
struct Index {
  // tabData: string[] = ['推荐', '发现', '动态', '我的'];

  tabData: TabType[] = [
    { icon: $r('app.media.ic_recommend'), text: '推荐', name: 'recommend' },
    { icon: $r('app.media.ic_find'), text: '发现', name: 'find' },
    { icon: $r('app.media.ic_moment'), text: '动态', name: 'moment' },
    { icon: $r('app.media.ic_mine'), text: '我的', name: 'mine' }
  ];

  @Builder
  tabBarBuilder(item: TabType) {
    Column({ space: 5 }) {
      Image(item.icon)
        .height(24)
        // .fillColor('#6da8a5')
        .fillColor(this.isActive == item.name ? '#e4608b' : '#6da8a5')
      Text(item.text)
        .fontSize(14)
        // .fontColor('#6da8a5')
        .fontColor(this.isActive == item.name ? '#e4608b' : '#6da8a5')
    }
  }

  build() {
    /*Tabs({ barPosition: BarPosition.End }) {
      ForEach(this.tabData, (item: string) => {
        TabContent() {
          Text(item + '内容')
        }
        .backgroundColor('#131215')
        .tabBar(item)
      })
    }
    .backgroundColor('#3b3f42')*/
    Tabs({ barPosition: BarPosition.End }) {
      ForEach(this.tabData, (item: TabType) => {
        TabContent() {
          // Text(item.text + '内容')
          if (item.name == 'recommend') {
            Recommend()
          } else if (item.name == 'find') {
            Find()
          } else if (item.name == 'moment') {
            Moment()
          } else if (item.name == 'mine') {
            Mine()
          }
        }
        .padding({ top: this.safeTop })
        .backgroundColor('#131215')
        .tabBar(this.tabBarBuilder(item))
        // .tabBar((item))
      })
    }
    .padding({ bottom: this.safeBottom })
    .backgroundColor('#3b3f42')
    .onChange((index: number) => {
      this.isActive = this.tabData[index].name;
    })
  }

  @State isActive: string = 'recommend';

  @StorageProp(SAFE_TOP) safeTop: number = 0;
  @StorageProp(SAFE_BOTTOM) safeBottom: number = 0;




}

/*@Builder
function tabBarBuilder(item: TabType) {
  Column({ space: 5 }) {
    Image(item.icon)
      .height(24)
      // .fillColor('#6da8a5')
      .fillColor(this.isActive == item.name ? '#e4608b' : '#6da8a5')
    Text(item.text)
      .fontSize(14)
      // .fontColor('#6da8a5')
      .fontColor(this.isActive == item.name ? '#e4608b' : '#6da8a5')
  }
}*/
