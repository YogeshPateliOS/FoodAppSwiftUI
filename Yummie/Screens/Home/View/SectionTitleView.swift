//
//  SectionTitleView.swift
//  Yummie
//
//  Created by Yogesh Patel on 27/05/23.
//

import SwiftUI

struct SectionTitleView: View {
    let title: String

    var body: some View {
        HStack {
            Text(title)
                .font(.title2)
                .fontWeight(.bold)

            Spacer()

            Text("See All")
                .foregroundColor(.pink)
        }
    }
}
