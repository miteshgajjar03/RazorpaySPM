// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RazorpayPackage",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "RazorpayPackage",
            targets: ["RazorpayPackage"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
//         Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "RazorpayPackage",
            dependencies: [
                .target(name: "Razorpay")
            ]
        ),
        .testTarget(
            name: "RazorpayPackageTests",
            dependencies: ["RazorpayPackage"]
        ),
        .binaryTarget(
            name: "Razorpay",
            path: "./Sources/Razorpay.xcframework"
        ),
//        .binaryTarget(
//            name: "RazorpayPackage",
//            url: "https://github.com/razorpay/razorpay-pod/releases/download/1.3.10/Razorpay.xcframework.zip",
//            checksum: "5c662c3db6b1c4245bca75ee7b607e0deac779b569bf86ed79d289b382dcdf2b"
//        ),
    ]
)
