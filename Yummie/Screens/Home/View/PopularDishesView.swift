//
//  PopularDishesView.swift
//  Yummie
//
//  Created by Yogesh Patel on 27/05/23.
//

import SwiftUI

struct PopularDishesView: View {
    let dish: Dish

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {

            HStack(alignment: .top) {
                Image(systemName: "heart")

                Spacer()

                AsyncImage(
                    url: URL(string: dish.image)!,
                    content: { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 70, height: 70)
                            .cornerRadius(20)
                    },
                    placeholder: {
                        ProgressView()
                    }
                )
            }

            Spacer()

            Text("Breakfast")
                .font(.caption)
                .foregroundColor(.teal)

            Text(dish.name)
                .fontWeight(.medium)

            HStack(spacing: 2) {
                ForEach(0..<5) { _ in
                    Image(systemName: "star.fill")
                        .renderingMode(.template)
                        .foregroundColor(.pink)
                }
            }

            Text("\(dish.calories) Calories")
                .font(.caption)
                .foregroundColor(.pink)

            HStack {
                Image(systemName: "clock")
                Text("10 mins")

                Image(systemName: "bell")
                Text("4 Serving")
            }
            .font(.caption2)
            .foregroundColor(.gray)
        }
        .padding()
        .frame(width: 180)
        .background(Color(UIColor.systemBackground))
        .cornerRadius(20.0)
    }
}
