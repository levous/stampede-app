//
//  RepositoryFeature.swift
//  Stampede-Mobile
//
//  Created by David House on 12/2/19.
//  Copyright © 2019 David House. All rights reserved.
//
import UIKit
import SwiftUI

class RepositoryFeature: BaseFeature<Dependencies> {

    let repository: Repository

    // MARK: - Environment

    @EnvironmentObject var service: StampedeService

    // MARK: Properties

    let viewModel: RepositoryViewModel

    // MARK: - Overrides
    
    override func makeChildViewController() -> UIViewController {
        return UIHostingController(rootView:
                                    RepositoryView(viewModel: viewModel)
                                    .dependenciesToEnvironment(dependencies))
    }
    
    // MARK: Initializer

//    init(repository: Repository, viewModel: RepositoryViewModel? = nil) {
//        self.viewModel = viewModel ?? RepositoryViewModel()
//        self.repository = repository
//    }

//    // MARK: - View
//
//    var body: some View {
//        RepositoryView(viewModel: viewModel,
//                       activeBuildsPublisher: service.fetchActiveBuildsPublisher(owner: repository.owner, repository: repository.repository),
//                       repositoryBuildsPublisher: service.fetchRepositoryBuildsPublisher(owner: repository.owner, repository: repository.repository),
//                       branchKeysPublisher: service.fetchBuildKeysPublisher(owner: repository.owner, repository: repository.repository, source: "branch-push"),
//                       releaseKeysPublisher: service.fetchBuildKeysPublisher(owner: repository.owner, repository: repository.repository, source: "release"),
//                       pullRequestKeysPublisher: service.fetchBuildKeysPublisher(owner: repository.owner, repository: repository.repository, source: "pull-request")
//                       )
//            .navigationBarTitle(repository.repository)
//    }
}

#if DEBUG
struct RepositoryFeature_Previews: PreviewProvider {
    static var previews: some View {
        DevicePreviewer {
            NavigationView {
                RepositoryFeature(repository: Repository.someRepository)
            }
        }
    }
}
#endif
