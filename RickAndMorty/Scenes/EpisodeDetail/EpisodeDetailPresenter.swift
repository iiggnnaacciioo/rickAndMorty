//
//  EpisodeDetailPresenter.swift
//  RickAndMorty
//
//  Created by ignacio on 07-12-21.
//

import Foundation

protocol EpisodeDetailPresentationLogic {
    func formatEpisodeDetails(episode: Episode)
}

final class EpisodeDetailPresenter: EpisodeDetailPresentationLogic {
    weak var viewController: EpisodeDetailDisplayLogic?

    func formatEpisodeDetails(episode: Episode) {
        let viewModel = EpisodeDetail.ViewModel.DisplayedEpisodeDetail(title: episode.name,
                                                                       airDate: episode.airDate,
                                                                       episode: episode.episode,
                                                                       characters: formatEpisodeCharacter(episode.characters))
        viewController?.displayEpisodeDetail(viewModel: viewModel)
    }
    
    private func formatEpisodeCharacter(_ episodeCharacters: [String]) -> [String] {
        let formattedCharacters: [String] = episodeCharacters.compactMap {
            let array = $0.components(separatedBy: "/")
            return "Character " + (array.last ?? "")
        }
        return formattedCharacters
    }
}
