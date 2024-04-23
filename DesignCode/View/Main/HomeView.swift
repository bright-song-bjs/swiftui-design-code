import SwiftUI


struct HomeView: View
{
    @State var hasScrolled: Bool = false
    @State var show = false
    @State var showStatusBar = true
    @State var selectedID = UUID()
    @State var showFeaturedCourse: Bool = false
    @State var selectedIndex: Int = 0
    @Namespace var nameSpace
    @EnvironmentObject var model: Model
    @AppStorage("isLiteMode") var isLiteMode: Bool = false

    
    var body: some View
    {
        ZStack
        {
            Color("Background").ignoresSafeArea()
            
            ScrollView
            {
                self.scrollDetection
                
                self.featuredCourse
                
                Text("Courses".uppercased())
                    .customSectionTitle()
                
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 300), spacing: 20)], spacing: 20)
                {
                    if !self.show
                    {
                        self.cards
                    }
                    else
                    {
                        ForEach(coursesCollection)
                        {
                            _ in
                            Rectangle()
                                .fill(.white)
                                .frame(height: 300)
                                .cornerRadius(30)
                                .shadow(color: Color("Shadow"), radius: 20, x: 0, y: 10)
                                .opacity(0.3)
                                .padding(.horizontal, 30)
                        }
                    }
                }
                .padding(.horizontal, 20)
            }
            .coordinateSpace(name: "scrollView")
            .safeAreaInset(edge: .top)
            {
                Color.clear.frame(height: 70)
            }
            .overlay(
                NavigationBar(title: "Featured", hasScrolled: self.$hasScrolled)
            )
            
            if self.show
            {
                self.detail
            }
        }
        .onChange(of: self.show)
        {
            (newValue) in
            withAnimation(.showAndHideStatusBar)
             {
                self.showStatusBar = !newValue
            }
        }
        .statusBar(hidden: !self.showStatusBar)
    }
    
    private var scrollDetection: some View
    {
        GeometryReader
        {
            (proxy) in
            Color.clear.preference(key: ScrollPreferenceKey.self, value: proxy.frame(in: .named("scrollView")).minY)
        }
        .frame(height: 0)
        .onPreferenceChange(ScrollPreferenceKey.self)
        {
            (value) in
            withAnimation(.easeInOut)
            {
                self.hasScrolled = value < -10 ? true : false
            }
        }
    }
    
    private var featuredCourse: some View
    {
        TabView
        {
            ForEach(Array(featuredCoursesCollection.enumerated()), id: \.offset)
            {
                (index, featuredCourse) in
                GeometryReader
                {
                    (proxy) in
                    let minX = proxy.frame(in: .global).minX
                    
                    FeaturedCourse(featuredCourse: featuredCourse)
                        .frame(maxWidth: 500)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 40)
                        .rotation3DEffect(.degrees(minX / -10), axis: (x: 0.0, y: 1.0, z: 0.0))
                        .shadow(color: Color("Shadow").opacity(self.isLiteMode ? 0 : 0.3), radius: 15.0, x: 0, y: 8.0)
                        .blur(radius: abs(minX) / 135)
                        .overlay(
                            Image(featuredCourse.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 230.0)
                                .offset(x: 32.0, y: -85.0)
                                .offset(x: minX / 1.8)
                                .rotation3DEffect(.degrees(minX / -7.5), axis: (x: 0.0, y: 1.0, z: 0.0))
                        )
                        .onTapGesture
                        {
                            self.showFeaturedCourse = true
                            self.selectedIndex = index
                        }
                        .accessibilityElement(children: .combine)
                        .accessibilityAddTraits(.isButton)
                }
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .frame(height: 430)
        .background(
            Image("Blob 1")
                .offset(x: 250.0, y: -100.0)
                .accessibility(hidden: true)
        )
        .sheet(isPresented: self.$showFeaturedCourse)
        {
            CourseView(nameSpace: self.nameSpace, course: featuredCoursesCollection[self.selectedIndex], show: self.$showFeaturedCourse)
        }
    }
    
    private var cards: some View
    {
        ForEach(coursesCollection)
        {
            (course) in
            Course(course: course, nameSpace: self.nameSpace, show: self.$show)
                .onTapGesture
                {
                    withAnimation(.openCard)
                    {
                        self.show.toggle()
                        self.model.showDetail.toggle()
                        self.selectedID = course.id
                    }
                }
                .accessibilityElement(children: .combine)
                .accessibilityAddTraits(.isButton)
        }
    }
    
    private var detail: some View
    {
        ForEach(coursesCollection)
        {
            (course) in
            if course.id == self.selectedID
            {
                CourseView(nameSpace: self.nameSpace, course: course, show: self.$show)
                    .zIndex(1)
                    .transition(.asymmetric(
                        insertion: .opacity.animation(.easeInOut(duration: 0.1)),
                        removal: .opacity.animation(.easeInOut(duration: 0.3).delay(0.2))
                    ))
            }
        }
    }
}


struct HomeView_Previews: PreviewProvider
{
    static var previews: some View
    {
        Group
        {
            HomeView()
            HomeView()
                .preferredColorScheme(.dark)
            HomeView()
                .previewDevice("iPhone 8 Plus")
        }
        .environmentObject(Model())
    }
}
