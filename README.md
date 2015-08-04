# TJProgressView
#垂直方向上带有动画的进度条
#1-使用方法:
1.1:把TJProgressView这两个文件添加到你的工程项目中 

1.2:在storyboard上拖一个任意宽、高的view,然后把该view的class 设置为TJProgressView

1.3:把该view托线条引出去并设置其progress、progressColor这两个属性值。

#2-具体实现
 @property (weak, nonatomic) IBOutlet TJProgressView *progressView;
 
  _progressView.progress = 0.89;
  
  _progressView.progressColor = [UIColor colorWithRed:0.590 green:0.208 blue:0.041 alpha:1.000];

#3-效果演示图
![Image](https://github.com/KBvsMJ/TJProgressView/blob/master/demoGif/1.gif)
