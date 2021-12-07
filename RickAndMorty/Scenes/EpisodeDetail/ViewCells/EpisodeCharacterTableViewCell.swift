//
//  EpisodeCharacterTableViewCell.swift
//  RickAndMorty
//
//  Created by ignacio on 07-12-21.
//

import UIKit

class EpisodeCharacterTableViewCell: UITableViewCell {
    let character: UILabel = {
        let l = UILabel()
        l.font = UIFont.systemFont(ofSize: 15.0)
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
        contentView.addSubview(character)
        character.translatesAutoresizingMaskIntoConstraints = false
        
        character.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        character.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        character.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4).isActive = true
        character.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4).isActive = true
    }
    
    func configure(character: String?) {
        self.character.text = character
    }
}
