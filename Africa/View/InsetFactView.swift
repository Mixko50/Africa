//
//  InsetFactView.swift
//  Africa
//
//  Created by Mixko on 5/1/2565 BE.
//

import SwiftUI

struct InsetFactView: View {
    
    let animal: Animal
    
    var body: some View {
        GroupBox {
            TabView {
                ForEach(animal.fact, id: \.self) { item in
                    Text(item)
                }
                
            }.tabViewStyle(PageTabViewStyle())
                .frame( minHeight: 148, idealHeight: 168, maxHeight: 180)
        } //: Box
    }
}

struct InsetFactView_Previews: PreviewProvider {
    static var animals: [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        InsetFactView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
