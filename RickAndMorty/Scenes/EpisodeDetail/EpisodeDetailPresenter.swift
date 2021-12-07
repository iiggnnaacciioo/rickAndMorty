//
//  EpisodeDetailPresenter.swift
//  RickAndMorty
//
//  Created by ignacio on 07-12-21.
//

import Foundation

protocol EpisodeDetailPresentationLogic {
    func presentEpisodeDetails(episode: Episode)
}

class EpisodeDetailPresenter: EpisodeDetailPresentationLogic {
    weak var viewController: EpisodeDetailDisplayLogic?

    func presentEpisodeDetails(episode: Episode) {
        /*var displayedEpisodes: [ListEpisodes.FetchEpisodes.ViewModel.DisplayedEpisode] = []
        for episode in response.results {
            let displayedEpisode = ListEpisodes.FetchEpisodes.ViewModel.DisplayedEpisode(title: episode.name)
            displayedEpisodes.append(displayedEpisode)
        }*/
        let viewModel = EpisodeDetail.ViewModel.DisplayedEpisodeDetail(title: episode.name,
                                                                       airDate: episode.airDate,
                                                                       episode: episode.episode,
                                                                       characters: episode.characters)
        print("eraser me episode: ", episode)
        viewController?.displayEpisodeDetail(viewModel: viewModel)
    }
}
