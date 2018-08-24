import Foundation

extension Date {
    private static func days(from date: Date) -> Int {
        return Calendar.current.dateComponents([.day], from: date, to: Date()).day ?? 0
    }
    
    private static func seconds(from date: Date) -> Int? {
        return Calendar.current.dateComponents([.second], from: date, to: Date()).second
    }
    
    static func sectionHeaderFor(time value: Double) -> String {
        let calendar = Calendar.current
        let date = Date(timeIntervalSince1970: TimeInterval(value))
        
        if calendar.isDateInToday(date) {
            return "Today"
        } else if calendar.isDateInYesterday(date) {
            return "Yesterday"
        } else {
            return formattedString(from: date)
        }
    }
    
    static func formatted(time value: Double, forChat: Bool = false) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(value))
        
        func formattedTime() -> String {
            let formatter = DateFormatter()
            formatter.timeZone = TimeZone.current
            formatter.dateFormat = "hh:mm a"
            return formatter.string(from: date).uppercased()
        }
        
        if forChat {
            return formattedTime()
        }
        
        guard let seconds = seconds(from: date)  else {
            return formattedTime()
        }
        
        switch seconds {
        case 0...119: return "A Minute ago".uppercased()
        case 120...3599: return "\(Int(seconds/60)) minutes ago".uppercased()
        case 3600...7199: return "an hour ago".uppercased()
        default: return "\(Int(seconds/3600)) hours ago".uppercased()
        }
    }
    
    static func chronologicalFormat(_ value: Double?, forChat: Bool = false) -> String? {
        guard let timeStamp = value else {
            return nil
        }
        let calendar = Calendar.current
        let date = Date(timeIntervalSince1970: TimeInterval(timeStamp))
        
        if calendar.isDateInToday(date) {
            return formatted(time: timeStamp, forChat: forChat)
        } else if calendar.isDateInYesterday(date) {
            return "a day ago".uppercased()
        } else {
            return formattedDifference(from: date)
        }
    }
    
    static func formattedTime(from initial: String) -> String {
//        2018-07-11T09:55:57.093768+00:00
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSZ"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        guard let date = dateFormatter.date(from: initial) else {
            return ""
        }
        return chronologicalFormat(date.timeIntervalSince1970) ?? ""
    }
}

//MARK:- Private methods
extension Date {
    private static func formattedString(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd, yyyy"
        return formatter.string(from: date)
    }
    
    private static func formattedDifference(from date: Date) -> String {
        var string = String()
        let numberOfDays = days(from: date)
        if numberOfDays == 1 {
            string = "a day ago".uppercased()
        } else if numberOfDays < 7 {
            string = "\(numberOfDays) days ago".uppercased()
        } else {
            string = formattedString(from: date)
        }
        return string
    }
}
