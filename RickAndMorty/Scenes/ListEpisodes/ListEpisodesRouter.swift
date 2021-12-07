//
//  ListEpisodesRouter.swift
//  RickAndMorty
//
//  Created by ignacio on 06-12-21.
//

import UIKit

protocol ListEpisodesRoutingLogic {
  func routeToEpisodeDetail(navigationController: UINavigationController, index: Int)
}

protocol ListEpisodesDataPassing {
  var dataStore: ListEpisodesDataStore? { get }
}

class ListEpisodesRouter: NSObject, ListEpisodesRoutingLogic, ListEpisodesDataPassing {
    var dataStore: ListEpisodesDataStore?
    weak var viewController: ListEpisodesViewController?

    func routeToEpisodeDetail(navigationController: UINavigationController, index: Int) {
        guard let episodes = dataStore?.episodes,
              index < episodes.count else {
                  return
              }
        let viewController = EpisodeDetailViewController(episode: episodes[index])
        navigationController.pushViewController(viewController, animated: true)
    }
}
