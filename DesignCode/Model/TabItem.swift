import SwiftUI


struct TabItem: Identifiable
{
    var id = UUID()
    var tab: Tab
    var text: String
    var icon: String
    var color: Color
}


//var tabItems = [
//    TabItem(tab: .home, text: "Learn Now", icon: "house", color: .teal),
//    TabItem(tab: .explore, text: "Explore", icon: "magnifyingglass", color: .blue),
//    TabItem(tab: .notifications, text: "Notifications", icon: "bell", color: .red),
//    TabItem(tab: .library, text: "Library", icon: "rectangle.stack", color: .pink)
//]
var tabItems = [
    TabItem(tab: .home, text: "未知", icon: "house", color: .teal),
    TabItem(tab: .explore, text: "未知", icon: "magnifyingglass", color: .blue),
    TabItem(tab: .notifications, text: "未知", icon: "bell", color: .red),
    TabItem(tab: .library, text: "未知", icon: "rectangle.stack", color: .pink)
]


enum Tab: String
{
    case home
    case explore
    case notifications
    case library
}
