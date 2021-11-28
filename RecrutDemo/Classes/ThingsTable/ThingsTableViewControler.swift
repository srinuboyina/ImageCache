import Foundation
import UIKit

class ThingsTableViewControler: UITableViewController {
    
    var selectedIndex = IndexPath(row: -1, section: -1)
    struct TableViewConstants {
        
        static let cellIdentifier = "Cell"
        static let rowHeight: CGFloat = 60
        static let estimatedRowHeight: CGFloat = 180
    }
    
    var viewModel = ThingsTableViewModel()
    
    convenience init() {
        self.init(nibName: nil, bundle: nil)
    }
    
    override func loadView() {
        super.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Things"
        tableView.register(ThingCell.self, forCellReuseIdentifier: "Cell")
        tableView.estimatedRowHeight = TableViewConstants.estimatedRowHeight
        tableView.rowHeight = TableViewConstants.rowHeight
        tableView.separatorColor = UIColor.black
        tableView.separatorStyle = .none
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.datasourceCount
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: ThingCell? = tableView.dequeueReusableCell(withIdentifier: TableViewConstants.cellIdentifier) as? ThingCell
        let thing = viewModel.things[indexPath.row]
        cell?.setData(model: thing)
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath
        tableView.deselectRow(at: indexPath, animated: true)
        let thingModel = viewModel.thing(for: indexPath)
        pushDetailsViewController(thingModel)
    }
    
    func pushDetailsViewController(_ thingModel: ThingModel) {
        
        let detailsViewController = ThingDetailsViewController()
        detailsViewController.thingModel = thingModel
        detailsViewController.delegate = self
        self.navigationController?.pushViewController(detailsViewController, animated: true)
    }
}

extension ThingsTableViewControler: ThingDetailsDelegate {

    func updateData() {
        tableView.reloadRows(at: [selectedIndex], with: .none)
    }
}






































































