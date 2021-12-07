//
//  EpisodeDetailViewController.swift
//  RickAndMorty
//
//  Created by ignacio on 06-12-21.
//

import UIKit

protocol EpisodeDetailDisplayLogic: AnyObject {
    func displayEpisodeDetail(viewModel: EpisodeDetail.ViewModel.DisplayedEpisodeDetail)
}

final class EpisodeDetailViewController: UIViewController {
    var interactor: EpisodeDetailsBusinessLogic?

    var displayedEpisodeDetail: EpisodeDetail.ViewModel.DisplayedEpisodeDetail?
    
    private var table: UITableView = {
        var t = UITableView()
        return t
    }()

    init(episode: Episode) {
        super.init(nibName: nil, bundle: nil)
        setup(episode: episode)
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
        
        table.register(UITableViewCell.self, forCellReuseIdentifier: "EpisodeDetailTableViewCell")
        table.dataSource = self
    }
    
    private func setup(episode: Episode) {
        let viewController = self
        let interactor = EpisodeDetailsInteractor(episode: episode)
        let presenter = EpisodeDetailPresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        interactor?.formatEpisodeDetail()
    }
    
    override func viewDidLoad() {
        view.backgroundColor = .orange
    }
}
    
extension EpisodeDetailViewController: EpisodeDetailDisplayLogic {
    func displayEpisodeDetail(viewModel: EpisodeDetail.ViewModel.DisplayedEpisodeDetail) {
        displayedEpisodeDetail = viewModel
        print("eraser me displayEpisodeDetail: ", viewModel)
        table.reloadData()
    }
}

extension EpisodeDetailViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        displayedEpisodeDetail?.title
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2 + (displayedEpisodeDetail?.characters.count ?? 0)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EpisodeDetailTableViewCell", for: indexPath)
        let row = indexPath.row
        if row == 0 {
            cell.textLabel?.text = displayedEpisodeDetail?.airDate
        } else if row == 1 {
            cell.textLabel?.text = displayedEpisodeDetail?.episode
        } else {
            cell.textLabel?.text = displayedEpisodeDetail?.characters[indexPath.row - 2]
        }
        return cell
    }
}
