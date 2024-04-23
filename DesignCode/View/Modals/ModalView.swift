import SwiftUI


struct ModalView: View
{
    @EnvironmentObject var model: Model
    @AppStorage("showModal") var showModal: Bool = true
    @AppStorage("isLogged") var isLogged: Bool = false
    @State var viewState: CGSize = .zero
    @State var isDismissed: Bool = false
    @State var appear: [String : Bool] = [
        "content": false,
        "button": false,
        "blob": false
    ]
    
    
    var body: some View
    {
        ZStack
        { 
            Color.clear.background(.thinMaterial)
                .onTapGesture
                {
                    self.dismissModal()
                }
                .ignoresSafeArea()
            
            Group
            {
                switch self.model.selectedModal
                {
                    case .signUp:
                        SignUpView()
                    case .signIn:
                        SignInView()
                }
            }
            .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .offset(x: self.viewState.width, y: self.viewState.height)
            .offset(y: self.isDismissed ? 1000 : 0)
            .rotationEffect(.degrees(self.viewState.width / 40))
            .rotation3DEffect(.degrees(self.viewState.height / 20), axis: (x: 1, y: 0, z: 0))
            .hueRotation(.degrees(self.viewState.width / 5))
            .gesture(self.drag)
            .shadow(color: Color("Shadow").opacity(0.5), radius: 30, x: 0, y: 15)
            .opacity(self.appear["content"]! ? 1 : 0)
            .offset(y: self.appear["content"]! ? 0 : 200)
            .padding(20)
            .background(
                Image("Blob 1")
                    .offset(x: 200, y: -100)
                    .opacity(self.appear["blob"]! ? 1 : 0)
                    .offset(y: self.appear["blob"]! ? 0 : 10)
                    .blur(radius: self.appear["blob"]! ? 0 : 40)
                    .allowsHitTesting(false)
                    .accessibility(hidden: true)
            )
            
            Button
            {
                withAnimation
                {
                    self.dismissModal()
                }
            }
            label:
            {
                Image(systemName: "xmark")
                    .font(.body.weight(.bold))
                    .foregroundStyle(.secondary)
                    .padding(8)
                    .background(.thinMaterial, in: Circle())
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            .padding(20)
            .opacity(self.appear["button"]! ? 1 : 0)
            .offset(y: self.appear["button"]! ? 0 : -200)
        }
        .onAppear
        {
            self.fadeIn()
        }
        .onChange(of: self.isLogged)
        {
            (newValue) in
            if newValue
            {
                self.dismissModal()
            }
        }
        .accessibilityAddTraits(.isModal)
    }
    
    private var drag: some Gesture
    {
        DragGesture()
            .onChanged
            {
                (value) in
                self.viewState = value.translation
            }
            .onEnded
            {
                _ in
                if self.viewState.height > 200
                {
                    self.dismissModal()
                }
                else
                {
                    withAnimation(.restoreCard)
                    {
                        self.viewState = .zero
                    }
                }
            }
    }
    
    private func dismissModal()
    {
        withAnimation
        {
            self.isDismissed = true
        }
        withAnimation(.linear.delay(0.3))
        {
            self.showModal = false
        }
    }
    
    private func fadeIn()
    {
        withAnimation(.easeOut) { self.appear["content"] = true }
        withAnimation(.easeOut.delay(0.15)) { self.appear["button"] = true }
        withAnimation(.easeOut(duration: 1).delay(0.3)) { self.appear["blob"] = true }
    }
}


struct ModalView_Previews: PreviewProvider
{
    static var previews: some View
    {
        ModalView()
            .environmentObject(Model())
    }
}
