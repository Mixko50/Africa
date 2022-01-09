//
//  ContentView.swift
//  Africa
//
//  Created by Mixko on 4/1/2565 BE.
//

import SwiftUI

struct ContentView: View {
    
    let animals: [Animal] = Bundle.main.decode("animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .light)
    
    @State private var isGridViewActive: Bool = false
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Int = 1
    @State private var toolbarIcon: String = "square.grid.2x2"
    
    //Functions
    
    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
        gridColumn = gridLayout.count
        print("Grid number \(gridColumn)")
        
        switch gridColumn {
        case 1 :
            toolbarIcon = "square.grid.2x2"
        case 2 :
            toolbarIcon = "square.grid.3x2"
        case 3 :
            toolbarIcon = "rectangle.grid.1x2"
        default :
            toolbarIcon = "square.grid.2x2"
        }
    }
    
    var body: some View {
        NavigationView {
            Group {
                if !isGridViewActive {
                    List {
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        ForEach(animals) { animal in
                            NavigationLink(destination: AnimalDetailView(animal: animal)){
                                AnimalListItemView(animal: animal)
                                    .padding(.vertical, 8)
                            }
                        }
                    }
                } else {
                    ScrollView(.vertical,showsIndicators: false) {
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                            ForEach(animals) { item in
                                NavigationLink(destination: AnimalDetailView(animal: item)) {
                                    AnimalGridItemView(animal: item)
                                }
                            } // Loop
                        } // Grid
                        .padding()
                        .animation(.easeIn)
                    } // ScrollView
                } // List
            } // Group
            .navigationBarTitle("Africa", displayMode: .large)
                .toolbar(){
                    ToolbarItem(placement: .navigationBarTrailing) {
                        HStack(spacing: 16) {
                            //List
                            Button(action: {
                                print("List item view is activated")
                                isGridViewActive = false
                                haptics.impactOccurred()
                            }) {
                                Image(systemName: "square.fill.text.grid.1x2")
                                    .font(.title3)
                                    .foregroundColor(isGridViewActive ? .primary : .accentColor)
                            }
                            
                            //Grid
                            Button(action: {
                                print("Grid is activated")
                                isGridViewActive = true
                                haptics.impactOccurred()
                                gridSwitch()
                            }) {
                                Image(systemName: toolbarIcon)
                                    .foregroundColor(isGridViewActive ? .accentColor  : .primary )
                                    .font(.title3)
                            }
                            
                        } //HStack
                    } // ToolbarItem
                } // Toolbar
                
        } //Navagation
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
