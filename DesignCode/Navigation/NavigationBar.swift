import SwiftUI


struct NavigationBar: View
{
    var title = "Featured"
    @Binding var hasScrolled: Bool
    @State var showSearch: Bool = false
    @State var showAccount: Bool = false
    @AppStorage("showModal") var showModal: Bool = false
    @AppStorage("isLogged") var isLogged: Bool = false
    
    
    var body: some View
    {
        ZStack
        {
            Color.clear
                .background(.ultraThinMaterial)
                .blur(radius: 11)
                .opacity(self.hasScrolled ? 1.0 : 0)
            
            Text(self.title)
                .animatableFont(size: self.hasScrolled ? 22 : 34, weight: .bold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 20)
                .padding(.top, 20)
                .offset(y: self.hasScrolled ? -5 : 0)
            
            HStack(spacing: 12)
            {
                Button
                {
                    self.showSearch = true
                }
                label:
                {
                    Image(systemName: "magnifyingglass")
                        .font(.body.weight(.bold))
                        .frame(width: 36, height: 36)
                        .foregroundStyle(.secondary)
                        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 14, style: .continuous))
                        .customBorderStroke(cornerRadius: 14, strength: 8)
                }
                .sheet(isPresented: self.$showSearch)
                {
                    SearchView()
                }
                
                Button
                {
                    if self.isLogged
                    {
                        self.showAccount = true
                    }
                    else
                    {
                        withAnimation
                        {
                            self.showModal = true
                        }
                    }
                }
                label:
                {
                    AvatarView()
                }
                .accessibilityElement()
                .accessibilityLabel("Account")
                .accessibilityAddTraits(.isButton)
                .sheet(isPresented: self.$showAccount)
                {
                    AccountView()
                }
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            .padding(.trailing, 20)
            .padding(.top, 20)
            .offset(y: self.hasScrolled ? -5 : 0)
        }
        .frame(height: self.hasScrolled ? 44 : 70)
        .frame(maxHeight: .infinity, alignment: .top)
    }
}

struct NavigationBar_Previews: PreviewProvider
{
    static var previews: some View
    {
        NavigationBar(hasScrolled: .constant(false))
        
        NavigationBar(hasScrolled: .constant(false))
            .preferredColorScheme(.dark)
    }
}
