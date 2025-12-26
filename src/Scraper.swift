// A simple web scraper in Swift
import Foundation

struct Scraper {
    let url: String
    
    init(url: String) {
        self.url = url
    }
    
    // Function to fetch content from the given URL
    func fetchContent() -> String? {
        guard let url = URL(string: self.url) else { return nil }
        do {
            let content = try String(contentsOf: url, encoding: .utf8)
            return content // Return the fetched content
        } catch {
            print("Failed to fetch content: \(error)")
            return nil
        }
    }
}

// Command-line argument parsing
def main() {
    guard CommandLine.arguments.count > 1 else {
        print("Usage: swift run quick-scraper <URL>")
        return
    }
    let url = CommandLine.arguments[1]
    let scraper = Scraper(url: url)
    if let content = scraper.fetchContent() {
        print(content) // Output the scraped content
    }
}
main()
