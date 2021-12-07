//
//  ListEpisodeSceneTests.swift
//  ListEpisodeSceneTests
//
//  Created by ignacio on 06-12-21.
//

import XCTest
@testable import RickAndMorty

class ListEpisodeSceneTests: XCTestCase {
    func testInteractor() throws {
        let sut = ListEpisodesInteractor(episodesWorker: EpisodesWorker(episodesStore: EpisodesMockAPI()))
        let presenter = ListEpisodesPresenterSpy()
        sut.presenter = presenter
        
        let expectation = self.expectation(description: "Interactor sends response")
        presenter.completion = {
            expectation.fulfill()
            XCTAssertEqual(presenter.response?.results.count, 20)
        }
        
        sut.fetchEpisodes()
    
        waitForExpectations(timeout: 1) { error in
            if let error = error {
                XCTFail("wait for expectations failed with error \(error)")
            }
        }
    }
    
    func testInteractorWithError() throws {
        let mockAPI = EpisodesMockAPI()
        mockAPI.fileName = "dsfsdf"
        
        let sut = ListEpisodesInteractor(episodesWorker: EpisodesWorker(episodesStore: mockAPI))
        let presenter = ListEpisodesPresenterSpy()
        sut.presenter = presenter
        
        let expectation = self.expectation(description: "Interactor sends response")
        presenter.completion = {
            expectation.fulfill()
            XCTAssertNil(presenter.response)
        }
        
        sut.fetchEpisodes()
    
        waitForExpectations(timeout: 1) { error in
            if let error = error {
                XCTFail("wait for expectations failed with error \(error)")
            }
        }
    }
    
    func testPresenter() throws {
        let sut = ListEpisodesPresenter()
        let viewController = ListEpisodesViewControllerSpy()
        sut.viewController = viewController
        
        let expectation = self.expectation(description: "Presenter presents viewmodel from response")
        viewController.completion = {
            expectation.fulfill()
            XCTAssertEqual(viewController.viewModel?.displayedEpisodes.count, 1)
        }
        
        sut.presentFetchedEpisodes(response: Seeds.Response.episodes)

        waitForExpectations(timeout: 1) { error in
            if let error = error {
                XCTFail("wait for expectations failed with error \(error)")
            }
        }
    }
    
    func testPresenterWithError() throws {
        let sut = ListEpisodesPresenter()
        let viewController = ListEpisodesViewControllerSpy()
        sut.viewController = viewController
        
        let expectation = self.expectation(description: "Presenter presents viewmodel from response")
        viewController.completion = {
            expectation.fulfill()
            XCTAssertNil(viewController.viewModel)
        }
        
        sut.presentError()

        waitForExpectations(timeout: 1) { error in
            if let error = error {
                XCTFail("wait for expectations failed with error \(error)")
            }
        }
    }
}

class ListEpisodesPresenterSpy: ListEpisodesPresentationLogic {
    var response: ListEpisodes.FetchEpisodes.Response?
    var completion: (()->())?
    
    func presentFetchedEpisodes(response: ListEpisodes.FetchEpisodes.Response) {
        self.response = response
        completion?()
    }
    func presentError(){
        completion?()
    }
}

class ListEpisodesViewControllerSpy: ListEpisodesDisplayLogic {
    var viewModel: ListEpisodes.FetchEpisodes.ViewModel?
    var completion: (()->())?
    func displayFetchedEpisodes(viewModel: ListEpisodes.FetchEpisodes.ViewModel) {
        self.viewModel = viewModel
        completion?()
    }
    func displayError(){
        completion?()
    }
}
