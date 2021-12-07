//
//  Seeds.swift
//  RickAndMortyTests
//
//  Created by ignacio on 07-12-21.
//

import Foundation
@testable import RickAndMorty

struct Seeds {
    struct Response {
        static let episodes = ListEpisodes.FetchEpisodes.Response(info: ListEpisodes.FetchEpisodes.Info(count: 51, pages: 3, next: "", prev: nil), results: [Episode(id: 0, name: "The first episode", airDate: "January 1st, 1900", episode: "S01E01", characters: ["https://rickandmortyapi.com/api/character/1"], url: "https://rickandmortyapi.com/api/episode/0", created: "1900-01-01T12:56:33.798Z")])
    }
}
