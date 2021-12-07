//
//  EpisodesAPI.swift
//  RickAndMorty
//
//  Created by ignacio on 06-12-21.
//

import Foundation

class EpisodesAPI: EpisodesStoreProtocol {
    func fetchEpisodes(completionHandler: @escaping (ListEpisodes.FetchEpisodes.Response?, EpisodesStoreError?) -> Void) {
        guard let url = URL(string: "https://rickandmortyapi.com/api/episode") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                return
            }
            
            guard let data = data else { return }
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                let json = try? JSONDecoder().decode(ListEpisodes.FetchEpisodes.Response.self, from: data)
                completionHandler(json, nil)
            } else {
                print("error")
            }
        }.resume()
    }
}
