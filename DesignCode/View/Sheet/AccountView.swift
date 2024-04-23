import SwiftUI


struct AccountView: View
{
    @State var isDeleted: Bool = false
    @State var isPinned: Bool = false
    @State var address: Address = Address(id: 1, country: "Canada")
    @Environment(\.dismiss) var dismiss
    @AppStorage("isLogged") var isLogged: Bool = true
    @AppStorage("isLiteMode") var isLiteMode: Bool = false
    @ObservedObject var coinModel = CoinModel()
    
    
    var body: some View
    {
        NavigationView
        {
            List
            {
                self.profile
                
                self.menu
                
                Section
                {
                    Toggle(isOn: self.$isLiteMode)
                    {
                        Label("Lite Mode", systemImage: self.isLiteMode ? "tortoise" : "hare")
                    }
                }
                
                self.links
                
                self.coins
                
                Button
                {
                    self.isLogged = false
                    self.dismiss()
                }
                label:
                {
                    Text("Sign out")
                        .frame(maxWidth:.infinity, alignment: .center)
                }
                .tint(.red )
            }
            .task
            {
                await self.fetchAddress()
                await self.coinModel.fetchCoins()
            }
            .refreshable
            {
                await self.fetchAddress()
                await self.coinModel.fetchCoins()
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Account")
            .toolbar
            {
                ToolbarItemGroup(placement: .navigationBarTrailing)
                {
                    Button
                    {
                        self.dismiss()
                    }
                    label: { Text("Done").bold() }
                }
            }
        }
    }
    
    private var profile: some View
    {
        VStack(spacing: 5.0)
        {
            Image(systemName: "person.crop.circle.fill.badge.checkmark")
                .symbolVariant(.circle.fill)
                .font(.system(size: 32.0))
                .symbolRenderingMode(.palette)
                .foregroundStyle(.blue, .blue.opacity(0.3))
                .padding()
                .background(Circle().fill(.ultraThinMaterial))
                .background(
                    HexagonView()
                        .offset(x: -50.0, y: -100.0)
                )
                .background(
                    BlobView()
                        .offset(x: 200.0, y: 0)
                        .scaleEffect(0.6)
                )
            
            Text("Baijun Song")
                .font(.title)
                .fontWeight(.semibold)
            
            HStack
            {
                Image(systemName: "location")
                    .imageScale(.small )
                
                Text(self.address.country)
                    .foregroundColor(.secondary)
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.top, 8)
        .padding(.bottom, 15 )
    }
    
    private var menu: some View
    {
        Section
        {
            NavigationLink { SettingsView() }
            label:
            {
                Label("Settings", systemImage: "gear")
            }
            
            NavigationLink { BillingView() }
            label:
            {
                Label("Billing", systemImage: "creditcard")
            }
            
            NavigationLink { HelpView() }
            label:
            {
                Label("Help", systemImage: "questionmark")
            }
        }
        .tint(.primary)
        .listRowSeparator(.hidden)
    }
    
    private var links: some View
    {
        Section
        {
            if !self.isDeleted
            {
                Link(destination: URL(string: "http://apple.com")!)
                {
                    HStack
                    {
                        Label("Website", systemImage: "house")
                        
                        Spacer()
                        
                        Image(systemName: "link")
                            .foregroundColor(.secondary)
                    }
                }
                .swipeActions
                {
                    Button(action: { self.isDeleted = true })
                    {
                        Label("Delete", systemImage: "trash")
                    }
                    .tint(.red)
                    
                    self.pinButton
                }
            }
            
            Link(destination: URL(string: "http://bilibili.com")!)
            {
                HStack
                {
                    Label("bilibili", systemImage: "tv")
                    
                    Spacer()
                    
                    Image(systemName: "link")
                        .foregroundColor(.secondary)
                }
            }
            .swipeActions
            {
                self.pinButton
            }
        }
        .tint(.primary)
        .listRowSeparator(.hidden)
    }
    
    private var coins: some View
    {
        Section(header: Text("Coins"))
        {
            ForEach(self.coinModel.coins)
            {
                (coin) in
                HStack
                {
                    AsyncImage(url: URL(string: coin.logo))
                    {
                        (image) in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                    placeholder:
                    {
                        ProgressView()
                    }
                    .frame(width: 32, height: 32)
                    
                    VStack(alignment: .leading, spacing: 4)
                    {
                        Text(coin.coin_name)
                        Text(coin.acronym)
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
            }
        }
    }
    
    private var pinButton: some View
    {
        Button(action: { self.isPinned.toggle() })
        {
            if self.isPinned
            {
                Label("Unpin", systemImage: "pin.slash")
            }
            else
            {
                Label("Pin", systemImage: "pin")
            }
        }
        .tint(self.isPinned ? .gray : .yellow)
    }
    
    private func fetchAddress() async
    {
        do
        {
            let url = URL(string: "https://random-data-api.com/api/address/random_address")!
            let (data, _) = try await URLSession.shared.data(from: url)
            print(String(decoding: data, as: UTF8.self))
            self.address = try JSONDecoder().decode(Address.self, from: data)
        }
        catch
        {
            self.address = Address(id: 404, country: "Unknown Country")
        }
    }
}


struct AccountView_Previews: PreviewProvider
{
    static var previews: some View
    {
        AccountView()
            .preferredColorScheme(.light)
        AccountView()
            .preferredColorScheme(.dark)
    }
}
