
import SwiftUI

struct WikiDetail: View {
 
    var item: Search
 
    var body: some View {
        WebView(pageId: item.pageid)
        .navigationBarTitle(Text(item.title), displayMode: .inline)
 
    }
}
