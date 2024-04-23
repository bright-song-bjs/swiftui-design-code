import SwiftUI


struct HandbookItem: Identifiable
{
    let id = UUID()
    var title: String
    var subtitle: String
    var text: String
    var logo: String
    var image: String
    var color1: Color
    var color2: Color
}

//var handbooksCollection = [
//    HandbookItem(title: "SwiftUI Handbook", subtitle: "80 sections - 9 hours", text: "A comprehensive series of tutorials covering Xcode, SwiftUI and all the layout and development techniques", logo: "Logo 1", image: "Illustration 1", color1: .teal, color2: .blue),
//    HandbookItem(title: "React Advanced Handbook", subtitle: "30 sections - 3 hours", text: "A comprehensive guide for an overview of the React library and all its basics", logo: "Logo 1", image: "Illustration 2", color1: .purple, color2: .pink)
//]
var handbooksCollection = [
    HandbookItem(title: "这是第一本书（名字还没想好呢）1", subtitle: "在这里写点介绍副标题吧1", text: "哼哼哼哼哼哼哼哼哼哼哼哼哼哼哼哼哼哼哼哼哼哼哼哼哼哼哼哼哼哼哼哼哼哼哼哼哼哼哼哼哼哼哼哼", logo: "Logo 1", image: "Illustration 1", color1: .teal, color2: .blue),
    HandbookItem(title: "这是第一本书（名字还没想好呢）2", subtitle: "在这里写点介绍副标题吧2", text: "哼哼哼哼哼哼哼哼哼哼哼哼哼哼哼哼哼哼哼哼哼哼哼哼哼哼哼哼哼哼哼哼哼哼哼哼哼哼哼哼哼哼哼哼", logo: "Logo 1", image: "Illustration 2", color1: .purple, color2: .pink)
]


