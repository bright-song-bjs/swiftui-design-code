import SwiftUI


struct CircularView: View
{
    var value: CGFloat = 0.2
    var lineWidth: Double = 4
    @State var appear = false
    
    
    var body: some View
    {
        Circle()
            .trim(from: 0, to: self.appear ? self.value : 0)
            .stroke(style: StrokeStyle(lineWidth: self.lineWidth, lineCap: .round))
            .fill(.angularGradient(colors: [.purple, .pink, .purple], center: .center, startAngle: .degrees(0), endAngle: .degrees(360)))
            .rotationEffect(.degrees(270))
            .onAppear
            {
                withAnimation(.spring().delay(0.5))
                {
                    self.appear = true
                }
            }
            .onDisappear
            {
                self.appear = false
            }
    }
}


struct CircularView_Previews: PreviewProvider
{
    static var previews: some View
    {
        CircularView()
    }
}
