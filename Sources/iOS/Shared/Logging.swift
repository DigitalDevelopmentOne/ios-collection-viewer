/*
 
 Project: CollectionViewer
 File: Logging.swift
 Created by: Egor Boyko
 Date: 06.09.2023
 
 Status: #In progress | #Not required
 
 */

import OSLog

fileprivate let packageLogger: Logger = .init(
    subsystem: Bundle.main.bundleIdentifier ?? "",
    category: "collection-viewer"
)

protocol Logging {}

extension Logging {
    func debugMessage(_ methodName: String, _ message: String...){
        packageLogger.debug("\(self.createMessage(methodName, message))")
    }
    func warningMessage(_ methodName: String, _ message: String...){
        packageLogger.warning("⚠️ \(self.createMessage(methodName, message))")
    }
    
    private func createMessage(_ methodName: String, _ input: [String]) -> String {
        let type = "\("\(Self.self)".split(separator: "<").first ?? "")"
        let method = "\(methodName.split(separator: "(").first ?? "")"
        let message = input.joined(separator: " ")
        return "[type: \(type)] [method: \(method)] \(message)"
    }
}
