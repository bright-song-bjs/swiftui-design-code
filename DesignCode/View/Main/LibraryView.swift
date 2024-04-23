import SwiftUI


struct LibraryView: View
{
    var body: some View
    {
        ZStack
        {
            Color("Background").ignoresSafeArea()
            
            ScrollView
            {
                Certificate()
                    .frame(height: 220)
                    .background(
                        RoundedRectangle(cornerRadius: 30, style: .continuous)
                            .fill(.linearGradient(colors: [.purple, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
                            .padding(20)
                            .offset(y: -30)
                    )
                    .background(
                        RoundedRectangle(cornerRadius: 30, style: .continuous)
                            .fill(.linearGradient(colors: [.teal, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
                            .padding(40)
                            .offset(y: -58)
                    )
                    .padding(20)
                
                Text("History".uppercased())
                    .customSectionTitle()
                
                self.coursesSection
                
                Text("Topics".uppercased())
                    .customSectionTitle()
                
                self.topicsSection
            }
            .safeAreaInset(edge: .top)
            {
                Color.clear.frame(height: 70)
            }
            .overlay(NavigationBar(title: "Library", hasScrolled: .constant(true)))
            .background(
                Image("Blob 1")
                    .offset(x: -100, y: -400)
            )
        }
    }
    
    private var coursesSection: some View
    {
        ScrollView(.horizontal, showsIndicators: false)
        {
            HStack(spacing: 16)
            {
                ForEach(coursesCollection)
                {
                    (course) in
                    SmallCourse(course: course)
                }
            }
            .padding(.horizontal, 16)
        }
    }
    
    private var topicsSection: some View
    {
        VStack
        {
            ForEach(topicsCollection)
            {
                (topic) in
                TopicRow(topic: topic)
            }
        }
        .padding(20)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
        .customBorderStroke(cornerRadius: 30)
        .padding(.horizontal, 20)
    }
}


struct LibraryView_Previews: PreviewProvider
{
    static var previews: some View
    {
        LibraryView()
    }
}
