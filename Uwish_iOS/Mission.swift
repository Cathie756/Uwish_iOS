import Foundation

struct Mission: Codable {
    var taskId: Int
    var title: String
    var userId: Int
    var userName: String
    var category: Int
    var dueDate: Date
    var city: String
    var district: String
    var districtId: Int
    var address: String
    var latitude: Double
    var longitude: Double
    var budget: Int
    var detail: String
    var status: Int
    
//    public init(taskId: Int, title: String, userId: Int, userName: String, category: Int, dueDate: Date, city: String, district: String, districtId: Int, address: String, latitude: Double, longitude: Double, budget: Int, detail: String, status: Int) {
//        self.taskId = taskId
//        self.title = title
//        self.userId = userId
//        self.userName = userName
//        self.category = category
//        self.dueDate = dueDate
//        self.city = city
//        self.district = district
//        self.districtId = districtId
//        self.address = address
//        self.latitude = latitude
//        self.longitude = longitude
//        self.budget = budget
//        self.detail = detail
//        self.status = status
//    }
    
    public static func showStatus(_ statusNumber: Int) -> String {
        var status = ""
        switch statusNumber {
            case 0: status = "待指派"
            case 1: status = "已成立"
            case 2: status = "進行中"
            case 3: status = "已完成"
            case 4: status = "未完成"
            case 5: status = "應徵失敗"
            default: status = ""
        }
        return status;
    }
    
    public static func showCategory(_ categoryNumber: Int) -> String {
        var category = ""
        switch categoryNumber {
            case 0: category = "買東西"
            case 1: category = "遛狗"
            case 2: category = "清潔"
            case 3: category = "搬家"
            case 4: category = "快遞"
            case 5: category = "煮飯"
            default: category = ""
        }
        return category
    }
    
//    public func addMission(category: Int, title: String, duedate: Date, districtId: Int, address: String, latitude: Double, longitude: Double, budget: Int, detail: String) {
//        self.category = category
//        self.title = title
//        self.dueDate = duedate
//        self.districtId = districtId
//        self.address = address
//        self.latitude = latitude
//        self.longitude = longitude
//        self.budget = budget
//        self.detail = detail
//    }
    
    
    
}
