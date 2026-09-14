
//
//  Bundle-decodable.swift
//  100swiftstudentchallenge
//
//  Created by Gleenryan on 14/09/26.
//

import Foundation

//crash the app if cant locate file
extension Bundle{
    func decode<T: Decodable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else{
            fatalError("cant locate \(file)")
        }
        
        guard let data = try? Data(contentsOf: url) else{
            fatalError("cant load \(file)")
        }
        
        let decoder = JSONDecoder()
        
        do{
            return try decoder.decode(T.self, from: data)
        }catch DecodingError.keyNotFound(let key, let context) {
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
