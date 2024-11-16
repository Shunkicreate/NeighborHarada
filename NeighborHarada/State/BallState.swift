//
//  BallState.swift
//  NeighborHarada
//
//  Created by shunsuke tamura on 2024/11/16.
//

import Foundation

class BallState:  Decodable, Encodable {
    var position: BallPosition

    init(position: BallPosition) {
        self.position = position
    }

//    func toJson() -> String? {
//        let encoder = JSONEncoder()
//        
//        do {
//            let jsonData = try encoder.encode(self)
//            let jsonString = String(data: jsonData, encoding: .utf8)
//            return jsonString
//        } catch {
//            print("Failed to encode Message to JSON: \(error)")
//            return nil
//        }
//    }
//    
//    static func fromJson(jsonString: String) -> BallState? {
//        let decoder = JSONDecoder()
//        
//        guard let jsonData = jsonString.data(using: .utf8) else {
//            print("Failed to convert JSON string to Data.")
//            return nil
//        }
//        
//        do {
//            let state = try decoder.decode(BallState.self, from: jsonData)
//            return state
//        } catch {
//            print("Failed to decode JSON: \(error)")
//            return nil
//        }
//    }
}

class BallPosition: Decodable, Encodable {
    var x: Int
    var y: Int

    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    
//    func toJson() -> String? {
//        let encoder = JSONEncoder()
//        
//        do {
//            let jsonData = try encoder.encode(self)
//            let jsonString = String(data: jsonData, encoding: .utf8)
//            return jsonString
//        } catch {
//            print("Failed to encode Message to JSON: \(error)")
//            return nil
//        }
//    }
//    
//    static func fromJson(jsonString: String) -> BallPosition? {
//        let decoder = JSONDecoder()
//        
//        guard let jsonData = jsonString.data(using: .utf8) else {
//            print("Failed to convert JSON string to Data.")
//            return nil
//        }
//        
//        do {
//            let position = try decoder.decode(BallPosition.self, from: jsonData)
//            return position
//        } catch {
//            print("Failed to decode JSON: \(error)")
//            return nil
//        }
//    }
}
