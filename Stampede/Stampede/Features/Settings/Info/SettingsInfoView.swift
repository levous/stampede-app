//
//  SettingsInfoView.swift
//  Stampede
//
//  Created by David House on 7/11/20.
//  Copyright © 2020 David House. All rights reserved.
//

import SwiftUI

struct SettingsInfoView: View {

    // MARK: - Environment Objects

    @EnvironmentObject var theme: CurrentTheme

    // MARK: - Observed Objects

    @ObservedObject var viewModel: SettingsInfoViewModel

    var body: some View {
        List {
            Section(header: Text("About Stampede")) {
                Text("Version: \(viewModel.appVersion)")
                Text("Build: \(viewModel.appBuildNumber)")
                Button("https://stampedeci.com", action: {
                    UIApplication.shared.open(URL(string: "https://stampedeci.com")!, options: [:]) { _ in

                    }
                })
            }
        }
    }
}

struct SettingsInfoView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsInfoView(viewModel: SettingsInfoViewModel())
    }
}
