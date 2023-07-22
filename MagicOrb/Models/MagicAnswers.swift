//
//  MagicAnswers.swift
//  MagicOrb
//
//  Created by Simon Erlic on 2023-07-19.
//

import Foundation

let magicOrbAnswers = [
    "It is certain",
    "Without a doubt",
    "You may rely on it",
    "Yes, definitely",
    "It is decidedly so",
    "As I see it, yes",
    "Most likely",
    "Yes",
    "Outlook good",
    "Signs point to yes",
    "Reply hazy, try again",
    "Ask again later",
    "Better not tell you now",
    "Cannot predict now",
    "Concentrate and ask again",
    "Don't count on it",
    "Outlook not so good",
    "My sources say no",
    "Very doubtful",
    "My reply is no",
    "It doesn't look promising",
    "No",
    "Definitely not",
    "I highly doubt it",
    "Absolutely not",
    "Of course",
    "It's possible",
    "Maybe",
    "There's a chance",
    "I'm not sure",
    "I can't say for certain",
    "It's uncertain",
    "It's unlikely",
    "It's improbable",
    "It's doubtful",
    "I don't have an answer",
    "That's a tough one",
    "I'm sorry, I don't know",
    "I'm unable to provide an answer",
    "The future is unclear",
    "The outlook is not clear",
    "I'm afraid I can't answer that",
    "I'm sorry, I can't predict that",
    "I don't have enough information",
    "I'm unable to answer that question",
    "I'm not programmed to answer that",
    "I don't have the knowledge to answer",
    "That's beyond my capabilities",
    "I can't give you a straight answer",
    "I wish I knew",
    "I'm uncertain about that"
]


func selectRandomString() -> String? {
    guard !magicOrbAnswers.isEmpty else { return nil }
    let randomIndex = Int(arc4random_uniform(UInt32(magicOrbAnswers.count)))
    return magicOrbAnswers[randomIndex]
}
