//
//  EpisodeInfoTableViewCell.swift
//  RickAndMorty
//
//  Created by ignacio on 07-12-21.
//

import UIKit

class EpisodeInfoTableViewCell: UITableViewCell {
    let stackView: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .vertical
        sv.spacing = 8
        return sv
    }()
    
    let airDateTitle: UILabel = {
        let l = UILabel()
        l.font = UIFont.boldSystemFont(ofSize: 15.0)
        l.text = "Air Date"
        return l
    }()
    
    let airDate: UILabel = {
        let l = UILabel()
        l.font = UIFont.systemFont(ofSize: 15.0)
        l.text = "-"
        return l
    }()

    let episodeTitle: UILabel = {
        let l = UILabel()
        l.font = UIFont.boldSystemFont(ofSize: 15.0)
        l.text = "Episode"
        return l
    }()
    
    let episode: UILabel = {
        let l = UILabel()
        l.font = UIFont.systemFont(ofSize: 15.0)
        l.text = "-"
        return l
    }()

    let charactersTitle: UILabel = {
        let l = UILabel()
        l.font = UIFont.boldSystemFont(ofSize: 15.0)
        l.text = "Characters"
        return l
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        contentView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16).isActive = true
        stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8).isActive = true
        
        stackView.addArrangedSubview(airDateTitle)
        stackView.addArrangedSubview(airDate)
        stackView.addArrangedSubview(episodeTitle)
        stackView.addArrangedSubview(episode)
        stackView.addArrangedSubview(charactersTitle)
    }
    
    func configure(airDate: String?, episode: String?) {
        self.airDate.text = airDate
        self.episode.text = episode
    }
}
