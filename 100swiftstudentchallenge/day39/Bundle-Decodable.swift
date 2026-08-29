//
//  Bundle-Decodable.swift
//  100swiftstudentchallenge
//
//  Created by Gleenryan on 29/08/26.
//

import Foundation

extension Bundle{
    func decode(_ file:String) -> [String: Astronaut]{
        guard let url = self.url(forResource: file, withExtension: nil) else{
            fatalError("cant locate \(file)")
        }
        
        guard let data = try? Data(contentsOf: url) else{
            fatalError("cant load \(file)")
        }
        
        let decoder = JSONDecoder()
        do{
            return try decoder.decode([String: Astronaut].self, from: data)
            //kalo udah kaya gini, harus catch semua jenis error yang ada
        } catch DecodingError.keyNotFound(let key, let context) {
            fatalError("Failed to decode \(file) from bundle due to missing key '\(key.stringValue)' – \(context.debugDescription)")
        } catch DecodingError.typeMismatch(_, let context) {
            fatalError("Failed to decode \(file) from bundle due to type mismatch – \(context.debugDescription)")
        } catch DecodingError.valueNotFound(let type, let context) {
            fatalError("Failed to decode \(file) from bundle due to missing \(type) value – \(context.debugDescription)")
        } catch DecodingError.dataCorrupted(_) {
            fatalError("Failed to decode \(file) from bundle because it appears to be invalid JSON.")
        } catch {
            fatalError("Failed to decode \(file) from bundle: \(error.localizedDescription)")
        }
    }
}





