
import Foundation

public enum MgLanguage: String {
    case chinse
    case english
    case french
    case german
    
    var alpha2: String {
        
        return ""
    }
}
public extension Locale {
    
    static var isChina: Bool {
        return (Locale.region.lowercased().contains("cn") || isHans)
    }
    
    static var isCNRegion: Bool {
        return Locale.region.lowercased().contains("cn")
    }
    
    static var isGe: Bool {
        return Locale.region.lowercased().contains("de")
    }
    
    static var isFr: Bool {
        return Locale.language.lowercased().contains("fr")
    }
    
    static var isUS: Bool {
        return Locale.region.lowercased().contains("us")
    }
    
    static var isHans: Bool{
        return Locale.language.contains("hans")
    }
    
    static var isHant: Bool{
        return Locale.language.contains("hant")
    }
    
    static var isZh: Bool {
        return isHans || isHant
    }
    
    /// 是否为中国区
    static let isInChina: Bool = {
        let currentLocale = Locale.current
        let countryCode = currentLocale.regionCode
        let langCode = currentLocale.languageCode
        if countryCode == "CN" || (langCode?.contains("zh") == true) {
            return true
        }
        return false
    }()
    
    static let timeZoneId: String = {
        guard let zoneId = NSTimeZone.system.abbreviation() else {
            return ""
        }
        return zoneId
    }()
    
}

public extension Locale {
    
    //繁体中文
    static func isHantZH() -> Bool {
        let systemLanguages = NSLocale.preferredLanguages
        let currentLanguage = systemLanguages.first ?? ""
        print("currentLanguage == \(currentLanguage)")
        return currentLanguage.lowercased().contains("hant")
    }
    
    //简体中文
    static func isHansZH() -> Bool {
        let systemLanguages = NSLocale.preferredLanguages
        let currentLanguage = systemLanguages.first ?? ""
        print("currentLanguage == \(currentLanguage)")
        return currentLanguage.lowercased().contains("hans")
    }

    
    static var languageLowCode: String {
        //语言代码，2位小写，采用ISO 639-1标准，例如：en 中文繁体特殊处理: zh-TW
//        return Locale.current.languageCode?.lowercased() ?? "en"
        let currentLanguage = Locale.preferredLanguages.first ?? ""
        let languageRegion = currentLanguage.components(separatedBy: "-")
        if let language = languageRegion.first {
            if language == "zh" && isHantZH() {
                return "zh-tw"
            }else {
                return language
            }
        } else {
            return "en"
        }
    }
    
    static var secLanguageLowCode: String {
        //语言代码，2位小写，采用ISO 639-1标准，例如：en 中文繁体特殊处理: zh-TW
//        return Locale.current.languageCode?.lowercased() ?? "en"
        let currentLanguage = Locale.preferredLanguages.first ?? ""
        let languageRegion = currentLanguage.components(separatedBy: "-")
        if let language = languageRegion.first {
            if language == "zh" && isHantZH() {
                return "zh-TW"
            }else {
                return language
            }
        } else {
            return "en"
        }
    }
    
    static var language: String {
        let currentLanguage = Locale.preferredLanguages.first ?? ""
        return currentLanguage.lowercased()
    }
    
    static var region: String {
        return Locale.current.regionCode?.uppercased() ?? "US"
    }
    
    //俄语
    static func isRU() -> Bool {
        let systemLanguages = NSLocale.preferredLanguages
        let currentLanguage = systemLanguages.first ?? ""
        return currentLanguage.lowercased().contains("ru")
    }
    
    //俄语
    static func isPT() -> Bool {
        let systemLanguages = NSLocale.preferredLanguages
        let currentLanguage = systemLanguages.first ?? ""
        return currentLanguage.lowercased().contains("pt")
    }
}


public func DCLocalizedStringWithDefaultLang(key: String ,tableName: String?) -> String {
    let defaultValuePath = Bundle.main.path(forResource: "en", ofType: "lproj")
    let defaultValue = Bundle.init(path: defaultValuePath!)?.localizedString(forKey: key, value: nil, table: tableName)
    return Bundle.main.localizedString(forKey: key, value: defaultValue, table: tableName)
}
public func DCLocalizedString(_ key: String) -> String{
    return DCLocalizedStringWithDefaultLang(key: key, tableName: nil)
}

public func DCLocalizedStringForTable(key:String,tableName: String) -> String{
    return DCLocalizedStringWithDefaultLang(key: key, tableName: tableName)
}
