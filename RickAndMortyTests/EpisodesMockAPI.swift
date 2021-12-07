//
//  EpisodesMockAPI.swift
//  RickAndMortyTests
//
//  Created by ignacio on 07-12-21.
//

import Foundation
@testable import RickAndMorty

class EpisodesMockAPI: EpisodesStoreProtocol {
    var fileName: String = "ListEpisodes"
    func fetchEpisodes(completionHandler: @escaping (ListEpisodes.FetchEpisodes.Response?, EpisodesStoreError?) -> Void) {
        if let data = getData(name: fileName, withExtension: "json"),
           let json = try? JSONDecoder().decode(ListEpisodes.FetchEpisodes.Response.self, from: data) {
            completionHandler(json, nil)
        } else {
            completionHandler(nil, EpisodesStoreError.CannotFetch("Can't load data"))
        }
    }
    
    private func getData(name: String, withExtension: String = "json") -> Data? {
        let bundle = Bundle(for: type(of: self))
        guard let fileUrl = bundle.url(forResource: name, withExtension: withExtension),
              let data = try? Data(contentsOf: fileUrl) else {
            return nil
        }
        return data
    }
}
