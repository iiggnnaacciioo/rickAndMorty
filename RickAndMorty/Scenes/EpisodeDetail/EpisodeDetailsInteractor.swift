//
//  EpisodeDetailsInteractor.swift
//  RickAndMorty
//
//  Created by ignacio on 06-12-21.
//

import Foundation

protocol EpisodeDetailsBusinessLogic {
  func formatEpisodeDetail()
}

final class EpisodeDetailsInteractor: EpisodeDetailsBusinessLogic {
    var presenter: EpisodeDetailPresentationLogic?

    private var episode: Episode?

    init(episode: Episode) {
        self.episode = episode
    }
    
    func formatEpisodeDetail() {
        guard let episode = episode else { return }
        presenter?.presentEpisodeDetails(episode: episode)
    }
}
