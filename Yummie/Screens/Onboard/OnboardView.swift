//
//  OnboardView.swift
//  Yummie
//
//  Created by Yogesh Patel on 30/05/23.
//

import SwiftUI

struct OnboardView: View {

    let imageName: String
    let title: String
    let description: String
    var showDoneButton = false
    var nextAction: () -> Void

    var body: some View {
        VStack(spacing: 20) {

            Spacer()

            Image(imageName)
                .resizable()
                .scaledToFit()
                .cornerRadius(20)

            Text(title)
                .font(.title).bold()

            Text(description)
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)

            Spacer()

            if showDoneButton {
                Button("Get Started") {
                    nextAction()
                }
                .buttonStyle(OnboardButtonStyle())

            }else {
                Button("Next") {
                    nextAction()
                }
                .buttonStyle(OnboardButtonStyle())
            }
        }
        .padding(40)
    }
}

struct OnboardButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(10)
            .frame(maxWidth: .infinity)
            .font(.title3)
            .background(.pink, in: RoundedRectangle(cornerRadius: 8))
            .foregroundColor(.white)
    }
}

struct OnboardView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardView(
            imageName: "Onboard1",
            title: "Fresh Food",
            description: "Order your favourite food from the top restaurants.", nextAction: {

            }
        )
    }
}
