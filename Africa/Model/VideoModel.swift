//
//  VideoModel.swift
//  Africa
//
//  Created by Mixko on 6/1/2565 BE.
//

import Foundation

struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    
    //Computed property
    var thumbnail: String {
        "video-\(id)"
    }
}
