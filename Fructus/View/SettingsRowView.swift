import SwiftUI

struct SettingsRowView: View {

  // MARK: - Properties

  var name: String
  var content: String?
  var linkName: String?
  var linkDestination: String?

  // MARK: - Body
  var body: some View {
    
    VStack {
      Divider().padding(.vertical, 4)

      HStack {
        Text(name).foregroundColor(.gray)
        Spacer()
        if let content = content {
          Text(content)
        } else if let linkName = linkName,
                  let linkDestination = linkDestination,
                  let url = URL(string: "https://\(linkDestination)") {
          Link(linkName, destination: url)
          Image(systemName: "arrow.up.right.square").foregroundColor(.pink)
        } else {
          EmptyView()
        }
      }
    }
  }
}

// MARK: - Preview
struct SettingsRowView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      SettingsRowView(name: "Developer", content: "Wesley Matlock")
        .previewLayout(.fixed(width: 375, height: 60  ))
        .padding()
      SettingsRowView(name: "Website", linkName: "Apple Developer", linkDestination: "developer.apple.com")
        .preferredColorScheme(.dark)
        .previewLayout(.fixed(width: 375, height: 60  ))
        .padding()
    }
  }
}
