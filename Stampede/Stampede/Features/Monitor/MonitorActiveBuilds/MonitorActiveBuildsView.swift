//
//  MonitorActiveBuildsView.swift
//  Stampede-Mobile
//
//  Created by David House on 12/3/19.
//  Copyright © 2019 David House. All rights reserved.
//

import SwiftUI

struct MonitorActiveBuildsView: View {

    // MARK: - View Model
    
    @ObservedObject var viewModel: MonitorActiveBuildsViewModel

    // MARK: - Initializer
    
    init(viewModel: MonitorActiveBuildsViewModel) {
        self.viewModel = viewModel
    }

    // MARK: - Body
    
    var body: some View {
        switch viewModel.state {
        case .loading:
            List {
                ForEach(0..<10) { _ in
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Basic list loading text")
                        }
                    }
                }
            }.redacted(reason: .placeholder)
        case .networkError:
            Text("A network error has occurred")
        case .results(let activeBuilds):
            List {
                if activeBuilds.count > 0 {
                    ForEach(activeBuilds, id: \.self) { item in
                        NavigationLink(destination: BuildFeature(buildStatus: item)) {
                            BuildStatusCell(buildStatus: item)
                        }
                    }
                } else {
                    Text("No active builds found")
                }
            }
            .listStyle(DefaultListStyle())
        }
    }}

#if DEBUG
struct MonitorActiveBuildsView_Previews: PreviewProvider {
    static var previews: some View {
        Previewer {
            MonitorActiveBuildsView(viewModel: MonitorActiveBuildsViewModel.loading)
            MonitorActiveBuildsView(viewModel: MonitorActiveBuildsViewModel.networkError)
            MonitorActiveBuildsView(viewModel: MonitorActiveBuildsViewModel.someBuilds)
        }
    }
}
#endif
