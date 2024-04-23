import SwiftUI


struct TopicItem: Identifiable
{
    let id = UUID()
    var title: String
    var icon: String
}

//var topicsCollection = [
//    TopicItem(title: "iOS Development", icon: "iphone"),
//    TopicItem(title: "UI Design", icon: "eyedropper"),
//    TopicItem(title: "Web development", icon: "laptopcomputer")
//]
var topicsCollection = [
    TopicItem(title: "词穷了真的词穷了1", icon: "iphone"),
    TopicItem(title: "词穷了真的词穷了2", icon: "eyedropper"),
    TopicItem(title: "词穷了真的词穷了3", icon: "laptopcomputer")
]
