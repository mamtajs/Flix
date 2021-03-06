//
//  ViewController.swift
//  Flix
//
//  Created by Mamta Shah on 10/12/20.
//

import UIKit
import AlamofireImage

class FlixHomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    @IBOutlet weak var Table_View: UITableView!

    
    var movies = [[String:Any]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        Table_View.dataSource = self
        Table_View.delegate = self
        
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
           // This will run when the network request returns
            if let error = error {
                print(error.localizedDescription)
            }
            else if let data = data {
                // Get the array of movies
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                
                //print(dataDictionary)
                
                // Store the movies in a property to use elsewhere
                self.movies = dataDictionary["results"] as! [[String:Any]]
            
                // Reload your table view data
                self.Table_View.reloadData()

           }
        }
        task.resume()
    }


    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Table_View.dequeueReusableCell(withIdentifier: "MovieCell") as! MovieCell
        
        let movie = movies[indexPath.row]
        
        cell.MovieTitle.text = movie["title"] as! String
        
        cell.MovieDescription.text = movie["overview"] as! String
        
        //cell.moviePoster.image = movie["poster_path"] as! UIImage
        let baseURL = "https://image.tmdb.org/t/p/w185"
        let posterPath = movie["poster_path"] as! String
        let posterURL = URL(string:baseURL + posterPath)
        
        cell.moviePoster.af_setImage(withURL: posterURL!)
        
        return cell
    }
    
}

