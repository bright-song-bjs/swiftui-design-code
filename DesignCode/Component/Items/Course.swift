import SwiftUI


struct Course: View
{
    var course: CourseItem = coursesCollection[0]
    var nameSpace: Namespace.ID
    @Binding var show: Bool
    
    
    var body: some View
    {
        VStack
        {
            Spacer()
            
            VStack(alignment: .leading, spacing: 12)
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
            .padding(20)
            .background(
                Rectangle()
                    .fill(.ultraThinMaterial)
                    .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                    .blur(radius: 23)
                    .matchedGeometryEffect(id: "blur\(self.course.id)", in: self.nameSpace)
            )
        }
        .background(
            Image(self.course.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(20)
                .matchedGeometryEffect(id: "image\(self.course.id)", in: self.nameSpace)
        )
        .background(
            Image(self.course.background)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .matchedGeometryEffect(id: "background\(self.course.id)", in: self.nameSpace)
        )
        .mask(
            RoundedRectangle(cornerRadius: 30.0, style: .continuous)
                .matchedGeometryEffect(id: "mask\(self.course.id)", in: self.nameSpace)
        )
        .frame(height: 300) 
    }
}


struct CourseItem_Previews: PreviewProvider
{
    @Namespace static var nameSpace
    
    static var previews: some View
    {
        Course(nameSpace: CourseItem_Previews.nameSpace, show: .constant(true))
    }
}
