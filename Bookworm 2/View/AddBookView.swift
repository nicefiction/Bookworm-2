// AddBookView.swift

import SwiftUI


struct AddBookView: View {
   
   // MARK: - PROPERTY WRAPPERS
   
   @Environment(\.managedObjectContext) var moc
   @Environment(\.presentationMode) var presentationMode // Depreceated
   @State private var author: String = ""
   @State private var genre: String = ""
   @State private var genreIndex: Int = 0 // OLIVIER
   @State private var rating: Int = 3
   @State private var review: String = ""
   @State private var title: String = ""
   

   
   // MARK: - PROPERTIES
   
   var genres: [String] = [
      "Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"
   ]
   
   
   
   // MARK: - COMPUTED PROPERTIES
   
   var body: some View {
      
      NavigationView {
         Form {
            Section {
               TextField("The name of the author...",
                         text: $author)
               TextField("The name of the book...",
                         text: $title)
               Picker("Genre",
                      selection: $genreIndex) {
                  ForEach(0..<genres.count) { (index: Int) in
                     Text(genres[index])
                  }
               } // OLIVIER
//               Picker("Genre",
//                      selection: $genre) { // OLIVIER : no start value
//                  ForEach(genres,
//                          id: \.self) { (genre: String) in
//                     Text(genre)
//                  }
//                      } // PAUL HUDSON
            }
            Section {
//               Stepper("\(rating) Stars",
//                       value: $rating,
//                       in: 0...5) // OLIVIER
//               Picker("My Rating:",
//                      selection: $rating) {
//                  ForEach(0..<6) { (number: Int) in
//                     Text("\(number) \(number == 1 ? "Star" : "Stars")")
//                  }
//               } // PAUL HUDSON
               RatingView(rating: $rating)
               TextField("My review...",
                         text: $review)
            }
            Section {
               HStack {
                  Spacer()
                  Button("Create Book") {
                     print("The Create Book button is tapped.")
                     
                     let newBook = Book(context: self.moc)
                     newBook.author = self.author
                     newBook.genre = self.genre
                     newBook.rating = Int16(self.rating)
                     newBook.review = self.review
                     newBook.title = self.title
                     
                     try? moc.save()
                     
                     self.presentationMode.wrappedValue.dismiss()
                  }
                  .padding()
                  Spacer()
               }
            }
         }
         .navigationTitle(Text("Create Book"))
      }
   }
}





// MARK: - PREVIEWS -

struct AddBookView_Previews: PreviewProvider {
   
   static var previews: some View {
      
      AddBookView()
   }
}
