import SwiftUI


struct SignUpView: View
{
    enum Field: Hashable
    {
        case email
        case password
    }
    
    
    @State var email: String = ""
    @State var password: String = ""
    @State var circleY: CGFloat = 0
    @State var emailY: CGFloat = 0
    @State var passwordY: CGFloat = 0
    @State var circleColor: Color = .blue
    @State var appear: [String : Bool] = [
        "title": false,
        "subtitle": false,
        "other": false
    ]
    @FocusState var focusField: Field?
    @EnvironmentObject var model: Model
    
    
    var body: some View
    {
        VStack(alignment: .leading, spacing: 16)
        {
            Text("Sign Up")
                .font(.largeTitle).bold()
                .opacity(self.appear["title"]! ? 1 : 0)
                .offset(y: self.appear["title"]! ? 0 : 20)
            
            Text("Access 120+ hours of courses, tutorials and livestreams")
                .font(.headline)
                .opacity(self.appear["subtitle"]! ? 1 : 0)
                .offset(y: self.appear["subtitle"]! ? 0 : 20)
            
            Group
            {
                TextField("Email", text: self.$email)
                    .customInputBar(icon: "mail")
                    .textContentType(.emailAddress)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .overlay(self.geometry)
                    .onPreferenceChange(CirclePreferenceKey.self)
                    {
                        (value) in
                        self.emailY = value
                        self.circleY = value
                        //FIXME: initial focusField and initial position and self.circleY = value
                    }
                    .focused(self.$focusField, equals: .email)
                    .shadow(color: self.focusField == .email ? .primary.opacity(0.3) : .clear, radius: 10, x: 0, y: 3)
                
                SecureField("Password", text: self.$password)
                    .customInputBar(icon: "lock")
                    .textContentType(.password)
                    .overlay(self.geometry)
                    .onPreferenceChange(CirclePreferenceKey.self)
                    {
                        (value) in
                        self.passwordY = value
                        //self.circleY = value
                    }
                    .focused(self.$focusField, equals: .password)
                    .shadow(color: self.focusField == .password ? .primary.opacity(0.3) : .clear, radius: 10, x: 0, y: 3)
                
                Button
                {
                    
                }
                label:
                {
                    Text("Create an account")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                }
                .blendMode(.overlay)
                .buttonStyle(.angular)
                .tint(.accentColor)
                .controlSize(.large)
                .shadow(color: Color("Shadow").opacity(0.3), radius: 30, x: 0, y: 25)
                
                Group
                {
                    Text("By clicking on ")
                    + Text("**Create an account**")
                    + Text(", you agree to our **Terms of Service** and **[Privacy Policy](http://designcode.io)**")
                    
                    Divider()
                    
                    HStack
                    {
                        Text("Already have an account?")
                        
                        Button
                        {
                            self.model.selectedModal = .signIn
                        }
                        label:
                        {
                            Text("**Sign in**")
                        }
                    }
                }
                .font(.footnote)
                .foregroundStyle(.secondary)
                .tint(.secondary)
            }
            .opacity(self.appear["other"]! ? 1 : 0)
            .offset(y: self.appear["other"]! ? 0 : 20)
        }
        .padding(20)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
        .background(
            Circle().fill(self.circleColor)
                .frame(width: 68, height: 68)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .offset(y: self.circleY)
        )
        .customBorderStroke(cornerRadius: 30)
        .coordinateSpace(name: "container")
        .onChange(of: self.focusField)
        {
            (value) in
            withAnimation
            {
                switch value
                {
                    case .email:
                        self.circleY = self.emailY
                        self.circleColor = .blue
                    case .password:
                        self.circleY = self.passwordY
                        self.circleColor = .red
                    default: break
                }
            }
        }
        .onAppear
        {
            self.fadeIn()
        }
    }
    
    private var geometry: some View
    {
        GeometryReader
        {
            (proxy) in
            Color.clear.preference(key: CirclePreferenceKey.self, value: proxy.frame(in: .named("container")).minY)
        }
    }
    
    private func fadeIn()
    {
        withAnimation(.spring().delay(0.15)) { self.appear["title"] = true }
        withAnimation(.spring().delay(0.3)) { self.appear["subtitle"] = true }
        withAnimation(.spring().delay(0.45)) { self.appear["other"] = true }
    }
}


struct SignUpView_Previews: PreviewProvider
{
    static var previews: some View
    {
        SignUpView()
            .environmentObject(Model())
    }
}
