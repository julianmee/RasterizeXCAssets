import Foundation

import Commander
import PromiseKit

import WebKit

struct Contents: Codable {
    struct Info: Codable {
        let author: String
        let version: Int
    }

    struct Image: Codable {
        let filename: String
        let idiom: String
        let size: String
        let scale: String
    }

    let info: Info
    let images: [Image]
}

enum UserError: Error, CustomStringConvertible {
    case unsupportedOS
    case unexpectedAssetType(String)
    case unexpectedContainerType(String)
    case invalidSize(String)

    var description: String {
        switch self {
        case .unsupportedOS: return "Only macOS 10.13 and newer is supported..."
        case .unexpectedAssetType(let type): return "Unexpected asset type: \(type)"
        case .unexpectedContainerType(let type): return "Unexpected container type: \(type)"
        case .invalidSize(let size): return "Invalid size: \(size)"
        }
    }
}