import SwiftUI

struct ContentView: View {

    @State var batteryLevel = 50

    var body: some View {
        VStack(spacing: 20) {

            // Battery percentage text
            Text("Battery: (batteryLevel)%")
                .font(.largeTitle)

            // Battery icon
            Image(systemName: batteryImage)
                .font(.system(size: 100))
                .foregroundColor(batteryColor)

            // Buttons
            HStack(spacing: 30) {

                Button("Drain –10") {
                    if batteryLevel > 0 {
                        batteryLevel -= 10
                    }

                    Button("Charge +10") {
                        if batteryLevel < 100 {
                            batteryLevel += 10
                        }
                    }
                }
                .font(.title2)
            }
            .padding()
        }

        // MARK: - Battery Image Logic
        var batteryImage: String {
            if batteryLevel >= 80 {
                return "battery.100"
            } else if batteryLevel >= 20 {
                return "battery.50"
            } else {
                return "battery.0"
            }
        }

        // MARK: - Battery Color Logic
        var batteryColor: Color {
            if batteryLevel >= 80 {
                return .green
            } else if batteryLevel >= 20 {
                return .yellow
            } else {
                return .red
            }
        }
    }
}
