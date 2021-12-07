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
    
    let airDateTitle: UILabel = UILabel.boldLabel(text: "AirDate", ofSize: 15.0)

    let airDate: UILabel = UILabel.label(text: "-", ofSize: 15.0)

    let episodeTitle: UILabel = UILabel.boldLabel(text: "Episode", ofSize: 15.0)
    
    let episode: UILabel = UILabel.label(text: "-", ofSize: 15.0)

    let charactersTitle: UILabel = UILabel.boldLabel(text: "Characters", ofSize: 15.0)

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
