import SwiftUI

struct ContentView: View {
    var body: some View {
        AdventureView(viewModel: AdventureViewModel())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 15")
        ContentView()
            .previewDevice("iPad Pro (11-inch)")
            .previewInterfaceOrientation(.landscapeLeft)
        
        
    }
}
