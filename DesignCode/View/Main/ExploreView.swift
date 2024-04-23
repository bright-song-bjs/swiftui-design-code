import SwiftUI


struct ExploreView: View
{
    var body: some View
    {
        ZStack
        {
            Color("Background").ignoresSafeArea()
            
            ScrollView
            {
                self.coursesSection
                
                Text("Topics".uppercased())
                    .customSectionTitle()
                
                self.topicsSection
                
                Text("Popular".uppercased())
                    .customSectionTitle()
                
                self.handbooksSection
            }
            .safeAreaInset(edge: .top)
            {
                Color.clear.frame(height: 70)
            }
            .overlay(NavigationBar(title: "Recent", hasScrolled: .constant(true)))
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
    
    private var handbooksSection: some View
    {
        HStack(alignment: .top, spacing: 16)
        {
            ForEach(handbooksCollection)
            {
                (handbook) in
                Handbook(handbook: handbook)
            }
        }
        .padding(.horizontal, 16)
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


struct ExploreView_Previews: PreviewProvider
{
    static var previews: some View
    {
        ExploreView()
    }
}
