// CurrencyConverter.swift
import Foundation

struct CurrencyConverter {
    static func convert(usd: Int, to currency: String) -> Double {
        let conversionRates = [
            "EUR": 0.85,
            "JPY": 110.0,
            "GBP": 0.75,
            "CAD": 1.25
        ]
        return Double(usd) * (conversionRates[currency] ?? 1.0)
    }
}
