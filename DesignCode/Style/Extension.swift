import SwiftUI


extension Animation
{
    static let openCard = Animation.spring(response: 0.5, dampingFraction: 0.7)
    static let closeCard = Animation.spring(response: 0.6, dampingFraction: 0.9)
    static let restoreCard = Animation.spring(response: 1.0, dampingFraction: 0.4)
    static let showAndHideStatusBar = Animation.spring(response: 1, dampingFraction: 0.5)
}
