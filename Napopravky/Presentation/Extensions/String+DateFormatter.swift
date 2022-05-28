//
//  String+DateFormatter.swift
//  Napopravky
//
//  Created by Михаил Серёгин on 28.05.2022.
//

import Foundation

extension String {
    func customDateRepresentation() -> String {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"

        let dateFormatterPrint = DateFormatter()

        dateFormatterPrint.dateFormat = "dd MMMM yyyy"
        
        if let date = dateFormatterGet.date(from: self) {
            return dateFormatterPrint.string(from: date)
        } else {
            return self
        }
    }
}
