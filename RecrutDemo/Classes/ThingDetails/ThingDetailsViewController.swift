import Foundation
import UIKit
import SDWebImage

class ThingDetailsViewController: UIViewController {
    
    private let baseView = ThingDetailsView()
    var thingModel: ThingModel!
    weak var delegate: ThingDetailsDelegate? = nil
    
    convenience init() {
        self.init(nibName: nil, bundle: nil)
    }
    
    override func loadView() {
        view = baseView
        view.backgroundColor = UIColor.white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let thingModel = thingModel {
            title = thingModel.name
            
            baseView.likeButton.addTarget(self, action: #selector(didTapLikeButton), for: .touchUpInside)
            baseView.dislikeButton.addTarget(self, action: #selector(didTapDislikeButton), for: .touchUpInside)
            displayImage()
        }
    }
    
    @objc func didTapLikeButton() {
        thingModel.like = .like
        self.navigationController?.popViewController(animated: true)
        delegate?.updateData()
    }
    
    @objc
    func didTapDislikeButton() {
        thingModel.like = .unlike
        self.navigationController?.popViewController(animated: true)
        delegate?.updateData()
    }
    
    func displayImage() {
        baseView.setThing(image: thingModel.image)
    }
}


