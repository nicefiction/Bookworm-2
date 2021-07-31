// SelectingDatesAndTimes.swift
// SOURCE: https://www.hackingwithswift.com/books/ios-swiftui/selecting-dates-and-times-with-datepicker

import SwiftUI



struct SelectingDatesAndTimes: View {
   
   // MARK: - PROPERTY WRAPPERS
   
   @State private var wakeUp: Date = Date()
   
   
   
   // MARK: - PROPERTIES
   
   let today: Date = Date()
   let tomorrow: Date = Date().addingTimeInterval(86_400)
   // let range = today...tomorrow // OLIVIER : I can't replicate Paul Hudson's example .
   let range = Date()...Date().addingTimeInterval(86_400)
   
   
   
   // MARK: - COMPUTED PROPERTIES
   
   var body: some View {
      
//      Picker("Select date", selection: $wakeUp) {
//         Text("\(wakeUp)")
//            .padding()
//      }
      VStack {
         DatePicker("Select date:",
                    selection: $wakeUp)
         DatePicker("",
                    selection: $wakeUp)
         Form {
            DatePicker("Select Date",
                       selection: $wakeUp)
            DatePicker("Select Date",
                       selection: $wakeUp)
               .labelsHidden() /// That still includes the original label so screen readers can use it for VoiceOver , but now they aren’t visible onscreen any more .
            DatePicker("Select Time",
                       selection: $wakeUp,
                       displayedComponents: .hourAndMinute)
            DatePicker("Select Day",
                       selection: $wakeUp,
                       displayedComponents: .date)
            DatePicker("Select Time",
                       selection: $wakeUp,
                       in: range,
                       displayedComponents: .hourAndMinute)
            /// Swift lets us form one-sided ranges
            /// – ranges where we specify either the start or end but not both ,
            /// leaving Swift to infer the other side :
            DatePicker("Select Date",
                       selection: $wakeUp,
                       in: today...,
                       displayedComponents: .date)
         }
      }
      .padding()
   }
}





// MARK: - PREVIEWS -

struct SelectingDatesAndTimes_Previews: PreviewProvider {
   
   static var previews: some View {
      
      SelectingDatesAndTimes()
   }
}
