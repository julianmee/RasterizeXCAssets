import Commander

public struct Size {
    let width: UInt
    let height: UInt

    init(width: UInt, height: UInt) {
        self.width = width
        self.height = height
    }

    init(string: String) throws {
        let parts = string.components(separatedBy: "x")

        guard parts.count == 2,
            let width = UInt(parts[0]),
            let height = UInt(parts[1]) else {
            throw UserError.invalidSize(string)
        }

        self.width = width
        self.height = height
    }

    func scaled(_ scale: UInt) -> Size {
        return Size(width: self.width * scale, height: self.height * scale)
    }
}

extension Size: CustomStringConvertible {
    public var description: String { return "\(self.width)x\(self.height)" }
}

extension Size: ArgumentConvertible {
    public init(parser: ArgumentParser) throws {
        if let value = parser.shift() {
            try self.init(string: value)
        } else {
            throw ArgumentError.missingValue(argument: nil)
        }
    }
}
