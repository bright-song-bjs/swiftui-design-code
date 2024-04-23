import SwiftUI


struct AvatarView: View
{
    @AppStorage("isLogged") var isLogged: Bool = false
    
    
    var body: some View
    {
        Group
        {
            if self.isLogged
            {
                AsyncImage(url: URL(string: "https://picsum.photos/200"), transaction: Transaction(animation: .easeOut))
                {
                    (phase) in
                    switch phase
                    {
                        case .success(let image):
                            image
                                .resizable()
                                .transition(.scale(scale: 0.5, anchor: .center))
                        
                        case .empty:
                            ProgressView()
                        
                        case .failure(_):
                            Image("Avatar 3")
                                .resizable()
                        
                        @unknown default:
                            Image("Avatar Default")
                    }
                }
            }
            else
            {
                Image("Avatar Default")
                    .resizable()
            }
        }
        .frame(width: 22, height: 22)
        .cornerRadius(10)
        .padding(7)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 14, style: .continuous))
        .customBorderStroke(cornerRadius: 14, strength: 8)
    }
}


struct AvatarView_Previews: PreviewProvider
{
    static var previews: some View
    {
        AvatarView()
    }
}
