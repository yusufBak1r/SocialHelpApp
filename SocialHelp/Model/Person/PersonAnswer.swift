//
//  PersonAnswer.swift
//  SocialHelp
//
//  Created by yusuf bakır on 19.12.2023.
//

import Foundation
struct PersonAnswer :Codable{
    let success: Bool
    let message: String
    let data:PersonDataClass?
    }

struct PersonDataClass: Codable {
    let id: Int
    let email, phone, password, name: String
    let surname: String
    let birthOfDateYear: Int
    let identityNumber, job: String?
    init(id: Int, email: String, phone: String, password: String, name: String, surname: String, birthOfDateYear: Int, identityNumber: String, job: String) {
        self.id = id
        self.email = email
        self.phone = phone
        self.password = password
        self.name = name
        self.surname = surname
        self.birthOfDateYear = birthOfDateYear
        self.identityNumber = identityNumber
        self.job = job
    }
}

    // MARK: - Encode/decode helpers

//class JSONNull: Codable, Hashable {
//
//    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
//        return true
//    }
//
//    public var hashValue: Int {
//        return 0
//    }
//
//    public init() {}
//
//    public required init(from decoder: Decoder) throws {
//        let container = try decoder.singleValueContainer()
//        if !container.decodeNil() {
//            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
//        }
//    }
//
//    public func encode(to encoder: Encoder) throws {
//        var container = encoder.singleValueContainer()
//        try container.encodeNil()
//    }
//}
//


