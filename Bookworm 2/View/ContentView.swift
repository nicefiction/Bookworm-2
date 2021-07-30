// ContentView.swift

import SwiftUI
import CoreData



struct ContentView: View {
   
   // MARK: PROPERTY WRAPPERS
   
   @Environment(\.managedObjectContext) var moc
   @FetchRequest(entity: Book.entity(),
                 sortDescriptors: [
                  NSSortDescriptor(keyPath: \Book.title, ascending: true),
                  NSSortDescriptor(keyPath: \Book.author, ascending: true)
                 ]) var books: FetchedResults<Book>
   @State private var isShowingAddBookSheet: Bool = false
   

   
   // MARK: - COMPUTED PROPERTIES
   
   var body: some View {
      
      NavigationView {
         List {
            ForEach(books,
                    id: \.self) { (book: Book) in
               NavigationLink(destination: DetailView(book: book)) {
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
            .onDelete(perform: deleteBooks)
         }
         .navigationTitle(Text("Bookworm"))
         .navigationBarItems(
            leading: EditButton(),
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
   
   
   
   // MARK: METHODS
   
   func deleteBooks(at offsets: IndexSet) {
      
      for offset in offsets {
         /// `STEP 1` Find this book in our fetch request :
         let book = books[offset]
         /// `STEP 2` Delete it from the context :
         moc.delete(book)
      }
      /// `STEP 3` Save the Context :
      try? moc.save()
   }
   
   /// OLIVIER :
   /// This is how we did it with the iExpense project :
   /*
    func removeItems(atOffsets offsets: IndexSet) {
       
       expenses.items.remove(atOffsets: offsets)
    }
    */
}





// MARK: - PREVIEWS -

struct ContentView_Previews: PreviewProvider {
   
   static var previews: some View {
      
      ContentView()
   }
}
