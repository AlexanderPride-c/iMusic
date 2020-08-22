//
//  SearchInteractor.swift
//  iMusic
//
//  Created by Александр Прайд on 22.08.2020.
//  Copyright (c) 2020 Alexander Pride. All rights reserved.
//

import UIKit

protocol SearchBusinessLogic {
  func makeRequest(request: Search.Model.Request.RequestType)
}

class SearchInteractor: SearchBusinessLogic {

  var presenter: SearchPresentationLogic?
  var service: SearchService?
  
  func makeRequest(request: Search.Model.Request.RequestType) {
    if service == nil {
      service = SearchService()
    }
  }
  
}
