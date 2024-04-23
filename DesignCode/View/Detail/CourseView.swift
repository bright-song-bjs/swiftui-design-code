import SwiftUI


struct CourseView: View
{
    var nameSpace: Namespace.ID
    var course: CourseItem = coursesCollection[0]
    @Binding var show: Bool
    @State var viewState: CGSize = .zero
    @State var isDraggable: Bool = true
    @State var appear: [String: Bool] = [
        "divider": false,
        "author": false,
        "content": false,
        "button": false
    ]
    @EnvironmentObject var model: Model
    @State var showSection = false
    @State var selectedIndex = 0
    
    
    var body: some View
    {
        ZStack
        {
            ScrollView
            {
                self.cover
                
                self.content
                    .offset(y: 120)
                    .padding(.bottom, 200)
                    .opacity(self.appear["content"]! ? 1 : 0)
            }
            .coordinateSpace(name: "scrollView")
            .onAppear
            {
                self.model.showDetail = true
            }
            .onDisappear
            {
                self.model.showDetail = false
            }
            .background(Color("Background"))
            .mask(RoundedRectangle(cornerRadius: self.viewState.width / 2.5, style: .continuous))
            .shadow(color: .blue.opacity(0.3), radius: 30, x: 0, y: 10)
            .scaleEffect(-self.viewState.width / 500 + 1)
            .background(.black.opacity(self.viewState.width / 600))
            .background(.ultraThinMaterial)
            .gesture(self.isDraggable ? self.drag : nil)
            .ignoresSafeArea()
            
            self.button
                .opacity(self.appear["button"]! ? 1 : 0)
        }
        .onAppear
        {
            self.fadeIn()
        }
    }
    
    private var cover: some View
    {
        GeometryReader
        {
            (proxy) in
            let scrollY = max(proxy.frame(in: .named("scrollView")).minY, 0) 
            
            VStack
            {
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .frame(height: 500 + scrollY)
            .foregroundStyle(.black)
            .background(
                Image(self.course.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(20)
                    .frame(maxWidth: 500)
                    .matchedGeometryEffect(id: "image\(self.course.id)", in: self.nameSpace)
                    .offset(y: -scrollY * 0.85)
                    .accessibilityLabel("Cover Image")
            )
            .background(
                Image(self.course.background)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .matchedGeometryEffect(id: "background\(self.course.id)", in: self.nameSpace)
                    .offset(y: -scrollY)
                    .scaleEffect(1 + scrollY / 2500)
                    .blur(radius: scrollY / 40)
            )
            .mask(
                RoundedRectangle(cornerRadius: self.appear["button"]! ? 0 : 30, style: .continuous)
                    .matchedGeometryEffect(id: "mask\(self.course.id)", in: self.nameSpace)
                    .offset(y: -scrollY)
            )
            .overlay(
                self.overlayContent
                    .offset(y: -scrollY * 0.6)
            )
        }
        .frame(height: 500)
    }
    
    private var overlayContent: some View
    {
        VStack(alignment: .leading, spacing: 12)
        {
            Group
            {
                Text(self.course.title)
                    .font(.largeTitle.weight(.bold))
                    .matchedGeometryEffect(id: "title\(self.course.id)", in: self.nameSpace)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text(self.course.subtitle.uppercased())
                    .font(.footnote.weight(.semibold))
                    .matchedGeometryEffect(id: "subtitle\(self.course.id)", in: self.nameSpace)
                
                Text(self.course.text)
                    .font(.footnote)
                    .matchedGeometryEffect(id: "text\(self.course.id)", in: self.nameSpace)
            }
            
            Divider()
                .opacity(self.appear["divider"]! ? 1 : 0)
            
            HStack
            {
                Image("Avatar Default")
                    .resizable()
                    .frame(width: 22, height: 22)
                    .cornerRadius(10)
                    .padding(7)
                    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 14, style: .continuous))
                    .customBorderStroke(cornerRadius: 14, strength: 8)
                
//                Text("Taught by Meng To")
//                    .font(.footnote)
                Text("AAAAAAAAAAAAAAAAAA")
                    .font(.footnote)
            }
            .opacity(self.appear["author"]! ? 1 : 0)
        }
        .padding(20)
        .background(
            Rectangle()
                .fill(.ultraThinMaterial)
                .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .matchedGeometryEffect(id: "blur\(self.course.id)", in: self.nameSpace)
        )
        .offset(y: 250)
        .padding(20)
    }
    
    private var content: some View
    {
        VStack(alignment: .leading)
        {
            ForEach(Array(courseSections.enumerated()), id: \.offset)
            {
                (index, section) in
                if index != 0 { Divider() }
                
                SectionRow(section: section)
                    .onTapGesture
                    {
                        self.selectedIndex = index
                        self.showSection = true
                    }
            }
        }
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
        .customBorderStroke(cornerRadius: 30)
        .padding(20)
        .sheet(isPresented: $showSection)
        {
            SectionView(section: courseSections[selectedIndex])
        }
    }
    
    private var button: some View
    {
        Button
        {
            self.close()
        }
        label:
        {
            Image(systemName: "xmark")
                .font(.body.weight(.bold))
                .foregroundStyle(.secondary)
                .padding(8)
                .background(.thinMaterial, in: Circle())
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
        .padding(20)
        .ignoresSafeArea()
    }
    
    private var drag: some Gesture
    {
        DragGesture(minimumDistance: 30, coordinateSpace: .local)
            .onChanged
            {
                (value) in
                
                if value.translation.width < 0 { return }
                
                if value.startLocation.x < 100
                {
                    withAnimation(.closeCard)
                    {
                        self.viewState = value.translation
                    }
                }
                
                if self.viewState.width > 120
                {
                    self.close()
                }
            }
            .onEnded
            {
                _ in
                
                if self.viewState.width > 80
                {
                    self.close()
                }
                else
                {
                    withAnimation(.restoreCard)
                    {
                        self.viewState = .zero
                    }
                }
            }
        //FIXME: Drag turn back gesture bug: hold and left swipe not returning to homeView
    }
    
    private func fadeIn()
    {
        withAnimation(.easeInOut.delay(0.3)) { self.appear["divider"] = true }
        withAnimation(.easeInOut.delay(0.4)) { self.appear["author"] = true }
        withAnimation(.easeInOut.delay(0.3)) { self.appear["content"] = true }
        withAnimation(.easeInOut.delay(0.2)) { self.appear["button"] = true }
    }
    
    private func fadeOut()
    {
        for (i, _) in self.appear
        {
            self.appear[i] = false
        }
    }
    
    private func close()
    {
        withAnimation(.restoreCard)
        {
            self.viewState = .zero
        }
        
        withAnimation(.closeCard.delay(0.1))
        {
            self.show.toggle()
            self.model.showDetail.toggle()
        }

        self.fadeOut()
        self.isDraggable = false
    }
}


struct CourseView_Previews: PreviewProvider
{
    @Namespace static var nameSpace
    
    static var previews: some View
    {
        CourseView(nameSpace: CourseView_Previews.nameSpace, show: .constant(true))
            .environmentObject(Model())
    }
}
