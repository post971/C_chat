## C-chat  
**版本**：Version1.1.04  
  
**项目描叙**：  
C-chat是一个聊天室，除基本功能外，还有我加入的保存私信的特点，以及独有的"插话功能"  
  
**使用技术**：ssm，websocket、javamail  
  
**项目功能**：  
1、注册：注册需要真邮箱，真的可以接收到邮件，邮件验证码是真随机(这里我去掉了验证邮箱的代码，因为里面有我的账号密码)  
2、登录：必须注册之后才能登录  
3、找回密码：同样需要邮箱  
4、登录后可以在线聊天  
5、实时显示在线好友  
6、点击别人的头像可以给他发送私信  
7、点击别人的聊天气泡可以在那个位置下面插一条消息（插话系统）  
8、私信都会被收集在【我的消息里】可以删除  
9、账户密码为admin可以进入管理模式（可以修改和删除用户）
  
**为什么要做插话功能？插话功能有什么用？**  
首先，插话功能本来我是想解决回复某个人消息但被很多其他消息给挤上去的场景（就像下面的情况）  
  
A:来我家玩吧  
B:可是节假日堵车  
C:节假日堵车已经成为不可避免的社会现象呢  
B:是啊，希望能开通很多的路线解决这一状况  
C:现在经济水平提升，每个人都坐车，开通更多的路线也可能解决不了问题  
D:【回复】A 好啊，什么时候去你家  
  
但是，插的那一条话会被顶上去，虽然插了，但可能没人会看到  
于是记录私信的功能就做出来了，理论上也能记录插话，为了项目多样化并且精简（~~其实是我懒~~），所以就没有把记录插话的功能也做了  

**更新日志**  
1.0版本发布  
  
1.02  
修复了插话后会把私信发送给所有人的BUG  
  
1.03  
修复了插话后发送私信的用户的私信消失的BUG  
限制了发送消息带有"'"非法字符  
  
1.0.04  
规范版本命名  
删除无用注释代码  
  
1.1.01  
新增管理者系统  
可以用中文用户名注册登录  
优化输入限制  
  
1.1.02  
删除无用注释代码  
增加了一些注释  
css样式过长的移至style.css  
  
1.1.03  
修复了登录没有的账号会出错  
修复了中文名的用户发消息会出错  
  
1.1.04  
限制发送空白消息  
解决了github提醒的依赖漏洞  
  
其他说明以后再更新  
  
