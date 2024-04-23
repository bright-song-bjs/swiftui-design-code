import SwiftUI


struct ContentView: View
{
    @AppStorage("selectedTab") var selectedTab: Tab = .home
    @AppStorage("showModal") var showModal: Bool = false
    @EnvironmentObject var model: Model
    
    
    var body: some View
    {
        ZStack(alignment: .bottom)
        {
            switch self.selectedTab
            {
                case .home:
                    HomeView()
                
                case .explore:
                    ExploreView()
                      
                case .notifications:
                    NotificationsView()
                       
                case .library:
                    LibraryView()
            }
            
            TabBar()
                .offset(y: self.model.showDetail ? 200 : 0)
            
            if self.showModal
            {
                ModalView()
                    .zIndex(1)
            }
        }
        .safeAreaInset(edge: .bottom)
        {
            Color.clear.frame(height: 88)
        }
        .dynamicTypeSize(.large ... .xxLarge)
    }
}

struct ContentView_Previews: PreviewProvider
{
    static var previews: some View
    {
        Group
        {
            ContentView()
                .preferredColorScheme(.light)
            
            ContentView()
                .preferredColorScheme(.dark)
        }
        .previewInterfaceOrientation(.portrait)
        .environmentObject(Model())
    }
}
