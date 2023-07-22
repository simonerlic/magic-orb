//
//  Question.swift
//  MagicOrb
//
//  Created by Simon Erlic on 2023-07-19.
//

import Foundation

struct Question: Identifiable, Codable {
    // This file is unused for now, but may be used later to create more shareable
    // questions and responses for Twitter, FB, etc.
    
    let id: UUID
    var transcript: String?
    
    init(id: UUID = UUID(), transcript: String? = nil) {
        self.id = id
        self.transcript = transcript
    }
}
