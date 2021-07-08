//
//  CountryTableViewCell.swift
//  TeamWork-Location
//
//  Created by Teo Elisashvili on 08.07.21.
//

import UIKit

class CountryTableViewCell: UITableViewCell {

    @IBOutlet weak var labelName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(with item: MainViewModel) {
        labelName.text = item.name
    }
}
