//
//  APICaller.swift
//  TargetVideo Task
//
//  Created by Macbook Air 2017 on 28. 1. 2025..
//

import Foundation

class APICaller {
    
    private static var nextPageToken: String?
    
    static func fetchPopularVideos(completion: @escaping ([YouTubeItem]?) -> Void) {
        
        guard var urlComponents = URLComponents(string: YOUTUBE_API + GET_VIDEOS_ENDPOINT) else {
            completion(nil)
            return
        }
        
        urlComponents.queryItems = [
            URLQueryItem(name: "key", value: API_KEY),
            URLQueryItem(name: "part", value: "snippet"),
            URLQueryItem(name: "chart", value: "mostPopular"),
            URLQueryItem(name: "maxResults", value: "10"),
            URLQueryItem(name: "pageToken", value: nextPageToken)
        ]
        
        guard let url = urlComponents.url else {
            completion(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: {
            data, response, error in
            
            guard let data = data,
                  let response = response as? HTTPURLResponse,
                  response.statusCode == 200,
                  error == nil
            else {
                completion(nil)
                return
            }
            
            guard let youtubeResponse = try? JSONDecoder().decode(YouTubeResponse.self, from: data) else {
                completion(nil)
                return
            }
            
            nextPageToken = youtubeResponse.nextPageToken
            completion(youtubeResponse.items)
        })
        task.resume()
    }
    
    static func getImageData(urlString: String) async -> Data? {
        
        guard let url = URL(string: urlString) else {
            return nil
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            return data
        }
        catch {
            return nil
        }
    }
}
