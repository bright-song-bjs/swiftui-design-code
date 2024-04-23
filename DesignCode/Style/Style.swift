import SwiftUI


struct CustomBorderStroke: ViewModifier
{
    var cornerRadius: CGFloat
    var strength: CGFloat
    @Environment(\.colorScheme) var colorScheme
    
    func body(content: Content) -> some View
    {
        content.overlay(
            RoundedRectangle(cornerRadius: self.cornerRadius, style: .continuous)
                .stroke(
                    .linearGradient(colors: [.white.opacity((self.colorScheme == .dark ? 0.15 : 0.3) * self.strength), .black.opacity((self.colorScheme == .dark ? 0.3 : 0.07) * self.strength)], startPoint: .top, endPoint: .bottom),
                    lineWidth: 1.5
                )
                .blendMode(.overlay)
        )
    }
}


struct CustomInputBar: ViewModifier
{
    var icon: String
    
    func body(content: Content) -> some View
    {
        content
            .padding(15)
            .padding(.leading, 40)
            .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 20, style: .continuous))
            .customBorderStroke(cornerRadius: 20)
            .overlay(
                Image(systemName: self.icon)
                    .foregroundStyle(.secondary)
                    .frame(width: 36, height: 36)
                    .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 14, style: .continuous))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(8)
                    .accessibilityAddTraits(.isHeader)
            )
    }
}

struct CustomSectionTitle: ViewModifier
{
    func body(content: Content) -> some View
    {
        content
            .font(.footnote.weight(.semibold))
            .foregroundColor(.secondary)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(22)
    }
}


struct AnimatableFont: Animatable, ViewModifier
{
    var size: CGFloat
    var weight: Font.Weight
    var design: Font.Design
    
    var animatableData: CGFloat
    {
        get { return self.size }
        set { self.size = newValue }
    }
    
    func body(content: Content) -> some View
    {
        content.font(.system(size: self.size, weight: self.weight, design: self.design))
    }
}


struct AngularButtonStyle: ButtonStyle
{
    @Environment(\.controlSize) var controlSize
    var extraPadding: CGFloat
    {
        switch self.controlSize
        {
            case .mini:
                return 0
            case .small:
                return 0
            case .regular:
                return 4
            case .large:
                return 12
            @unknown default:
                return 0
        }
    }
    var cornerRadius: CGFloat
    {
        switch self.controlSize
        {
            case .mini:
                return 12
            case .small:
                return 12
            case .regular:
                return 16
            case .large:
                return 20
            @unknown default:
                return 12
        }
    }
    
    func makeBody(configuration: Configuration) -> some View
    {
        configuration.label
            .padding(.horizontal, 10 + self.extraPadding)
            .padding(.vertical, 4 + self.extraPadding)
            .background(
                RoundedRectangle(cornerRadius: self.cornerRadius, style: .continuous)
                    .fill(.linearGradient(colors: [Color(.systemBackground), Color(.systemBackground).opacity(0.5)], startPoint: .top, endPoint: .bottom))
                    .blendMode(.softLight)
            )
            .background(
                RoundedRectangle(cornerRadius: self.cornerRadius, style: .continuous)
                    .fill(.angularGradient(colors: [.pink, .purple, .blue, .pink], center: .center, startAngle: .degrees(-90), endAngle: .degrees(270)))
                    .blur(radius: self.cornerRadius / 2)
            )
            .customBorderStroke(cornerRadius: self.cornerRadius)
    }
}


extension View
{
    func customBorderStroke(cornerRadius: CGFloat = 30.0, strength: CGFloat = 1.0) -> some View
    {
        return modifier(CustomBorderStroke(cornerRadius: cornerRadius, strength: strength))
    }
    
    func animatableFont(size: CGFloat, weight: Font.Weight = .regular, design: Font.Design = .default) -> some View
    {
        return modifier(AnimatableFont(size: size, weight: weight, design: design))
    }
    
    func customInputBar(icon: String = "mail") -> some View
    {
        return modifier(CustomInputBar(icon: icon))
    }
    
    func customSectionTitle() -> some View
    {
        return modifier(CustomSectionTitle())
    }
}


extension ButtonStyle where Self == AngularButtonStyle
{
    static var angular: Self
    {
        return AngularButtonStyle()
    }
}
