// CurrencyConverter.swift
import Foundation

struct CurrencyConverter {
    static func convert(usd: Int, to currency: String) -> Double {
        let conversionRates = [
            "EUR": 0.93,
            "JPY": 159.78,
            "GBP": 0.79,
            "CAD": 1.37
        ]
        return Double(usd) * (conversionRates[currency] ?? 1.0)
    }
}
