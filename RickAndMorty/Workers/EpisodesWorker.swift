//
//  EpisodesWorker.swift
//  RickAndMorty
//
//  Created by ignacio on 06-12-21.
//

import Foundation

class EpisodesWorker
{
    var episodesStore: EpisodesStoreProtocol
  
    init(episodesStore: EpisodesStoreProtocol) {
        self.episodesStore = episodesStore
    }

    func fetchEpisodes(completionHandler: @escaping (ListEpisodes.FetchEpisodes.Response?) -> Void) {
        episodesStore.fetchEpisodes { response, error in
            if error != nil {
                DispatchQueue.main.async {
                    completionHandler(nil)
                }
            } else {
                DispatchQueue.main.async {
                    completionHandler(response)
                }
            }
        }
    }
}

// MARK: - Episodes store API

protocol EpisodesStoreProtocol {
    func fetchEpisodes(completionHandler: @escaping (ListEpisodes.FetchEpisodes.Response?, EpisodesStoreError?) -> Void)
}

// MARK: - Episodes store CRUD operation errors
enum EpisodesStoreError: Equatable, Error {
    case CannotFetch(String)
}

func ==(lhs: EpisodesStoreError, rhs: EpisodesStoreError) -> Bool {
    switch (lhs, rhs) {
    case (.CannotFetch(let a), .CannotFetch(let b)) where a == b: return true
    default: return false
    }
}
