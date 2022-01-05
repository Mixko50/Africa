//
//  CodableBundleExtention.swift
//  Africa
//
//  Created by Mixko on 4/1/2565 BE.
//

import Foundation

extension Bundle {
    func decode<T: Codable>(_ file: String) -> T {
        //1. Locate the JSON file
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle")
        }
        
        //2. Create a property for each data
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle")
        }
        
        //3. Create a decode
        let decoder = JSONDecoder()
        
        //4. Create a property for a decoder data
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle")
        }
            
        //5. Return the ready to use data
        return loaded
    }
}
