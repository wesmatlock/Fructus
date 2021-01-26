import SwiftUI

struct ContentView: View {
  // MARK: - Properties

  var fruits: [Fruit] = fruitsData

  // MARK: - Body
  var body: some View {
    NavigationView {
      List {
        ForEach(fruits.shuffled()) { item in
          FruitRowView(fruit: item)
            .padding(.vertical, 4)
        }
      }//: List
      .navigationTitle("Fruits")
    }//: NavicationView
  }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView(fruits: fruitsData)
      .previewDevice("iPhone 12 Pro")
  }
}
