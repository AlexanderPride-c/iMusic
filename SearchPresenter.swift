//
//  SearchPresenter.swift
//  iMusic
//
//  Created by Александр Прайд on 22.08.2020.
//  Copyright (c) 2020 Alexander Pride. All rights reserved.
//

import UIKit

protocol SearchPresentationLogic {
  func presentData(response: Search.Model.Response.ResponseType)
}

class SearchPresenter: SearchPresentationLogic {
  weak var viewController: SearchDisplayLogic?
  
  func presentData(response: Search.Model.Response.ResponseType) {
  
  }
  
}
