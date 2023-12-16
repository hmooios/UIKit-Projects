//
//  ViewController.swift
//  Quotiful
//
//  Created by Hmoo Myat Theingi on 15/12/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var quote: UILabel!

    @IBAction func generateQuotePressed(_ sender: UIButton) {
        let quotes = [
            "Believe you can and you're halfway there. - Theodore Roosevelt",
            "The only way to do great work is to love what you do. - Steve Jobs",

            "Your time is limited, don't waste it living someone else's life. - Steve Jobs",

            "Success is not final, failure is not fatal: It is the courage to continue that counts. - Winston Churchill",

            "The only limit to our realization of tomorrow will be our doubts of today. - Franklin D. Roosevelt",

            "It always seems impossible until it's done. - Nelson Mandela",

            "The only person you are destined to become is the person you decide to be. - Ralph Waldo Emerson",

            "Don't watch the clock; do what it does. Keep going. - Sam Levenson",

            "Success is stumbling from failure to failure with no loss of enthusiasm. - Winston Churchill",

            "The future belongs to those who believe in the beauty of their dreams. - Eleanor Roosevelt"
        ]
        if let randomQuote = quotes.randomElement() {
                // Set the text property of the quote label
                quote.text = randomQuote
            }
    }
    
}

