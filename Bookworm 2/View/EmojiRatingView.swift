// EmojiRatingView.swift

import SwiftUI



struct EmojiRatingView: View {
   
   // MARK: - PROPERTIES
   
   let rating: Int16 // OLIVIER : Read only
   
   
   
   // MARK: - COMPUTED PROPERTIES
   
   var body: some View {
      
      switch rating {
      case 1 : Text("😞")
      case 2 : Text("😒")
      case 3 : Text("🤔")
      case 4 : Text("☺️")
      default: Text("🤩")
      }
   }
}





// MARK: - PREVIEWS -

struct EmojiRatingView_Previews: PreviewProvider {
   
   static var previews: some View {
      
      EmojiRatingView(rating: 3)
   }
}
