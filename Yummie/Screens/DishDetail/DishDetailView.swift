//
//  DishDetailView.swift
//  Yummie
//
//  Created by Yogesh Patel on 27/05/23.
//

import SwiftUI

struct DishDetailView: View {

    let dish: Dish

    var body: some View {
        VStack(spacing: 30) {

            VStack(alignment: .leading, spacing: 16) {
                HStack(alignment: .bottom, spacing: 8) {
                    Text(dish.name)
                        .font(.title2)
                        .fontWeight(.bold)

                    Text("\(dish.calories) Calories")
                        .font(.footnote)
                        .foregroundColor(.pink)
                }

                Text("By Yogesh Patel")
                    .font(.callout)
                    .foregroundColor(.secondary)

            }
            .frame(maxWidth: .infinity, alignment: .leading)

            HStack(alignment: .top) {

                VStack(alignment: .leading, spacing: 16) {
                    RatingView(
                        imageName: "star.fill",
                        text: "4.9"
                    )

                    RideView()
                        .padding(.bottom, 40)

                    VStack(spacing: 16) {
                        Button {

                        } label: {
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .frame(width: 40, height: 40)
                        }

                        Button {

                        } label: {
                            Image(systemName: "minus.circle.fill")
                                .resizable()
                                .frame(width: 40, height: 40)
                        }
                    }
                    .padding(8)
                    .foregroundColor(.gray)
                    .background(Color(UIColor.secondarySystemBackground))
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(.gray, lineWidth: 1)
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 20))

                }

                Spacer()

                AsyncImage(
                    url: URL(string: dish.image)!,
                    content: { image in
                        image.resizable()
                            .frame(width: 200, height: 300)
                            .aspectRatio(contentMode: .fill)
                    },
                    placeholder: {
                        ProgressView()
                    }
                )
                .cornerRadius(10)

            }
            .frame(maxWidth: .infinity, maxHeight: 350)


            VStack(alignment: .leading, spacing: 16) {

                Text("Descrption")
                    .font(.title3)
                    .fontWeight(.semibold)


                VStack(alignment: .leading, spacing: 4) {

                    Text(dish.description)
                        .lineLimit(4)
                        .font(.body)
                        .foregroundColor(.secondary)

                    Button {

                    } label: {
                        Text("Read more")
                            .foregroundColor(.pink)
                    }
                }
            }

            Spacer()

            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Price")
                        .font(.subheadline)
                        .foregroundColor(.secondary)

                    Text("$137.50")
                        .font(.headline)
                }

                Spacer()

                Button {

                } label: {
                    Text("Add to Cart")
                        .foregroundColor(.pink)
                        .fontWeight(.medium)
                        .padding(8)
                }
                .buttonStyle(.bordered)

            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color(UIColor.systemGray5))
            .cornerRadius(20)

        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(UIColor.secondarySystemBackground))

        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {

                } label: {
                    Image(systemName: "heart")
                        .foregroundColor(.pink)
                }
            }
        }
    }
}

struct DishDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DishDetailView(dish: .init(id: "", name: "Cassava Flakes", description: "Cassava Flakes", image: "https://p3y6v9e6.stackpathcdn.com/wp-content/uploads/zikoko/2020/03/D1sPmD5XQAA7Hjh.jpg", calories: 120))
    }
}

struct RatingView: View {
    let imageName: String
    let text: String

    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: imageName)                .foregroundColor(.pink)

            Text(text)
        }
        .padding()
        .background(Color(UIColor.secondarySystemBackground))
        .cornerRadius(20)
        .overlay( /// apply a rounded border
            RoundedRectangle(cornerRadius: 20)
                .stroke(.gray, lineWidth: 1)
        )
    }
}

struct RideView: View {
    var body: some View {
        HStack(spacing: 8) {
            Text("🚙")

            Text("20 min")
        }
        .padding()
        .background(Color(UIColor.secondarySystemBackground))
        .cornerRadius(20)
        .overlay( /// apply a rounded border
            RoundedRectangle(cornerRadius: 20)
                .stroke(.gray, lineWidth: 1)
        )
    }
}
