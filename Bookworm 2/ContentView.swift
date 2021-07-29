// ContentView.swift

import SwiftUI
import CoreData



struct ContentView: View {
   
   // MARK: PROPERTY WRAPPERS
   
   @Environment(\.managedObjectContext) var moc
   @FetchRequest(entity: Book.entity(),
                 sortDescriptors: []) var books: FetchedResults<Book>
   @State private var isShowingAddBookSheet: Bool = false
   

   
   // MARK: - COMPUTED PROPERTIES
   
   var body: some View {
      
      NavigationView {
         List {
            ForEach(books,
                    id: \.self) { (book: Book) in
               NavigationLink(destination: Text(book.title ?? "N/A")) {
                  EmojiRatingView(rating: book.rating)
                     .font(.largeTitle)
                  VStack(alignment: .leading) {
                     Text(book.title ?? "N/A")
                        .font(.headline)
                     Text(book.author ?? "N/A")
                        .foregroundColor(.secondary)
                  }
               }
            }
         }
         .navigationTitle(Text("Bookworm"))
         .navigationBarItems(
            trailing:
               Button(action: {
                  print("The Add Book button is tapped.")
                  isShowingAddBookSheet.toggle()
               }, label: {
                  Image(systemName: "plus.circle")
                     .font(.largeTitle)
               }))
         .sheet(isPresented: $isShowingAddBookSheet) {
            AddBookView()
               .environment(\.managedObjectContext,
                            self.moc)
         }
      }
   }
}





// MARK: - PREVIEWS -

struct ContentView_Previews: PreviewProvider {
   
   static var previews: some View {
      
      ContentView()
   }
}
