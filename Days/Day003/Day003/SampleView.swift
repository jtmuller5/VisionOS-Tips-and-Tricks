import SwiftUI

struct SampleView: View {
    
    var color: Color
    var text: String
    
    var body: some View {
        ZStack{
            Circle()
                .foregroundColor(color)
            Text(text)
                .font(.extraLargeTitle)
        }
        .padding(50)
    }
}
#Preview {
    SampleView(color: .blue, text: "Hello")
}
