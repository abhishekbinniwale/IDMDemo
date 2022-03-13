//
//  MovieListViewController.swift
//  IDMDemoApp
//
//  Created by Abhishek Madhavrao Binniwale (BLR GSS) on 13/03/22.
//

import UIKit

class MovieListViewController: UIViewController, MovieListViewModelDelegate {

    @IBOutlet weak var movieListTableView: UITableView!
    private let cellIdentifier = "MovieListTableViewCell"
    private var viewModel = MovieListViewModel()
    var movieList = [MovieModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        movieListTableView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
        self.viewModel.delgate = self
        self.getData()
    }
    func getData() {
        viewModel.getMovieList()
    }

    func movieListResult(movies: [MovieModel]) {
        self.movieList.append(contentsOf: movies)
        DispatchQueue.main.async {
            self.movieListTableView.reloadData()
        }
    }
}

extension MovieListViewController: UITableViewDelegate , UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movieList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Can add the pagination code here to fetch the all pages in one by one
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier,for: indexPath) as! MovieListTableViewCell
        let movie = self.movieList[indexPath.row]
        cell.configureCell(movie: movie)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let movie = self.movieList[indexPath.row]
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let movieDetailsVc = storyboard.instantiateViewController(withIdentifier: "MovieDetailsViewController") as! MovieDetailsViewController
        movieDetailsVc.movie = movie
        self.navigationController?.pushViewController(movieDetailsVc, animated: true)
    }
}
