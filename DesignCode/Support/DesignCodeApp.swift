import SwiftUI


@main
struct DesignCodeApp: App
{
    @StateObject var model = Model()
    
    var body: some Scene
    {
        WindowGroup
        {
            ContentView()
              .environmentObject(self.model)
        }
    }
}


//TODO: how to create a App Store - like transition between `CourseView` and `HomeView`

//TODO: CourseView back gesture, minimized window follows finger
