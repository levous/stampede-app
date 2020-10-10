//
//  SettingsRepositoriesView.swift
//  Stampede
//
//  Created by David House on 7/11/20.
//  Copyright © 2020 David House. All rights reserved.
//

import SwiftUI
import HouseKit
import Combine

protocol SettingsRepositoriesViewDelegate: class {
    func didDeleteRepositories(_ indexSet: IndexSet)
}

struct SettingsRepositoriesView: View {

    weak var delegate: SettingsRepositoriesViewDelegate?

    @ObservedObject var viewModel: SettingsRepositoriesViewModel

    init(viewModel: SettingsRepositoriesViewModel, publisher: AnyPublisher<[Repository], ServiceError>? = nil, delegate: SettingsRepositoriesViewDelegate? = nil) {
        self.viewModel = viewModel
        self.delegate = delegate
    }
    
    var body: some View {
        switch viewModel.state {
        case .loading:
            Text("Loading...")
        case .networkError:
            Text("A network error has occurred")
        case .results(let repositories):
            List {
                if repositories.count > 0 {
                    ForEach(repositories, id: \.self) { item in
                        RepositoryCell(repository: item)
                    }.onDelete(perform: { indexSet in
                        self.delegate?.didDeleteRepositories(indexSet)
                    })
                } else {
                    Text("No repositories selected")
                }
            }
            .listStyle(DefaultListStyle())
        }
    }
}

#if DEBUG
struct SettingsRepositoriesView_Previews: PreviewProvider {
    static var previews: some View {
        Previewer {
            SettingsRepositoriesView(viewModel: SettingsRepositoriesViewModel(state: .loading))
            SettingsRepositoriesView(viewModel: SettingsRepositoriesViewModel(state: .results(Repository.someRepositories)))
//            SettingsRepositoriesView(viewModel: SettingsRepositoriesViewModel(state: .loading))
//            SettingsRepositoriesView(viewModel: SettingsRepositoriesViewModel(state: .networkError))
//            SettingsRepositoriesView(viewModel: SettingsRepositoriesViewModel(state: .results(Repository.someRepositories)))
        }
    }
}
#endif
