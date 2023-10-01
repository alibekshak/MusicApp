import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let urlString: String
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            uiView.load(request)
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, WKNavigationDelegate {
        var parent: WebView
        
        init(_ parent: WebView) {
            self.parent = parent
        }
        
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            // Добавьте обработчики событий, если необходимо
        }
        
        func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
            // Обработка ошибок, если необходимо
        }
    }
}

struct WebViewDemoView: View {
    var body: some View {
        NavigationView {
            WebView(urlString: "https://www.example.com")
                .navigationBarTitle("Web Page")
        }
    }
}

struct WebViewDemoView_Previews: PreviewProvider {
    static var previews: some View {
        WebViewDemoView()
    }
}
