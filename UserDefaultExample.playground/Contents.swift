import UIKit

struct UserDefault {
    private let defaults = UserDefaults.standard
    
    internal enum keys: String, CaseIterable {
        case name
        case email
        case list1
        case list2
    }
    
    func getObject(key: keys) -> Any? {
       return defaults.value(forKey: key.rawValue)
    }
    
    func saveObject(key: keys, value: Any )  {
        defaults.set(value, forKey: key.rawValue)
    }
    
    
    func removeObject(key: keys)  {
        defaults.removeObject(forKey: key.rawValue)
    }
    
    
    func removeAllObjects()  {
        print("---// User Defaults \\---")
        for key in keys.allCases {
            defaults.removeObject(forKey: key.rawValue )
            print("removed object for key: \(key.rawValue)")
        }
        print(" ---End User Default---")
    }
    
}

//test example
let userdefault = UserDefault()

userdefault.removeAllObjects()




userdefault.saveObject(key: .list1, value: [1,2,3,4,5,6])
userdefault.saveObject(key: .name, value: "Muhammad Naveed")

// sucess case
if let name = userdefault.getObject(key: .name) as? String  {
    print("UserDefault: \(name)")
}
else {
    print("UserDefault: Name not found")
}


// failure case
if let items = userdefault.getObject(key: .list1) as? [Int]  {
    print("UserDefault: \(items)")
}
else {
     print("UserDefault: Name not found")
}
