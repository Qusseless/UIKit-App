
import Foundation

public class LocalState {
    
    private enum Keys: String{
        case hasOboarded
    }
    
    public static var hasOnboarded: Bool {
        get{
            return UserDefaults.standard.bool(forKey: Keys.hasOboarded.rawValue)
        }
        set(newValue) {
            UserDefaults.standard.set(newValue, forKey: Keys.hasOboarded.rawValue)
            UserDefaults.standard.synchronize()
        }
    }
    
}
