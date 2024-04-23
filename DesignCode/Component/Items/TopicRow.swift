import SwiftUI


struct TopicRow: View
{
    var topic: TopicItem = topicsCollection[0]
    
    
    var body: some View
    {
        HStack(spacing: 16)
        {
            Image(systemName: topic.icon)
                .frame(width: 36, height: 36)
                .background(.ultraThinMaterial)
                .mask(Circle())
            
            Text(topic.title)
                .fontWeight(.semibold)
            
            Spacer()
        }
    }
}


struct TopicRow_Previews: PreviewProvider
{
    static var previews: some View
    {
        TopicRow()
    }
}
