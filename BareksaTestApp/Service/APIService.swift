//
//  APIService.swift
//  BareksaTestApp
//
//  Created by Jeri Purnama Maulid on 01/01/24.
//

import Alamofire
import Foundation

typealias CompletionHandler<T: Decodable> = (Result<T, Error>) -> ()

class APIService: NSObject {
    func getChartData(completion: @escaping CompletionHandler<CompareChartModel>) {
        request(url: SC.chartURL, completion: completion)
    }

    func getProductData(completion: @escaping CompletionHandler<CompareProductModel>) {
        request(url: SC.productURL, completion: completion)
    }

    private func request<T: Decodable>(url: String, completion: @escaping CompletionHandler<T>) {
        AF.request(url).responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let jsonDecoder = JSONDecoder()
                    let decodedData = try jsonDecoder.decode(T.self, from: data)
                    completion(.success(decodedData))
                } catch {
                    print("Error decoding JSON: \(error)")
                    completion(.failure(error))
                }
            case .failure(let error):
                print("Error fetching data: \(error.localizedDescription)")
                completion(.failure(error))
            }
        }
    }
}
