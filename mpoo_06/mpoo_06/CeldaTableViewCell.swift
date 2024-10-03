//
//  CeldaTableViewCell.swift
//  mpoo_06
//
//  Created by Germán Santos Jaimes on 11/09/24.
//

import UIKit

class CeldaTableViewCell: UITableViewCell {

    @IBOutlet weak var nombre: UILabel!
    @IBOutlet weak var imagen: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
