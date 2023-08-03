//
//  GetDetailPresenter.swift
//  
//
//  Created by Muhamad Fardan Wardhana on 03/08/23.
//

import SwiftUI
import Combine

public class GetDetailPresenter<Request, Response, Interactor: UseCase>: ObservableObject where Interactor.Request == Request, Interactor.Response == Response {
  private var cancellables: Set<AnyCancellable> = []
  
  private let _useCase: Interactor
  
  @Published public var item: Response?
  @Published public var errorMessage: String = ""
  @Published public var isLoading: Bool = false
  @Published public var isError: Bool = false
  
  public init(useCase: Interactor) {
    _useCase = useCase
  }
  
  public func getDetail(request: Request?) {
    isLoading = true
    _useCase.execute(request: request)
      .receive(on: RunLoop.main)
      .sink(receiveCompletion: { completion in
        switch completion {
        case .failure(let error):
          self.errorMessage = error.localizedDescription
          self.isError = true
          self.isLoading = false
        case .finished:
          self.isLoading = false
        }
      }, receiveValue: { item in
        self.item = item
      })
      .store(in: &cancellables)
  }
}
