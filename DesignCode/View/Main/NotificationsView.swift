import SwiftUI


struct NotificationsView: View
{
    var body: some View
    {
        ZStack
        {
            Color("Background")
                .ignoresSafeArea()
            
            ScrollView
            {
                self.sections
            }
            .safeAreaInset(edge: .top)
            {
                Color.clear.frame(height: 70)
            }
            .overlay(NavigationBar(title: "Notifications", hasScrolled: .constant(true)))
            .background(Image("Blob 1").offset(x: -180, y: 300))
        }
    }
    
    private var sections: some View
    {
        VStack(alignment: .leading)
        {
            ForEach(Array(courseSections.enumerated()), id: \.offset)
            {
                (index, section) in
                if index != 0 { Divider() }
                
                SectionRow(section: section)
            }
        }
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
        .customBorderStroke(cornerRadius: 30)
        .padding(20)
    }
}


struct NotificationView_Previews: PreviewProvider
{
    static var previews: some View
    {
        NotificationsView()
    }
}
