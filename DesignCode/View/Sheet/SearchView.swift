import SwiftUI


struct SearchView: View
{
    @State var text: String = ""
    @State var show: Bool = false
    @State var selectedIndex: Int = 0
    @Namespace var nameSpace
    @Environment(\.dismiss) var dismiss
    
    
    var body: some View
    {
        NavigationView
        {
            ScrollView
            {
                VStack
                {
                    self.content
                }
                .padding(20)
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
                .customBorderStroke(cornerRadius: 30, strength: 4)
                .padding(20)
                .background(
                    Rectangle()
                        .fill(.regularMaterial)
                        .frame(height: 200)
                        .frame(maxHeight: .infinity, alignment: .top)
                        .blur(radius: 20)
                        .offset(y: -200)
                )
                .background(
                    Image("Blob 1")
                        .offset(x: -100, y: -200)
                )
            }
            .searchable(text: self.$text, placement: .navigationBarDrawer(displayMode: .always), prompt: Text("SwiftUI, React, UI Design"))
            {
                ForEach(suggestionsCollection)
                {
                    (suggestion) in
                    Button
                    {
                        self.text = suggestion.text
                    }
                    label:
                    {
                        Text(suggestion.text)
                            .searchCompletion(suggestion.text)
                    }
                }
            }
            .navigationTitle("Search")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar
            {
                ToolbarItemGroup(placement: .navigationBarTrailing)
                {
                    Button
                    {
                        self.dismiss()
                    }
                    label: { Text("Done").bold() }
                }
            }
            .sheet(isPresented: self.$show)
            {
                CourseView(nameSpace: self.nameSpace, course: coursesCollection[self.selectedIndex], show: $show)
            }
        }
    }
    
    private var content: some View
    {
        ForEach(Array(coursesCollection.enumerated()), id: \.offset)
        {
            (index,  course) in
            
            if course.title.contains(self.text) || self.text == ""
            {
                if index != 0 { Divider() }
                
                Button
                {
                    self.show = true
                    self.selectedIndex = index
                }
                label:
                {
                    HStack(spacing: 12)
                    {
                        Image(course.image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 44, height: 44)
                            .background(Color("Background"))
                            .mask(Circle())
                        
                        VStack(alignment: .leading, spacing: 4)
                        {
                            Text(course.title)
                                .bold()
                                .foregroundStyle(.primary)
                            Text(course.text)
                                .font(.footnote)
                                .foregroundStyle(.secondary)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .multilineTextAlignment(.leading)
                        }
                    }
                    .padding(.vertical, 4)
                    .listRowSeparator(.hidden)
                }
            }
        }
    }
}


struct SearchView_Previews: PreviewProvider
{
    static var previews: some View
    {
        SearchView()
    }
}
