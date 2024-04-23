import SwiftUI


struct HelpView: View
{
    var body: some View
    {
        ZStack
        {
            Image("Background 7")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            
            VStack
            {
                Spacer()
                
                Text("Help")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.primary)
                
                Text("Implement in the future")
                    .font(.caption.weight(.semibold))
                    .foregroundStyle(.secondary)
                
                Spacer()
            }
        }
    }
}


struct HelpView_Previews: PreviewProvider
{
    static var previews: some View
    {
        HelpView()
    }
}
