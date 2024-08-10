//
//  ContentView.swift
//  Yummie
//
//  Created by Yogesh Patel on 26/05/23.
//

import SwiftUI

struct HomeView: View {

    @StateObject private var viewModel = HomeViewModel()
    @State var isNavigationToDish = false

    var body: some View {
        NavigationStack {
            ZStack {
                switch viewModel.viewState {
                case .loading:
                    ProgressView(Strings.fetchingRecords)
                case .error(let message):
                    ErrorView(message) {
                        viewModel.fetchAllDishes()
                    }
                case .dataLoaded:
                    mainContent
                }
            }
        }.accentColor(.pink)
        .onAppear {
            viewModel.fetchAllDishes()
        }
    }

    var mainContent: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                VStack(spacing: 5) {
                    Text("Hello Yogesh")
                        .font(.title)
                        .foregroundColor(.pink)

                    Text("want to eat healthy food?")
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .foregroundColor(.secondary)
                }.padding(.bottom)

                if let allDishes = viewModel.allDishes {

                    // Start Food Category
                    VStack(alignment: .leading) {
                        SectionTitleView(title: "Food Category")
                        if let dishes = allDishes.categories {
                            ScrollView(.horizontal, showsIndicators: false) {
                                LazyHStack {
                                    ForEach(dishes) { dish in
                                        CategoryView(dish: dish)
                                    }
                                }
                            }.frame(height: 128)
                        }
                    }.padding(.bottom)
                    // End Food Category
                    // Start Popular
                    VStack(alignment: .leading) {
                        SectionTitleView(title: "Popular Dishes")
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHStack {
                                ForEach(allDishes.populars) { dish in
                                    NavigationLink(destination: DishDetailView(dish: dish)) {
                                        PopularDishesView(dish: dish)
                                    }
                                    .buttonStyle(PlainButtonStyle())
                                }
                            }
                        }.frame(height: 250)
                    }.padding(.bottom, 8)
                    // End Popular
                    // Start Recommended
                    SectionTitleView(title: "Recommended")
                    LazyVStack {
                        ForEach(allDishes.specials) { dish in
                            RecommendedView(dish: dish)
                        }
                    }
                    // End Recommended
                }
            }.padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(UIColor.secondarySystemBackground))
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct EmptyButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
    }
}
