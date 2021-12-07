//
//  EpisodeDetailModels.swift
//  RickAndMorty
//
//  Created by ignacio on 06-12-21.
//

import Foundation

enum EpisodeDetail {
    struct ViewModel {
        struct DisplayedEpisodeDetail {
            var title: String
            var airDate: String
            var episode: String
            var characters: [String]
        }
        var displayedEpisodeDetail: DisplayedEpisodeDetail
    }
}
