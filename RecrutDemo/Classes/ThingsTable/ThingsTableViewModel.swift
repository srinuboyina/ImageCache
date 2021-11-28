import Foundation

struct ThingsTableViewModel {
    
    var things = mockData()
    var datasourceCount: Int {
        return things.count
    }
    
    func thing(for indexPath: IndexPath) -> ThingModel {
        return things[indexPath.row]
    }
}











