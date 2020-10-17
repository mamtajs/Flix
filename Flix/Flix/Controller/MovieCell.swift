//
//  MoviewCell.swift
//  Flix
//
//  Created by Mamta Shah on 10/17/20.
//

import UIKit

class MovieCell: UITableViewCell {

    @IBOutlet weak var MovieTitle: UILabel!
    @IBOutlet weak var moviePoster: UIImageView!
    @IBOutlet weak var MovieDescription: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
