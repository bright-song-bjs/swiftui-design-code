import SwiftUI


struct TabBar: View
{
    @AppStorage("selectedTab") var selectedTab: Tab = .home
    @State var color: Color = .teal
    @State var tabItemWidth: CGFloat = 0.0
    
    
    var body: some View
    {
        GeometryReader
        {
            (proxy) in
            let hasHomeIndicator = proxy.safeAreaInsets.bottom - 88 > 20
            
            HStack
            {
                self.buttons
            }
            .padding(.horizontal, 14)
            .padding(.top, hasHomeIndicator ? 14 : 8)
            .frame(height: hasHomeIndicator ? 88 : 62 , alignment: .top)
            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: hasHomeIndicator ? 34 : 0, style: .continuous))
            .background(self.background)
            .overlay(self.overlay)
            .customBorderStroke(cornerRadius: hasHomeIndicator ? 34 : 0)
            .frame(maxHeight: .infinity, alignment: .bottom)
            .ignoresSafeArea()
        }
    }
    
    private var buttons: some View
    {
        ForEach(tabItems)
        {
            (tabItem) in
            
            Button
            {
                withAnimation(.spring(response: 0.3, dampingFraction: 0.6))
                {
                    self.selectedTab = tabItem.tab
                    self.color = tabItem.color
                }
            }
            label:
            {
                VStack(spacing: 0)
                {
                    Image(systemName: tabItem.icon)
                        .symbolVariant(.fill)
                        .font(.body.bold())
                        .frame(width: 44, height: 29)
                    
                    Text(tabItem.text)
                        .font(.caption2)
                        .lineLimit(1)
                }
                .frame(maxWidth: .infinity)
            }
            .foregroundStyle(self.selectedTab == tabItem.tab ? .primary : .secondary)
            .blendMode(self.selectedTab == tabItem.tab ? .overlay : .normal)
            .overlay(
                GeometryReader
                {
                    (proxy) in
                    Color.clear.preference(key: TabPreferenceKey.self, value: proxy.size.width)
                }
            )
            .onPreferenceChange(TabPreferenceKey.self)
            {
                (value) in
                self.tabItemWidth = value
            }
        }
    }
    
    private var background: some View
    {
        HStack
        {
            if self.selectedTab == .library { Spacer() }
            if self.selectedTab == .explore { Spacer() }
            if self.selectedTab == .notifications { Spacer(); Spacer() }
            Circle()
                .fill(self.color)
                .opacity(0.75)
                .frame(width: self.tabItemWidth)
            if self.selectedTab == .home { Spacer() }
            if self.selectedTab == .explore { Spacer(); Spacer() }
            if self.selectedTab == .notifications { Spacer() }
        }
        .padding(.horizontal, 14)
    }
    
    private var overlay: some View
    {
        HStack
        {
            if self.selectedTab == .library { Spacer() }
            if self.selectedTab == .explore { Spacer() }
            if self.selectedTab == .notifications { Spacer(); Spacer() }
            Rectangle()
                .fill(self.color)
                .frame(width: 28, height: 5)
                .cornerRadius(2.5)
                .frame(width: self.tabItemWidth)
                .frame(maxHeight: .infinity, alignment: .top)
            if self.selectedTab == .home { Spacer() }
            if self.selectedTab == .explore { Spacer(); Spacer() }
            if self.selectedTab == .notifications { Spacer() }
        }
        .padding(.horizontal, 14)
    }
}


struct TabBar_Previews: PreviewProvider
{
    static var previews: some View
    {
        TabBar()
            .previewDevice("iPhone 8 Plus")
            .previewInterfaceOrientation(.portrait)
    }
}
