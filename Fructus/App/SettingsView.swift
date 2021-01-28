import SwiftUI

struct SettingsView: View {
  // MARK: -  Properties

  @Environment(\.presentationMode) var presentationMode
  @AppStorage("isOnboarding") var isOnboarding: Bool = false

  // MARK: - Body
  var body: some View {
    NavigationView {
      ScrollView(.vertical, showsIndicators: false) {
        VStack(spacing: 20) {
          // MARK: - Section 1
          GroupBox(
            label:
              SettingsLabelView(labelText: "Fructus", labelImage: "info.circle")
          ) {
            Divider().padding(.vertical, 4)

            HStack(alignment: .center, spacing: 10) {
              Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80, alignment: .center)
                .cornerRadius(9)

              Text("Most Fruits are naturally low in fat, sodium, and calories. None have cholesterol. Fruits are sources of many essential nutrients, including potassium, dietary fiber, vitamins, and much more. ")
                .font(.footnote)
            }
          }//: Box

          // MARK: - Section 2
          GroupBox(
            label: SettingsLabelView(labelText: "Customization", labelImage: "paintbrush")
          ) {
            Divider().padding(.vertical, 4)
            Text("If you wish, you can restart the appplication by toggle the switch in this box. That way it starts the onboarding and you will see the welcome message again.")
              .padding(.vertical, 8)
              .frame(minHeight: 60)
              .layoutPriority(1)
              .font(.footnote)
              .multilineTextAlignment(.leading)

            Toggle(isOn: $isOnboarding) {
              if isOnboarding {
                Text("Restarted".uppercased())
                  .fontWeight(.bold)
                  .foregroundColor(.green)
              } else {
                Text("Restart".uppercased())
                  .fontWeight(.bold)
                  .foregroundColor(.secondary)
              }
            }
            .padding()
            .background(
              Color(UIColor.tertiarySystemBackground)
                .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
            )

          }//: Box
          // MARK: - Section 3
          GroupBox(
            label:
              SettingsLabelView(labelText: "Applications", labelImage: "apps.iphone")
          ) {
            SettingsRowView(name: "Developer", content: "Wesley Matlock")
            SettingsRowView(name: "Designer", content: "Amy Zander")
            SettingsRowView(name: "Compatibility", content: "iOS 14")
            SettingsRowView(name: "Website", linkName: "INSOC", linkDestination: "www.insoc.net")
            SettingsRowView(name: "Twitter", linkName: "@seyton", linkDestination: "twitter.com/seyton")
            SettingsRowView(name: "SwiftUI", content: "2.0")
            SettingsRowView(name: "Version", content: "0.1.1")

          }//:Box
        }//: VStack
        .navigationBarTitle(Text("Settings"), displayMode: .large)
        .navigationBarItems(trailing:
                              Button(action: {
                                presentationMode.wrappedValue.dismiss()
                              }, label: {
                                Image(systemName: "xmark")
                              }))
        .padding()
      }//: Scroll
    }//: Navigation
  }
}

// MARK: - Preview
struct SettingsView_Previews: PreviewProvider {
  static var previews: some View {
    SettingsView()
      .preferredColorScheme(.dark)
      .previewDevice("iPhone 12 Pro")
  }
}
