// MARK: - SOURCE -
// https://www.hackingwithswift.com/books/ios-swiftui/working-with-dates

import Foundation


let today = Date()
let tomorrow = Date().addingTimeInterval(86_400)
let range = today...tomorrow


/// `1`
///`DateComponents` lets us read or write specific parts of a date
/// rather than the whole thing .

var components: DateComponents = DateComponents()
components.hour = 9
components.minute = 0
let date = Calendar.current.date(from: components) ?? Date()
// "Jan 1, 1 at 9:00 AM"



/// `2`
/// The second challenge is how we could read the hour they want to wake up .
/// Remember , DatePicker is bound to a Date giving us lots of information ,
/// so we need to find a way to pull out just the hour and minute components :

let hourlyComponents =
   Calendar.current.dateComponents([Calendar.Component.hour, Calendar.Component.minute],
                                   from: today)

let hour = hourlyComponents.hour ?? 0
let minutes = hourlyComponents.minute ?? 0



/// `3`
/// The last challenge is
/// how we can format dates and times ,
/// and once again Swift gives us a specific type to do most of the work for us .
/// This time it is called `DateFormatter`,
/// and it lets us convert a date into a String in a variety of ways :

let dateFormatter: DateFormatter = DateFormatter()
dateFormatter.timeStyle = DateFormatter.Style.short
dateFormatter.dateStyle = DateFormatter.Style.long

let dateString = dateFormatter.string(from: today)
// "Jul 31, 2021 at 11:34 AM"  when .medium dateStyle .
// "7/31/21, 11:35 AM"         when .short dateStyle .
// "July 31, 2021 at 11:36 AM" when .long dateStyle .


/**
 `NOTE`
 We could  even pass in an entirely custom format using `dateFormat`,
 but that is way out of the remit of this project !
 */


/*
 Moonshot project :
 
 
 var formattedLaunchDate: String {
    
    guard let _launchDate = launchDate
    else {
       return "N/A"
    }
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = .long
    
    return dateFormatter.string(from: _launchDate)
 }
 */

