//
//  ListEpisodesViewController.swift
//  RickAndMorty
//
//  Created by ignacio on 06-12-21.
//

import UIKit

protocol ListEpisodesDisplayLogic: AnyObject {
  func displayFetchedEpisodes(viewModel: ListEpisodes.FetchEpisodes.ViewModel)
}

final class ListEpisodesViewController: UIViewController {
    var interactor: ListEpisodesBusinessLogic?
    var router: (NSObjectProtocol & ListEpisodesRoutingLogic & ListEpisodesDataPassing)?

    private var displayedEpisodes: [ListEpisodes.FetchEpisodes.ViewModel.DisplayedEpisode] = []

    private var table: UITableView = {
        var t = UITableView()
        return t
    }()

    init() {
        super.init(nibName: nil, bundle: nil)
        setup()
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        view.addSubview(table)
        table.translatesAutoresizingMaskIntoConstraints = false
        
        table.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        table.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        table.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        table.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    private func setup() {
        let viewController = self
        let interactor = ListEpisodesInteractor(episodesWorker: EpisodesWorker(episodesStore: EpisodesAPI()))
        let presenter = ListEpisodesPresenter()
        let router = ListEpisodesRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
        
        table.register(UITableViewCell.self, forCellReuseIdentifier: "EpisodeTableViewCell")
        table.dataSource = self
        table.delegate = self
    }
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Episodes"
        interactor?.fetchEpisodes()
    }
}

extension ListEpisodesViewController: ListEpisodesDisplayLogic {
    func displayFetchedEpisodes(viewModel: ListEpisodes.FetchEpisodes.ViewModel) {
        displayedEpisodes = viewModel.displayedEpisodes
        table.reloadData()
    }
}

extension ListEpisodesViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        displayedEpisodes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let displayedEpisode = displayedEpisodes[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "EpisodeTableViewCell", for: indexPath)
        cell.textLabel?.text = displayedEpisode.title
        return cell
    }
}

extension ListEpisodesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let navigationController = navigationController else { return }
        router?.routeToEpisodeDetail(navigationController: navigationController, index: indexPath.row)
    }
}
