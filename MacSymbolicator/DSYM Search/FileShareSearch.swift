//
//  FileShareSearch.swift
//  MacSymbolicator
//
//

import Foundation

class FileShareSearch {

    typealias CompletionHandler = ([SearchResult]?, Bool) -> Void

    func search(
        forUUIDs uuids: Set<String>,
        logHandler logMessage: @escaping LogHandler,
        completion: @escaping CompletionHandler
    ) {
        DispatchQueue.global().async {
            var results: [SearchResult] = []

             for uuid in uuids {
                 let path = "/Volumes/SoftwareReleases/_DebugSymbols/\(uuid)"
                 if FileManager().fileExists(atPath: path) {
                     results.append(SearchResult(path: path, matchedUUID: uuid))
                 }
             }

             completion(results, true)
        }
    }

}
