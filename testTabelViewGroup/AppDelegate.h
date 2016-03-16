//
//  AppDelegate.h
//  testTabelViewGroup
//
//  Created by baishangshang on 16/2/26.
//  Copyright © 2016年 dscm. All rights reserved.
//
/**
 1、研究UITextViewField Delegate？  网络请求？？？
 
 2、集成推荐好友
 
 3、项目不能停* 美团不能停* 二哥的尽量赶
 
 4、黄金，金属属性，金融属性。     黄金与美元是弱相关。
 
 5、委托:代表另一个对象
 
 6、协议:使不相关的对象之间能通过继承进行通信
 
 7、协议是可编程接口的声明,任何类都可以实施它的方法。
 
 8、通知是告诉观察者,事件已经发生或即将发生,因此让观察者 有机会以合适的方式响应。通过通知中心来传播通知,是增加应用程序对象间合作和内聚力的一种途径。
 
 9、处理通知的方法与委托方法 不同,它不能返回值。通过通知中心的通知是同步的,与委托一样。
 
 10、键值观察:值更改时通知观察者
 
 11、键值观察(Key-value observing,或简称 KVO)允许对象观察另一个对象的属性。该属性值改变时,会通知观察 对象。它了解新值以及旧值;如果观察的属性为对多的关系(例如数组),它也要了解哪个包含的对象发生了改变。 KVO 有助于使应用程序变得更内聚,保持模型、控制器和视图层中的对象与改变同步。
 
 12、KVO 是一个轻量级点对点通信机制,不允许观察所有 实例的特定属性。
 
 13、视图控制器是 一种特殊的控制器对象,用于显示和管理一组视图。视图控制器对象提供基础结构,来管理内容相关的 视图并协调视图的显示与隐藏。视图控制器管理应用程序视图的子层次结构。
 
 14、最成功的 iOS 应用程序,通常是深思熟虑、反复设计的结果。当开发者聚焦于主要任务,使功能更加精炼,是可 以创建优秀的用户体验。
 
 15、提炼功能列表：最好的应用程序,通常聚焦于一个主要任务,只提供用户完成该任务所需的那些功能。
 
 16、为设备而设计  
 17、长得太漂亮了。你得明确你有什么，对自己有一个很好的定位。
 18、在纸上(而不是在电脑上)做最初的设计,尽可天马行空,想出的答案不必限于那些容易做到的东西。
 
 19、自定义对象数据模型——自定对象通常将某些简单数据(字符串、数字、日期、URL 等)与业务逻 辑相结合,业务逻辑是管理此类数据并确保其一致性所需要的。
 
 20、结构化数据模型——如果您的数据是高度结构化的(也就是说,该数据适合储存在数据库中),请 使用 Core Data(或 SQLite)储存数据。Core Data 提供简单的、面向对象的模型来管理结构化 数据。它还提供对部分高级功能(如撤销和 iCloud)的内建支持。(SQLite 文件不能与 iCloud 结 合使用。)
 
 21、除了自定 UIKit 对象以外,您还需要负责提供或定义其他多组关键的对象。最大的一组对象,是应用程序的数据对 象,它们的定义,完全由您负责。您还必须提供一套用户界面对象。
 
 22、应用程序的心脏, 是 UIApplication 对象,它从系统接收事件,然后将事件分派到您的自定代码进行处理。
 
 23、数据模型对象储存应用程序的内容,是您的应用程序专有的。应用程序还可以使用文稿对象(UIDocument 的自定子类),来管理其数据模型对象中的一 部分或全部。文稿对象不是必需的,但它们提供了一种便利的方式,对属于单个文件或文件 包中的数据进行分组。
 
 24、应用程序的数据模型,由数据结构以及业务逻辑组成,业务逻辑是让数据保持一致状态所必要的。不要把数据模型 的设计,脱离应用程序的用户界面来进行;
 
 25、游戏以及其他需要很高帧速率或复杂绘图功能的应用程序,可以将专门为 OpenGL ES 绘图而设计的视图添加到 其视图层次中。最简单的 OpenGL ES 应用程序类型,具有一个窗口对象、一个视图(用于 OpenGL ES 绘图), 以及一个视图控制器,来管理内容的显示和旋转。更复杂的应用程序,可以混用 OpenGL ES 视图和 UIKit 视图, 来实施其界面。
 
 26、不像 UIKit 视图,OpenGL ES 视图是由一种不同类型的层对象(CAEAGLLayer 对象)来支持的,而不是基于视图的应用程序所使用的标准 层。CAEAGLLayer 对象提供了 OpenGL ES 可以将内容渲染在其中的绘图表面。要管理绘图环境,应用程序也创 建 EAGLContext 对象,并将该对象连同视图储存下来,使它容易取回。
 
 27、当您生成 iOS 应用程序时,Xcode 将它捆绑成一个包。捆绑包 (bundle) 是文件系统中的一个目录,它将相关资 源成组在一个地方。一个 iOS 应用程序捆绑包中,含有其可执行文件和支持资源文件(如应用程序图标、图像文 件和已本地化的内容)。
 
 28找到属性 CFBundleDisplayName(它是表示某个应用程序的显示名称的 Core Foundation 符号)的位置。
 
 29、做法是创建一个名为 adhoc provisioning profile(临时预置描述文件)的特殊分发预置描述文件,并将其和应用 程序一起发送给测试员。临时预置描述文件不需要将测试员添加到您的团队,不需要创建签名证书或使用 Xcode 运 行应用程序。应用程序测试员仅需在他们的设备上安装该应用程序和临时预置描述文件,就可启动应用程序。然后, 可以从这些测试员收集和分析崩溃报告或日志,从而解决问题
 
 30、iTunes Connect 提供的数据能帮助您判断应用程序有多成功,这些数据包括销售和财务报告、客户评论,以及用 户提交给 Apple 的崩溃日志。崩溃日志至关重要,因为它们表示用户在应用程序中遇到的重大问题。您应该优先 研究这些报告。
 
 31、Apple 使用此应用程序 ID,在整个 iOS、App Store 和 Apple 的服务器中,作为使用了这些技术的应用程序的唯一识别。 需要这些预置描述文件的技术有:
  iCloud 储存,允许您与不同 iOS 和 Mac OS X 设备上运行的应用程序的多个实例共享用户数据。
  推送通知,允许不在前台运行的应用程序,在有信息时通知用户。
  应用程序内购买,允许您连接至 App Store 并安全地处理用户的付款,即直接将商店嵌入应用程序内。
  Game Center,它是一项社交游戏服务,允许玩家分享他们正在玩的游戏的信息,并参与多人游戏比赛。
 开发预置描述文件 (development provisioning profile) 包含一个签名证书列表、一个应用程序 ID 和一个设备 ID 列表。如果以前已经使用 iOS 团队预置描述文件来预置设备以用于开发,则签名证书和设备 ID 已经存在于您的 帐户中。Xcode 提供的应用程序 ID 为匹配所有捆绑包 ID 的通配符 ID。您需要创建一个完全匹配应用程序捆绑 包 ID 的应用程序 ID,并在新建的开发预置描述文件中,使用该应用程序 ID,而非通配符应用程序 ID。如果使 用 iCloud 储存或推送通知,需要启用应用程序 ID 以使用这些技术。
 使用 iOS Provisioning Portal,向 Apple 注册应用程序 ID 并创建开发预置描述文件。一个明确的应用程序 ID, 与您的捆绑包 ID 完全相符。
 
 32、c********API参考文档
 
 33、http://www.baidu.com/s?ie=utf-8&f=8&rsv_bp=1&tn=monline_4_dg&wd=ios%E7%94%A8%E6%88%B7%E7%95%8C%E9%9D%A2%E6%8C%87%E5%AF%BC%E5%8E%9F%E5%88%99&oq=%E9%87%8E%E8%98%91%E8%8F%87&rsv_pq=eb91b6fc0012f972&rsv_t=96bbBS%2B8kB84QNR1FjidJljwCEIHkRD1C4Ed8k%2BWbrTAzjFn2JRqq4GKUUkbWxe18kaQ&rsv_enter=0&rsv_sug3=2&inputT=3104&rsv_sug4=3714&bs=%E9%87%8E%E8%98%91%E8%8F%87&rsv_jmp=fail   ************ios用户界面指导原则
 
 
 34、数据的配置。 plist
 

 
 
 
 
 */

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;


@end

