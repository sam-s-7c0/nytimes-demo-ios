//  
//  NewsListInterface.swift
//  NYTimes
//
//  Created by Samina Shaikh on 17/10/2023.

import UIKit

// MARK: - Presenter -> View

protocol NewsListViewProtocol: class {}

// MARK: - View -> Presenter

protocol NewsListPresenterProtocol: class {}

// MARK: - Presenter -> Router

protocol NewsListWireframeProtocol: class {}

// MARK: - Presenter -> Interactor

protocol NewsListInteractorProtocol: class {}
