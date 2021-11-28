import Foundation
import UIKit

class ThingModel {
    
    let name: String
    var like: LikeStatus = .none
    var image: String?
    var type: String?
    var uuid: String?
    
    init(name: String) {
        self.name = name
    }
    
    func setLike(value: LikeStatus) {
        like = value
    }
}

























