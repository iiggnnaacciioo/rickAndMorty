//
//  EpisodeDetailSceneTests.swift
//  RickAndMortyTests
//
//  Created by ignacio on 07-12-21.
//

import XCTest
@testable import RickAndMorty

class EpisodeDetailSceneTests: XCTestCase {
    func testInteractor() throws {
        guard let episode = Seeds.Response.episodes.results.first else { return }
        let sut = EpisodeDetailsInteractor(episode: episode)
        let presenter = EpisodeDetailPresenterSpy()
        sut.presenter = presenter
        
        let expectation = self.expectation(description: "Interactor sends episode")
        presenter.completion = {
            expectation.fulfill()
            XCTAssertEqual(presenter.episode?.name, "The first episode")
        }
        
        sut.sendEpisodeDetails()

        waitForExpectations(timeout: 1) { error in
            if let error = error {
                XCTFail("wait for expectations failed with error \(error)")
            }
        }
    }
    
    func testPresenter() throws {
        guard let episode = Seeds.Response.episodes.results.first else { return }

        let sut = EpisodeDetailPresenter()
        let viewController = EpisodeDetailViewControllerSpy()
        sut.viewController = viewController
        
        let expectation = self.expectation(description: "Presenter formats viewmodel from episode")
        viewController.completion = {
            expectation.fulfill()
            XCTAssertEqual(viewController.viewModel?.title, "The first episode")
        }
        
        sut.formatEpisodeDetails(episode: episode)

        waitForExpectations(timeout: 1) { error in
            if let error = error {
                XCTFail("wait for expectations failed with error \(error)")
            }
        }
    }

}

class EpisodeDetailPresenterSpy: EpisodeDetailPresentationLogic {
    var episode: Episode?
    var completion: (()->())?

    func formatEpisodeDetails(episode: Episode) {
        self.episode = episode
        completion?()
    }
}

class EpisodeDetailViewControllerSpy: EpisodeDetailDisplayLogic {
    var viewModel: EpisodeDetail.ViewModel.DisplayedEpisodeDetail?
    var completion: (()->())?
    
    func displayEpisodeDetail(viewModel: EpisodeDetail.ViewModel.DisplayedEpisodeDetail) {
        self.viewModel = viewModel
        completion?()
    }
}
