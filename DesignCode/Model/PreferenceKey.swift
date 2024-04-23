import SwiftUI


struct TabPreferenceKey: PreferenceKey
{
    static var defaultValue: CGFloat = 0.0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat)
    {
        value = nextValue()
    }
}


struct ScrollPreferenceKey: PreferenceKey
{
    static var defaultValue: CGFloat = 0.0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat)
    {
        value = nextValue()
    }
}


struct CirclePreferenceKey: PreferenceKey
{
    static var defaultValue: CGFloat = 0.0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat)
    {
        value = nextValue()
    }
}
