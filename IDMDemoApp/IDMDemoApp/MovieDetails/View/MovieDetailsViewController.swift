//
//  MovieDetailsViewController.swift
//  IDMDemoApp
//
//  Created by Abhishek Madhavrao Binniwale (BLR GSS) on 13/03/22.
//

import UIKit

class MovieDetailsViewController: UIViewController {

    var movie: MovieModel?

    @IBOutlet weak var imageOutlet: UIImageView!
    @IBOutlet weak var releaseLabelOutlet: UILabel!
    @IBOutlet weak var ratingLabelOutlet: UILabel!
    @IBOutlet weak var populariryLabelOutlet: UILabel!
    @IBOutlet weak var overViewLabelOutlet: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setUpUI()
    }


    func setUpUI() {
        if let movie = self.movie {
            self.navigationController?.title = movie.title
            self.releaseLabelOutlet.text = movie.release_date
            self.ratingLabelOutlet.text = "\(movie.vote_average)"
            self.overViewLabelOutlet.text = movie.overview
            self.populariryLabelOutlet.text = "\(movie.popularity)"

            let apiUrl = APIURL(environment: .development)
            let basepath = apiUrl.imageBaseURL()
            let link = "\(basepath)/\(movie.poster_path)"
            // can movie this code to a another class and can handle image cache so will noe need to doenload it everytime
            imageOutlet.layer.cornerRadius = 20
            imageOutlet.clipsToBounds = true
            self.imageOutlet.downloadImageFrom(link: link, contentMode: .scaleAspectFit)
        }
    }
}
