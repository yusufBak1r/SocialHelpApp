//
//  TranskirptAnswer.swift
//  SocialHelp
//
//  Created by yusuf bakır on 27.12.2023.
//

import Foundation


// MARK: - Welcome
struct TranskirptAnswer: Codable {
    let success: Bool
    let message: String
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let id: Int
    let student: Student1
    let term, transcriptPDF: String

    enum CodingKeys: String, CodingKey {
        case id, student, term
        case transcriptPDF = "transcriptPdf"
    }
}

// MARK: - Student
struct Student1: Codable {
    let id: Int
    let email, phone, password, name: String
    let surname: String
    let birthOfDateYear: Int
    let identityNumber: String
    let hasTranskript, scholarship: Bool
}
