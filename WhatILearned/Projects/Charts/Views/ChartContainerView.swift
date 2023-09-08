//
//  ChartContainerView.swift
//  WhatILearned
//
//  Created by Ghadirian, Hamed, HSE DE on 08.09.23.
//

import Charts
import Combine
import SwiftUI

struct ChartContainerView: View {

    @ObservedObject var viewModel: ChartsViewModel

    var body: some View {
        getBarChart()
    }

    private func getBarChart() -> some View {
        horizontalBarChart
    }

    private var horizontalBarChart: some View {
        Chart(viewModel.data) {
            BarMark(
                x: .value("Profit", $0.profit),
                y: .value("Department", $0.department)
            )
        }
    }
}
