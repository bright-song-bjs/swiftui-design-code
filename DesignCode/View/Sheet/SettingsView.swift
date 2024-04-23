import SwiftUI


struct SettingsView: View
{
    var body: some View
    {
        ZStack
        {
            Image("Background 5")
                .resizable()
                .ignoresSafeArea()
            
            VStack
            {
                Spacer()
                
                Text("Settings")
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


struct SettingsView_Previews: PreviewProvider
{
    static var previews: some View
    {
        SettingsView()
    }
}
