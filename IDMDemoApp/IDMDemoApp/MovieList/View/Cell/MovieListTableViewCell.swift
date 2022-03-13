//
//  MovieListTableViewCell.swift
//  IDMDemoApp
//
//  Created by Abhishek Madhavrao Binniwale (BLR GSS) on 13/03/22.
//

import UIKit

class MovieListTableViewCell: UITableViewCell {

    @IBOutlet weak var movieImageOutlet: UIImageView!
    @IBOutlet weak var movieTitleOutlet: UILabel!
    @IBOutlet weak var movieSubTitileOutlet: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configureCell(movie: MovieModel) {
        self.movieTitleOutlet.text = movie.original_title
        self.movieSubTitileOutlet.text = movie.overview
        movieImageOutlet.layer.cornerRadius = 10
        movieImageOutlet.clipsToBounds = true
        let apiUrl = APIURL(environment: .development)
        let basepath = apiUrl.imageBaseURL()
        let link = "\(basepath)/\(movie.poster_path)"
        // can movie this code to a another class and can handle image cache so will noe need to doenload it everytime
        self.movieImageOutlet.downloadImageFrom(link: link, contentMode: .scaleAspectFit)
    }
}
