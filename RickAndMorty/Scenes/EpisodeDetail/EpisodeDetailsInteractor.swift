//
//  EpisodeDetailsInteractor.swift
//  RickAndMorty
//
//  Created by ignacio on 06-12-21.
//

import Foundation

protocol EpisodeDetailsBusinessLogic {
  func sendEpisodeDetails()
}

final class EpisodeDetailsInteractor: EpisodeDetailsBusinessLogic {
    var presenter: EpisodeDetailPresentationLogic?

    private var episode: Episode?

    init(episode: Episode) {
        self.episode = episode
    }
    
    func sendEpisodeDetails() {
        guard let episode = episode else { return }
        presenter?.formatEpisodeDetails(episode: episode)
    }
}
