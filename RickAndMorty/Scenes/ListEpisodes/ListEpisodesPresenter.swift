//
//  ListEpisodesPresenter.swift
//  RickAndMorty
//
//  Created by ignacio on 06-12-21.
//

import Foundation

protocol ListEpisodesPresentationLogic {
    func presentFetchedEpisodes(response: ListEpisodes.FetchEpisodes.Response)
}

class ListEpisodesPresenter: ListEpisodesPresentationLogic {
    weak var viewController: ListEpisodesDisplayLogic?

    func presentFetchedEpisodes(response: ListEpisodes.FetchEpisodes.Response) {
        var displayedEpisodes: [ListEpisodes.FetchEpisodes.ViewModel.DisplayedEpisode] = []
        for episode in response.results {
            let displayedEpisode = ListEpisodes.FetchEpisodes.ViewModel.DisplayedEpisode(title: episode.name)
            displayedEpisodes.append(displayedEpisode)
        }
        let viewModel = ListEpisodes.FetchEpisodes.ViewModel(displayedEpisodes: displayedEpisodes)
        viewController?.displayFetchedEpisodes(viewModel: viewModel)
    }
}
