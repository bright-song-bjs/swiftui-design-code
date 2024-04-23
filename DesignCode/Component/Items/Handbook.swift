import SwiftUI


struct Handbook: View
{
    var handbook: HandbookItem = handbooksCollection[0]
    
    
    var body: some View
    {
        VStack(alignment: .leading, spacing: 8)
        {
            RoundedRectangle(cornerRadius: 20)
                .fill(.black.opacity(0.2))
                .frame(height: 90)
                .overlay(
                    Image(self.handbook.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150, height: 100)
                )
            
            Text(self.handbook.title)
                .fontWeight(.semibold)
                .layoutPriority(1)
            
            Text(self.handbook.subtitle)
                .font(.caption.weight(.medium))
                .foregroundStyle(.secondary)
            
            Text(self.handbook.text)
                .font(.caption)
                .foregroundStyle(.secondary)
                .lineLimit(4)
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: 200)
        .frame(height: 260)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
        .customBorderStroke(cornerRadius: 30)
        .background(
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .fill(.linearGradient(colors: [self.handbook.color1, self.handbook.color2], startPoint: .topLeading, endPoint: .bottomTrailing))
                .rotation3DEffect(.degrees(10), axis: (x: 0, y: 1, z: 0), anchor: .bottomTrailing)
                .rotationEffect(.degrees(180))
                .padding(.trailing, 40)
        )
    }
}


struct Handbook_Previews: PreviewProvider
{
    static var previews: some View
    {
        Handbook()
    }
}
