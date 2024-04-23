import SwiftUI


struct FeaturedCourse: View
{
    var featuredCourse: CourseItem = featuredCoursesCollection[0]
    @Environment(\.sizeCategory) var sizeCategory
    
    
    var body: some View
    {
        VStack(alignment: .leading, spacing: 8.0)
        {
            Spacer()
            
            Image(self.featuredCourse.logo)
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fit)
                .frame(width: 26.0, height: 26.0)
                .mask(RoundedRectangle(cornerRadius: 9.5, style: .continuous))
                .padding(8.0)
                .background(Color(.systemBackground).opacity(0.1), in: RoundedRectangle(cornerRadius: 15.0, style: .continuous))
                .customBorderStroke(cornerRadius: 15.0)
            
            Text(self.featuredCourse.title)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(.linearGradient(colors: [.primary, .primary.opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing))
                .lineLimit(1)
                .dynamicTypeSize(.large)
            
            Text(self.featuredCourse.subtitle.uppercased())
                .font(.footnote)
                .fontWeight(.semibold)
                .foregroundStyle(.secondary)
            
            Text(self.featuredCourse.text)
                .font(.footnote)
                .multilineTextAlignment(.leading)
                .lineLimit(self.sizeCategory > .large ? 1 : 2)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundStyle(.secondary)
        }
        .padding(.all, 20.0)
        .padding(.vertical, 20.0)
        .frame(height: 350.0)
        .background(.thinMaterial)
        .mask(RoundedRectangle(cornerRadius: 30.0, style: .continuous))
        .customBorderStroke(cornerRadius: 30.0)
        .padding(.horizontal, 20.0)
    }
}

struct FeaturedItem_Previews: PreviewProvider
{
    static var previews: some View
    {
        FeaturedCourse()
    }
}
