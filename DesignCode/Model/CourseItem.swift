import SwiftUI


struct CourseItem: Identifiable
{
    let id = UUID()
    var index: Int
    var title: String
    var subtitle: String
    var text: String
    var image: String
    var background: String
    var logo: String
}


//var featuredCoursesCollection = [
//    CourseItem(index: 1, title: "SwiftUI for iOS 15", subtitle: "20 sections - 3 hours", text: "Build an iOS app for iOS 15 with custom layouts, animations and ...", image: "Illustration 5", background: "Background 5", logo: "Logo 2"),
//    CourseItem(index: 2, title: "UI Design for iOS 15", subtitle: "20 sections - 3 hours", text: "Design an iOS app for iOS 15 with custom layouts, animations and ...", image: "Illustration 3", background: "Background 4", logo: "Logo 4"),
//    CourseItem(index: 3, title: "Flutter for designers", subtitle: "20 sections - 3 hours", text: "Flutter is a relatively new toolkit that makes it easy to build cross-platform apps that look gorgeous and is easy to use.", image: "Illustration 1", background: "Background 1", logo: "Logo 1"),
//    CourseItem(index: 4, title: "React Hooks Advanced", subtitle: "20 sections - 3 hours", text: "Learn how to build a website with Typescript, Hooks, Contentful and Gatsby Cloud", image: "Illustration 2", background: "Background 2", logo: "Logo 3"),
//]
var featuredCoursesCollection = [
    CourseItem(index: 1, title: "不知道写什么好1", subtitle: "这里也不知道写什么好呢1", text: "啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊", image: "Illustration 5", background: "Background 5", logo: "Logo 2"),
    CourseItem(index: 2, title: "不知道写什么好2", subtitle: "这里也不知道写什么好呢2", text: "啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊", image: "Illustration 3", background: "Background 4", logo: "Logo 4"),
    CourseItem(index: 3, title: "不知道写什么好3", subtitle: "这里也不知道写什么好呢3", text: "啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊", image: "Illustration 1", background: "Background 1", logo: "Logo 1"),
    CourseItem(index: 4, title: "不知道写什么好4", subtitle: "这里也不知道写什么好呢4", text: "啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊", image: "Illustration 2", background: "Background 2", logo: "Logo 3"),
]


var coursesCollection = [
    CourseItem(index: 1, title: "以后想好了再说吧1", subtitle: "这里也是以后想好了再说吧1", text: "呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃", image: "Illustration 9", background: "Background 5", logo: "Logo 2"),
    CourseItem(index: 2, title: "以后想好了再说吧2", subtitle: "这里也是以后想好了再说吧2", text: "呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃", image: "Illustration 2", background: "Background 3", logo: "Logo 3"),
    CourseItem(index: 3, title: "以后想好了再说吧3", subtitle: "这里也是以后想好了再说吧3", text: "呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃", image: "Illustration 3", background: "Background 4", logo: "Logo 4"),
    CourseItem(index: 4, title: "以后想好了再说吧4", subtitle: "这里也是以后想好了再说吧4", text: "呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃", image: "Illustration 1", background: "Background 1", logo: "Logo 1"),
]
