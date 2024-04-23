import SwiftUI


struct BillingView: View
{
    var body: some View
    {
        ZStack
        {
            Image("Background 2")
                .resizable()
                .ignoresSafeArea()
            
            VStack
            {
                Spacer()
                
                Text("Billing")
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


struct BillingView_Previews: PreviewProvider
{
    static var previews: some View
    {
        BillingView()
    }
}
