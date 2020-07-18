import Foundation
import CoreData


extension AssetModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AssetModel> {
        return NSFetchRequest<AssetModel>(entityName: "AssetModel")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var code: String?
    @NSManaged public var name: String?
    @NSManaged public var value: Double
    @NSManaged public var cost: Double
    @NSManaged public var amount: Double
    @NSManaged public var type: String?
    @NSManaged public var sector: String?
}
