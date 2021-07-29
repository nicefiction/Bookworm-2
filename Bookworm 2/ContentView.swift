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
         Text("There are \(books.count) books to read.")
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
