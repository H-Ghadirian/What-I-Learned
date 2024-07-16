////
////  TagLayout.swift
////  WhatILearned
////
////  Created by Ghadirian, Hamed, HSE DE on 15.07.24.
////
//
//import SwiftUI
//
//@available(iOS 16.0, *)
//struct TagLayout: Layout {
//    var alignment: Alignment = .center
//    var spacing: CGFloat = 10
//    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
//        let maxWidth = proposal.width ?? 0
//        let height: CGFloat = 0
//        let rows = generateRows(maxWidth, proposal, subviews)
//
//        for (index, row) in rows.enumerated() {
//            
//        }
//    }
//
//    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
//        
//    }
//    func generateRows(
//        _ maxWidth: CGFloat,
//        _ proposal: ProposedViewSize,
//        _ subviews: Subviews
//    ) -> [[LayoutSubviews.Element]] {
//        var row: [LayoutSubviews.Element] = []
//        var rows: [[LayoutSubviews.Element]] = []
//
//        var origin = CGRect.zero.origin
//
//        for view in subviews {
//            let viewSize = view.sizeThatFits(proposal)
//            if (origin.x + viewSize.width + spacing) > maxWidth {
//                rows.append(row)
//                row.removeAll()
//                origin.x = 0
//                row.append(view)
//                origin.x += viewSize.width + spacing
//            } else {
//                row.append(view)
//                origin.x += viewSize.width + spacing
//            }
//        }
//
//        if !row.isEmpty {
//            rows.append(row)
//            row.removeAll()
//        }
//
//        return rows
//    }
//}
//
//@available(iOS 16.0, *)
//extension [LayoutSubviews.Element] {
//    func <#name#>(<#parameters#>) -> <#return type#> {
//        <#function body#>
//    }
//}
//@available(iOS 16.0, *)
//#Preview {
//    AnimatedTagsView()
//}
