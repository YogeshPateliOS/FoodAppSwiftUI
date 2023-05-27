//
//  ErrorView.swift
//  Yummie
//
//  Created by Yogesh Patel on 26/05/23.
//

import SwiftUI

struct ErrorView: View {

    let message: String
    var onRetry: (() -> Void)?

    init(_ message: String, onRetry: (() -> Void)? = nil) {
        self.message = message
        self.onRetry = onRetry
    }

    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "exclamationmark.triangle")
                .font(.system(size: 40))
                .foregroundColor(.yellow)
            Text(message)
            if let onRetry {
                Button(action: onRetry) {
                    HStack {
                        Image(systemName: "gobackward")
                        Text("Retry")
                    }
                }.buttonStyle(.bordered)
            }

        }.padding(20)
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(Strings.somethingWentWrong)
    }
}
