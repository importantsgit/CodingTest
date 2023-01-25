import Foundation

final class FileIntIO {
    
    @inline(__always) private var buffer: [UInt8] = Array(FileHandle.standardInput.readDataToEndOfFile()) + [0], byteIdx = 0
    
    @inline(__always) private func readByte() -> UInt8 {
        defer { byteIdx += 1 }
        return buffer.withUnsafeBufferPointer { $0[byteIdx] }
    }
    
    @inline(__always) func readInt() -> Int {
        var number = 0, byte = readByte(), isNegative = false
        while byte == 10 || byte == 32 { byte = readByte() }
        if byte == 45 { byte = readByte(); isNegative = true }
        while 48...57 ~= byte { number = number * 10 + Int(byte - 48); byte = readByte() }
        return number * (isNegative ? -1 : 1)
    }
}

final class FileStringIO {
    
    @inline(__always) private var buffer: [UInt8] = Array(FileHandle.standardInput.readDataToEndOfFile()) + [0], byteIdx = 0
    
    @inline(__always) private func readByte() -> UInt8 {
        defer { byteIdx += 1 }
        return buffer.withUnsafeBufferPointer { $0[byteIdx] }
    }

    @inline(__always) func readString() -> String {
        var str = "", byte = readByte()
        
        while byte == 10 || byte == 32 { byte = readByte() } // 공백과 줄바꿈 무시
        
        while byte != 10 && byte != 32 && byte != 0 {
            str += String(bytes: [byte], encoding: .ascii)!
            byte = readByte()
        }
        
        return str
    }
}

let fileInt = FileIntIO()
fileInt.readInt()

let fileStr = FileStringIO()
fileStr.readString()
