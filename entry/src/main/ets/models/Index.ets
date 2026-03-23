export interface TabType {
  icon: Resource;	// 页签的图标
  text: string;		// 页签的文本
  name: string;		// 页签的标识
}
export interface DailyRecommendType {
  img: string;	  // 封面图
  title: string;	// 标题
  type: string;	  // 类型
  top: string;	  // 类型背景色
  bottom: string;	// 标题背景色
}
export interface RecommendListType {
  img: string;		// 封面图
  title: string;	// 标题
  count: string;	// 播放量
}