import SwiftUI


struct SmallCourse: View
{
    var course: CourseItem = coursesCollection[0]
    
    
    var body: some View
    {
        VStack(alignment: .leading)
        {
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(.black.opacity(0.1))
                .overlay(
                    Image(self.course.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150, height: 105)
                )
            
            Text(self.course.subtitle)
                .font(.caption)
                .foregroundColor(.secondary)
                .lineLimit(1)
            
            Text(self.course.title)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding()
        .frame(width: 160, height: 200)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
        .customBorderStroke(cornerRadius: 30)
    }
}


struct SmallCourse_Previews: PreviewProvider
{
    static var previews: some View
    {
        SmallCourse()
    }
}
