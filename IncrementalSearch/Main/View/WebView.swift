
import WebKit
import SwiftUI

struct WebView : UIViewRepresentable {
 
    var pageId: Int
    
    var url: String {
        return String(format: "https://ja.wikipedia.org/w/index.php?curid=%d", self.pageId)
    }
    
    func makeUIView(context: Context) -> WKWebView  {
        return WKWebView(frame: .zero)
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        let req = URLRequest(url: URL(string: self.url)!)
        uiView.load(req)
    }
}
