//
//  ViewController.swift
//  realmTest
//
//  Created by Hmoo Myat Theingi on 18/01/2024.
//

import UIKit
import RealmSwift
import RxSwift
import RxCocoa

class ViewController: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource {
    var movies: [Movie] = []
    var currentTablePage = 1

    @IBOutlet var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchMovies()
    }
    
    func fetchMovies() {
        NetworkManager.shared.getMovies(page: currentTablePage) { result in
            switch result {
            case .success(let movieResponse):
                if let fetchedMovies = movieResponse.results {
                    self.movies.append(contentsOf: fetchedMovies)
                    print("Movie count",self.movies.count)
                    DispatchQueue.main.async {
                        self.collectionView.reloadData()
                    }
                }
                
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    //MARK: - CollectionView
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MovieCollectionCell

        cell.movieImage.image = nil
        
        let movie = movies[indexPath.item]
        WishlistManager.shared.updateWishlistButton(button: cell.wishlistButton, for: movie)

        cell.movie = movie  // Set the movie for the cell
        
        // Set movie image
        if let posterPath = movie.posterPath,
           let url = URL(string: "https://image.tmdb.org/t/p/w500\(posterPath)") {
            cell.movieImage.load(url: url)
        } else {
            cell.movieImage.image = UIImage(named: "appleLogo")
        }
        
        // Set movie title
        return cell
    }
    
    


}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self?.image = image
                }
            }
        }
    }
}

class MovieCollectionCell:UICollectionViewCell{
    
    var movie: Movie?
    @IBOutlet var movieImage: UIImageView!
    @IBOutlet var wishlistButton: UIButton!
    
    @IBAction func wishlistButtonTapped(_ sender: UIButton) {
        guard let movie = movie else {
              return
          }
          
          WishlistManager.shared.toggleWishlistStatus(for: movie)
          
          // Update the button appearance based on the wishlist status
          WishlistManager.shared.updateWishlistButton(button: wishlistButton, for: movie)
        print(WishlistManager.shared.getWishlistMovies())
    }
    
    
}

