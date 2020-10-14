//
//  RepositoryView.swift
//  Stampede-Mobile
//
//  Created by David House on 10/13/19.
//  Copyright © 2019 David House. All rights reserved.
//

import SwiftUI
import HouseKit
import Combine

struct RepositoryView: View {
    
    // MARK: - Observed objects

    @EnvironmentObject var viewModel: RepositoryViewModel
    @EnvironmentObject var router: Router

    // MARK: - View

    var body: some View {
        List {
            Section(header: Text("Active Builds")) {
                BaseSubView(state: viewModel.activeBuildsState, content: { activeBuilds in
                    if activeBuilds.count > 0 {
                        ForEach(activeBuilds, id: \.self) { item in
                            BuildStatusCell(buildStatus: item)
                        }
                    } else {
                        Text("No active builds found")
                    }
                })
            }

            Section(header: Text("Repository Builds")) {
                BaseSubView(state: viewModel.repositoryBuildsState, content: { builds in
                    if builds.count > 0 {
                        ForEach(builds, id: \.self) { item in
                            RepositoryBuildCell(repositoryBuild: item)
                        }
                    } else {
                        Text("No repository builds found")
                    }
                })
            }

            Section(header: Text("Branches")) {
                BaseSubView(state: viewModel.branchKeysState, content: { keys in
                    if keys.count > 0 {
                        ForEach(keys, id: \.self) { item in
                            BuildKeyCell(buildKey: item)
                        }
                    } else {
                        Text("No branch builds found")
                    }
                })
            }

            Section(header: Text("Releases")) {
                BaseSubView(state: viewModel.releaseKeysState, content: { keys in
                    if keys.count > 0 {
                        ForEach(keys, id: \.self) { item in
                            BuildKeyCell(buildKey: item)
                        }
                    } else {
                        Text("No release builds found")
                    }
                })
            }

            Section(header: Text("Pull Requests")) {
                BaseSubView(state: viewModel.pullRequestKeysState, content: { keys in
                    if keys.count > 0 {
                        ForEach(keys, id: \.self) { item in
                            BuildKeyCell(buildKey: item)
                        }
                    } else {
                        Text("No pull request builds found")
                    }
                })
            }
        }
        .listStyle(DefaultListStyle())
    }
}

#if DEBUG
struct RepositoryView_Previews: PreviewProvider {
    static var previews: some View {
        Previewer {
            RepositoryView().environmentObject(RepositoryViewModel.someViewModel)
        }
    }
}
#endif
