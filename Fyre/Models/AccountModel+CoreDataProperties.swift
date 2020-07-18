import Foundation
import CoreData


extension AccountModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AccountModel> {
        return NSFetchRequest<AccountModel>(entityName: "AccountModel")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var value: Double
    @NSManaged public var name: String?
    @NSManaged public var assets: [AssetModel]?
    @NSManaged public var type: NSObject?
}
