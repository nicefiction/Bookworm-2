// DetailView.swift
// SOURCE : https://www.hackingwithswift.com/books/ios-swiftui/showing-book-details

import SwiftUI
import CoreData



struct DetailView: View {
   
   // MARK: PROPERTIES
   
   let book: Book
   
   
   
   // MARK: COMPUTED PROPERTIES
   
   var body: some View {
      
      GeometryReader { geometryProxy in
         VStack {
            ZStack(alignment: .bottom) {
               Image(book.genre ?? "N/A")
                  .resizable()
                  .scaledToFit()
//                  .frame(width: geometryProxy.size.width)
                  .clipShape(Capsule())
               Text(book.genre?.uppercased() ?? "N/A")
                  .font(.caption)
                  .fontWeight(.black)
                  .padding(8)
                  .foregroundColor(Color.white)
                  .background(Color.black.opacity(0.5))
                  .clipShape(Capsule())
                  .offset(x: 0,
                          y: -10)
            }
            .padding(10)
            Text(book.author ?? "N/A")
               .font(.title)
               .foregroundColor(.secondary)
            Text(book.review ?? "N/A")
               .padding()
            RatingView(rating: .constant(Int(book.rating)))
               .font(.largeTitle)
            Spacer()
         }
      }
   }
}





// MARK: - PREVIEWS -

struct DetailView_Previews: PreviewProvider {
   
   // MARK: PROPERTY WRAPPERS
   
   static let moc = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
   
   
   
   // MARK: COMPUTED PROPERTIES
   
   static var previews: some View {
      
      let previewBook = Book(context: moc)
      
      previewBook.author = "Dorothy"
      previewBook.genre = "Fantasy"
      previewBook.rating = 4
      previewBook.review = "Nice review."
      previewBook.title = "Emerald City"
      
      return DetailView(book: previewBook)
   }
}
