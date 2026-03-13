/*@Entry
@Component
struct Start {
  router = this.getUIContext().getRouter();
  // 定时器 id
  timerId: number = 0;
  aboutToAppear(): void {
    // 5秒后自动跳转到首页
    this.timerId = setTimeout(() => {
      this.router.replaceUrl({ url: 'pages/Index' });
    }, 5000);
  }
  aboutToDisappear() {
    // 清除定时器
    clearTimeout(this.timerId);
  }
  build() {
    Stack({ alignContent: Alignment.TopEnd }) {
      Image($r('app.media.ad'))
      Button('跳过')
        .margin(10)
        .backgroundColor('#4d000000')
        .onClick(() => {
          this.router.replaceUrl({ url: 'pages/Index' });
        })
    }
  }
}*/


@Entry
@Component
struct Start {
  router = this.getUIContext().getRouter();
  // 定时器 id
  timerId: number = 0;

  aboutToAppear(): void {
    // 打印生命周期触发日志，记录定时器创建开始
    console.log('Start页 aboutToAppear 触发：开始创建5秒跳转定时器');
    // 5秒后自动跳转到首页
    this.timerId = setTimeout(() => {
      console.log('Start页 定时器触发：执行自动跳转首页操作');
      this.router.replaceUrl({ url: 'pages/Index' });
    }, 5000);
    // 打印定时器创建成功日志，输出定时器ID
    console.log(`Start页 定时器创建成功：timerId = ${this.timerId}`);
  }

  aboutToDisappear() {
    // 打印生命周期触发日志，记录定时器清除开始
    console.log('Start页 aboutToDisappear 触发：开始清除定时器');
    // 清除定时器
    clearTimeout(this.timerId);
    // 打印定时器清除完成日志
    console.log(`Start页 定时器清除完成：已清除 timerId = ${this.timerId} 的定时器`);
  }

  build() {
    Stack({ alignContent: Alignment.TopEnd }) {
      Image($r('app.media.ad'))
      Button('跳过')
        .margin(10)
        .backgroundColor('#4d000000')
        .onClick(() => {
          // 补充跳过按钮点击日志，辅助验证逻辑
          console.log('Start页 跳过按钮点击：执行手动跳转首页操作');
          this.router.replaceUrl({ url: 'pages/Index' });
        })
    }
  }
}