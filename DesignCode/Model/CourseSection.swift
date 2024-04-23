import SwiftUI


struct CourseSection: Identifiable
{
    let id = UUID()
    var title: String
    var subtitle: String
    var text: String
    var image: String
    var background: String
    var logo: String
    var progress: CGFloat
}


//var courseSections = [
//    CourseSection(title: "Advanced Custom Layout", subtitle: "SwiftUI for iOS 15", text: "Build an iOS app for iOS 15 with custom layouts...", image: "Illustration 1", background: "Background 5", logo: "Logo 2", progress: 0.5),
//    CourseSection(title: "Coding the Home View", subtitle: "SwiftUI Concurrency", text: "Learn about the formatted(date:time:) method and AsyncImage", image: "Illustration 2", background: "Background 4", logo: "Logo 2", progress: 0.2),
//    CourseSection(title: "Styled Components", subtitle: "React Advanced", text: "Reset your CSS, set up your fonts and create your first React component", image: "Illustration 3", background: "Background 3", logo: "Logo 3", progress: 0.8),
//    CourseSection(title: "Flutter Interactions", subtitle: "Flutter for designers", text: "Use the GestureDetector Widget to create amazing user interactions", image: "Illustration 4", background: "Background 2", logo: "Logo 1", progress: 0.0),
//    CourseSection(title: "Firebase for Android", subtitle: "Flutter for designers", text: "Create your first Firebase Project and download Firebase plugins for Android", image: "Illustration 5", background: "Background 1", logo: "Logo 1", progress: 0.1),
//    CourseSection(title: "Advanced Custom Layout", subtitle: "SwiftUI for iOS 15", text: "Build an iOS app for iOS 15 with custom layouts...", image: "Illustration 1", background: "Background 5", logo: "Logo 2", progress: 0.5),
//    CourseSection(title: "Coding the Home View", subtitle: "SwiftUI Concurrency", text: "Learn about the formatted(date:time:) method and AsyncImage", image: "Illustration 2", background: "Background 4", logo: "Logo 2", progress: 0.2),
//    CourseSection(title: "Styled Components", subtitle: "React Advanced", text: "Reset your CSS, set up your fonts and create your first React component", image: "Illustration 3", background: "Background 3", logo: "Logo 3", progress: 0.8),
//    CourseSection(title: "Flutter Interactions", subtitle: "Flutter for designers", text: "Use the GestureDetector Widget to create amazing user interactions", image: "Illustration 4", background: "Background 2", logo: "Logo 1", progress: 0.0),
//    CourseSection(title: "Firebase for Android", subtitle: "Flutter for designers", text: "Create your first Firebase Project and download Firebase plugins for Android", image: "Illustration 5", background: "Background 1", logo: "Logo 1", progress: 0.1)
//]
var courseSections = [
    CourseSection(title: "真的想不出来这里应该写啥1", subtitle: "这里写一些副标题1", text: "哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈", image: "Illustration 1", background: "Background 5", logo: "Logo 2", progress: 0.5),
    CourseSection(title: "真的想不出来这里应该写啥2", subtitle: "这里写一些副标题2", text: "哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈", image: "Illustration 2", background: "Background 4", logo: "Logo 2", progress: 0.2),
    CourseSection(title: "真的想不出来这里应该写啥3", subtitle: "这里写一些副标题3", text: "哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈", image: "Illustration 3", background: "Background 3", logo: "Logo 3", progress: 0.8),
    CourseSection(title: "真的想不出来这里应该写啥4", subtitle: "这里写一些副标题4", text: "哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈", image: "Illustration 4", background: "Background 2", logo: "Logo 1", progress: 0.0),
    CourseSection(title: "真的想不出来这里应该写啥5", subtitle: "这里写一些副标题5", text: "哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈", image: "Illustration 5", background: "Background 1", logo: "Logo 1", progress: 0.1),
    CourseSection(title: "真的想不出来这里应该写啥6", subtitle: "这里写一些副标题6", text: "哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈", image: "Illustration 1", background: "Background 5", logo: "Logo 2", progress: 0.5),
    CourseSection(title: "真的想不出来这里应该写啥7", subtitle: "这里写一些副标题7", text: "哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈", image: "Illustration 2", background: "Background 4", logo: "Logo 2", progress: 0.2),
    CourseSection(title: "真的想不出来这里应该写啥8", subtitle: "这里写一些副标题8", text: "哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈", image: "Illustration 3", background: "Background 3", logo: "Logo 3", progress: 0.8),
    CourseSection(title: "真的想不出来这里应该写啥9", subtitle: "这里写一些副标题9", text: "哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈", image: "Illustration 4", background: "Background 2", logo: "Logo 1", progress: 0.0),
    CourseSection(title: "真的想不出来这里应该写啥10", subtitle: "这里写一些副标题10", text: "哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈", image: "Illustration 5", background: "Background 1", logo: "Logo 1", progress: 0.1)
]
