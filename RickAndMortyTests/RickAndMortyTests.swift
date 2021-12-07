//
//  RickAndMortyTests.swift
//  RickAndMortyTests
//
//  Created by ignacio on 06-12-21.
//

import XCTest
@testable import RickAndMorty

class RickAndMortyTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        let expectation = self.expectation(description: "Interactor sends response")

        let interactor = ListEpisodesInteractor(episodesWorker: EpisodesWorker(episodesStore: EpisodesMockAPI()))
        let presenter = ListEpisodesPresenterSpy()
        interactor.presenter = presenter
        interactor.fetchEpisodes()
        
        presenter.completion =  {
            expectation.fulfill()
            XCTAssertEqual(presenter.response?.results.count, 20)
        }
        
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
}

class EpisodesMockAPI: EpisodesStoreProtocol {
    func fetchEpisodes(completionHandler: @escaping (ListEpisodes.FetchEpisodes.Response?, EpisodesStoreError?) -> Void) {
        let data = getData(name: "ListEpisodes", withExtension: "json")
        let json = try? JSONDecoder().decode(ListEpisodes.FetchEpisodes.Response.self, from: data)
        completionHandler(json, nil)
    }
    
    func getData(name: String, withExtension: String = "json") -> Data {
        let bundle = Bundle(for: type(of: self))
        let fileUrl = bundle.url(forResource: name, withExtension: withExtension)
        let data = try! Data(contentsOf: fileUrl!)
        return data
    }
}
