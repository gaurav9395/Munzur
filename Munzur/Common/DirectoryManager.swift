import Foundation

final class DirectoryManager {
    
    static let shared = DirectoryManager()
    private init(){}
    
    func checkIfFileExistsInDirectory(_ fileName: String) -> Bool {
        let url = NSURL(fileURLWithPath: getDirectoryPath())
        let filePath = url.appendingPathComponent(fileName)?.path
        return FileManager.default.fileExists(atPath: filePath!)
    }
    
    private func getDirectoryPath() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
    
    /**
     Use this method to get the path of a file in the document directory
     - parameter: fileName - Pass the file's name
     - returns: path of the file - String
     */
    func getPathInDirectoryForFile(named name: String) -> String {
        let url = NSURL(fileURLWithPath: getDirectoryPath())
        return url.appendingPathComponent(name)!.path
    }
}
