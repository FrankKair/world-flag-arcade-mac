import Foundation

struct Country: Codable, Hashable, Identifiable {
    let name: String
    let capital: String
    let code: String
    var id: String { code }
    var flag: String {
        code
            .uppercased()
            .unicodeScalars
            .compactMap { Unicode.Scalar(127_397 + $0.value) }
            .map(String.init)
            .joined()
    }
}
