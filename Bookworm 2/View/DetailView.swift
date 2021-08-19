// DetailView.swift
// SOURCE : https://www.hackingwithswift.com/books/ios-swiftui/showing-book-details

import SwiftUI
import CoreData



struct DetailView: View {
   
   // MARK: PROPERTY WRAPPERS
   
   @Environment(\.managedObjectContext) var moc
   @Environment(\.presentationMode) var presentationMode
   @State private var isShowingDeleteAlert: Bool = false
   
   
   
   // MARK: PROPERTIES
   
   let book: Book
   
   
   
   // MARK: COMPUTED PROPERTIES
   
   var dateString: String {
      
      let dateFormatter: DateFormatter = DateFormatter()
      dateFormatter.timeStyle = DateFormatter.Style.short
      dateFormatter.dateStyle = DateFormatter.Style.long
      let dateString = dateFormatter.string(from: book.date ?? Date())
      
      return dateString
   }
   
   
   var body: some View {
      
      GeometryReader { geometryProxy in
         VStack {
            ZStack(alignment: .bottom) {
               Image(book.genre ?? "Fantasy")
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
            HStack {
               Text(dateString)
                  .foregroundColor(.secondary)
               Text(book.review ?? "N/A")
            }
            .padding()
            RatingView(rating: .constant(Int(book.rating)))
               .font(.largeTitle)
            Spacer()
         }
      }
      .navigationBarItems(
         trailing: Button(
            action: {
               print("The Delete button is tapped")
               isShowingDeleteAlert.toggle()
            }, label: {
               Image(systemName: "trash.fill")
                  .font(.title)
            }))
      .alert(isPresented: $isShowingDeleteAlert) {
         Alert(title: Text("Delete \(book.title ?? "N/A")"),
               message: Text("Are you sure?"),
               primaryButton: .destructive(
                  Text("Delete"),
                  action: { deleteBook(book) }),
               secondaryButton: .cancel())
      }
   }


   
   // MARK: METHODS
   
   func deleteBook(_ book: Book) {
      
      moc.delete(book)
      try? moc.save()
      presentationMode.wrappedValue.dismiss()
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
      previewBook.date = Date()
      previewBook.genre = "Fantasy"
      previewBook.rating = 4
      previewBook.review = "Nice review."
      previewBook.title = "Emerald City"
      
      return DetailView(book: previewBook)
   }
}
