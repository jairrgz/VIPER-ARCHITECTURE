//
//  ListOfMoviesInteractor.swift
//  VIPER-ARCHITECTURE
//
//  Created by Jorge Jair Ramirez Gaston Zuloeta on 15/03/25.
//

import Foundation

class ListOfMoviesInteractor: ListOfMoviesInteractorProtocol {
    
    private let session: URLSession = {
        let configuration = URLSessionConfiguration.default
        configuration.urlCache = nil
        configuration.requestCachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        let delegate = SessionDelegate()
        return URLSession(configuration: configuration, delegate: delegate, delegateQueue: nil)
    }()
    
    func getListOfMovies() async -> PopularMovieResponseEntity? {
        do {
            let apiKey = "214e1e94e242dbaa1c5271729d90b73c"
            guard let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=\(apiKey)") else {
                print("❌ Error: Invalid URL")
                return nil
            }
            
            print("📡 Fetching data from API...")
            let (data, response) = try await session.data(from: url)
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("❌ Error: Invalid server response")
                return nil
            }
            
            print("✅ Received response with status: \((response as? HTTPURLResponse)?.statusCode ?? 0)")
            
            // Print raw JSON for debugging
            if let jsonString = String(data: data, encoding: .utf8) {
                print("📦 Raw JSON structure:")
                if let jsonData = jsonString.data(using: .utf8),
                   let jsonObject = try? JSONSerialization.jsonObject(with: jsonData, options: .fragmentsAllowed) as? [String: Any] {
                    print("Keys in response: \(jsonObject.keys.joined(separator: ", "))")
                    if let results = jsonObject["results"] as? [[String: Any]], !results.isEmpty {
                        print("First movie keys: \(results[0].keys.joined(separator: ", "))")
                    }
                }
            }
            
            let decoder = JSONDecoder()
            // Remove this as we're handling the snake_case manually in CodingKeys
            // decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            do {
                let movieResponse = try decoder.decode(PopularMovieResponseEntity.self, from: data)
                print("✅ Successfully decoded \(movieResponse.results.count) movies")
                return movieResponse
            } catch {
                print("❌ Decoding error: \(error)")
                if let decodingError = error as? DecodingError {
                    switch decodingError {
                    case .keyNotFound(let key, let context):
                        print("Missing key: \(key) at path: \(context.codingPath)")
                    case .typeMismatch(let type, let context):
                        print("Type mismatch: expected \(type) at path: \(context.codingPath)")
                    case .valueNotFound(let type, let context):
                        print("Value not found: expected \(type) at path: \(context.codingPath)")
                    case .dataCorrupted(let context):
                        print("Data corrupted: \(context)")
                    @unknown default:
                        print("Unknown decoding error")
                    }
                }
                return nil
            }
            
        } catch {
            print("❌ Network error: \(error)")
            return nil
        }
    }
}

private class SessionDelegate: NSObject, URLSessionDelegate {
    func urlSession(_ session: URLSession,
                   didReceive challenge: URLAuthenticationChallenge,
                   completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        guard let serverTrust = challenge.protectionSpace.serverTrust else {
            completionHandler(.performDefaultHandling, nil)
            return
        }
        
        let credential = URLCredential(trust: serverTrust)
        completionHandler(.useCredential, credential)
    }
}
