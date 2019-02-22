

import Foundation

public struct Movie {
    
    var title: String
    var releaseDate: Date
    var description: String
    var id: Int
    var image: String
    
    init?(json: [String: Any]) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        guard let title = json["title"] as? String,
            let rd = json["release_date"] as? String,
            let releaseDate = dateFormatter.date(from: rd),
            let description = json["overview"] as? String,
            let id = json["id"] as? Int,
            let image = json["poster_path"] as? String else {
                return nil
        }
        self.title = title
        self.releaseDate = releaseDate
        self.description = description
        self.id = id
        self.image = image
    }
    
}
