//
//  ListEpisodesModels.swift
//  RickAndMorty
//
//  Created by ignacio on 06-12-21.
//

import Foundation

enum ListEpisodes {
    enum FetchEpisodes {
        struct Request { }

        struct Response: Codable {
            let info: Info
            let results: [Episode]
        }

        struct Info: Codable {
            let count, pages: Int
            let next: String
            let prev: String?
        }

        struct ViewModel {
            struct DisplayedEpisode {
                var title: String
            }
            var displayedEpisodes: [DisplayedEpisode]
        }
    }
}
