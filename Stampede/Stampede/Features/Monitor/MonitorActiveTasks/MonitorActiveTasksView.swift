//
//  MonitorActiveTasksView.swift
//  Stampede-Mobile
//
//  Created by David House on 12/6/19.
//  Copyright © 2019 David House. All rights reserved.
//

import SwiftUI

struct MonitorActiveTasksView: View {

    // MARK: - View Model
    
    @EnvironmentObject var viewModel: MonitorActiveTasksViewModel
    @EnvironmentObject var router: Router

    // MARK: - Body
    
    var body: some View {
        BaseView(viewModel: viewModel, content: { tasks in
            List {
                if tasks.count > 0 {
                    ForEach(tasks, id: \.self) { item in
                        Button(action: {
                            router.route(to: .taskDetails(item.task_id))
                        }, label: {
                            TaskStatusCell(taskStatus: item)
                        })
                    }
                } else {
                    Text("No active tasks found")
                }
            }
            .listStyle(DefaultListStyle())
        })
    }
}

#if DEBUG
struct MonitorActiveTasksView_Previews: PreviewProvider {
    static var previews: some View {
        Previewer {
            MonitorActiveTasksView().environmentObject(MonitorActiveTasksViewModel.loading)
            MonitorActiveTasksView().environmentObject(MonitorActiveTasksViewModel.networkError)
            MonitorActiveTasksView().environmentObject(MonitorActiveTasksViewModel.someTasks)
        }
    }
}
#endif
