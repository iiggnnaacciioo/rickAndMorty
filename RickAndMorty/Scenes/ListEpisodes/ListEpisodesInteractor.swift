//
//  ListEpisodesInteractor.swift
//  RickAndMorty
//
//  Created by ignacio on 06-12-21.
//

import Foundation

protocol ListEpisodesBusinessLogic {
  func fetchEpisodes()
}

protocol ListEpisodesDataStore {
  var episodes: [Episode]? { get }
}

class ListEpisodesInteractor: ListEpisodesBusinessLogic, ListEpisodesDataStore {
    var presenter: ListEpisodesPresentationLogic?
    
    var episodesWorker = EpisodesWorker(episodesStore: EpisodesAPI())
    var episodes: [Episode]?

    // MARK: - Fetch episodes
    func fetchEpisodes() {
        episodesWorker.fetchEpisodes { (response) -> Void in
            self.episodes = response?.results
            
            if let response = response {
                self.presenter?.presentFetchedEpisodes(response: response)
            }
        }
    }
}
