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
    
    @EnvironmentObject var viewModel: MonitorActiveBuildsViewModel
    @EnvironmentObject var router: Router

    // MARK: - Body
    
    var body: some View {
        BaseView(viewModel: viewModel, content: { activeBuilds in
            List {
                if activeBuilds.count > 0 {
                    ForEach(activeBuilds, id: \.self) { item in
                        BuildStatusCell(buildStatus: item)
                    }
                } else {
                    Text("No active builds found")
                }
            }
            .listStyle(DefaultListStyle())
        })
    }}

#if DEBUG
struct MonitorActiveBuildsView_Previews: PreviewProvider {
    static var previews: some View {
        Previewer {
            MonitorActiveBuildsView().environmentObject(MonitorActiveBuildsViewModel.loading)
            MonitorActiveBuildsView().environmentObject(MonitorActiveBuildsViewModel.networkError)
            MonitorActiveBuildsView().environmentObject(MonitorActiveBuildsViewModel.someBuilds)
        }
    }
}
#endif
