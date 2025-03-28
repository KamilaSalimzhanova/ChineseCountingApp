import Foundation

class ProverViewModel: ObservableObject {
    @Published var proverbModel: ProverbModel = ProverbModel.defaultQuote()
    let urlString: String = "https://chinese-proverbs.onrender.com/api/proverbs/random"
    func getRandomQuote() {
        getQuote(urlString)
    }
    private func getQuote(_ urlString: String) {
        guard let url = URL(string: urlString) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            let jsonDecoder = JSONDecoder()
            if error != nil { return }
            guard let data = data else { return }
            
            do {
                let newModel = try jsonDecoder.decode(ProverbModel.self, from: data)
                DispatchQueue.main.async {
                    self.proverbModel = newModel
                }
            } catch {
                print(data.description)
                print(error)
            }
        }
        task.resume()
    }
}
