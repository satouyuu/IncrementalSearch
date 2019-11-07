
import SwiftUI

struct WikiSearchList: View {

    @ObservedObject var viewModel = WikiSearchModel()
 
    var body: some View {
        NavigationView {
            VStack {
                
                SearchBar("検索文字を入力", text: $viewModel.searchText)
                
                List (viewModel.itmes, id: \.pageid) { item in
                    NavigationLink(destination: WikiDetail(item: item)) {
                        Text(item.title)
                    }
                }
            }.onDisappear {
                self.viewModel.cancel()
            }
            .navigationBarTitle(Text("検索"), displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WikiSearchList()
    }
}

