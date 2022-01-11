//
//  CenterModifier.swift
//  Africa
//
//  Created by Mixko on 11/1/2565 BE.
//

import SwiftUI

struct CenterModifier: ViewModifier {
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            content
            Spacer()
        }
    }
}
