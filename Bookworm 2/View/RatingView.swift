// RatingView.swift

import SwiftUI



struct RatingView: View {
   
   // MARK: - PROPERTY WRAPPERS
   
   @Binding var rating: Int // OLIVIER : Read + write
   
   
   
   // MARK: - PROPERTIES
   
   var label: String = ""
   var maximumRating: Int = 5
   var onImage: Image = Image(systemName: "star.fill")
   var offImage: Image?
   var onColor: Color = Color.yellow
   var offColor: Color = Color.gray
   
   
   
   // MARK: - COMPUTED PROPERTIES
   
   var body: some View {
      
      HStack {
         if !label.isEmpty {
            Text(label)
         }
         ForEach(1..<(maximumRating + 1)) { (ratingNumber: Int) in
            setRatingImage(for: ratingNumber)
               .foregroundColor(ratingNumber > rating ? offColor : onColor)
               .onTapGesture {
                  rating = ratingNumber
               }
         }
      }
   }

   
   
   // MARK: - METHODS
   
   func setRatingImage(for number: Int)
   -> Image {
      
      return number > rating ? (offImage ?? onImage) : onImage
   }
}
/*
 func image(for number: Int) -> Image {
     if number > rating {
         return offImage ?? onImage
     } else {
         return onImage
     }
 }
 */




// MARK: - PREVIEWS -

struct RatingView_Previews: PreviewProvider {
   
   static var previews: some View {
      
      RatingView(rating: .constant(3))
   }
}
