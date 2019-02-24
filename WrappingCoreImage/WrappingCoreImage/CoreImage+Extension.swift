//
//  CoreImage+Extension.swift
//  WrappingCoreImage
//
//  Created by 李浩 on 2019/2/24.
//  Copyright © 2019 李浩. All rights reserved.
//

import Foundation


import CoreImage


typealias Filter = (CGImage) -> CIImage

func blur(radius: Double) -> Filter {
    return { image in
        let params = [kCIInputImageKey: image,
                      kCIInputRadiusKey: radius] as [String : Any]
        guard let filter = CIFilter(name: "CIGuassianBlur", parameters: params) else {
            fatalError("create filter error")
        }
        guard let outputImage = filter.outputImage else {
            fatalError()
        }
        return outputImage
    }
}
