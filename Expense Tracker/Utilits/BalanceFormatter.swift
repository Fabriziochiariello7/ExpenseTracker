//
//  BalanceFormater.swift
//  Expensiv Tracker
//
//  Created by Fabrizio Chiariello on 3/24/23.
//

// UI DESING

import UIKit

protocol BalanceFormatter {
    func makeFormattedBalance(dollar: String) -> NSMutableAttributedString
}
