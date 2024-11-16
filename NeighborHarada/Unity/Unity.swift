//
//  Unity.swift
//  NeighborHarada
//
//  Created by Taishin Miyamoto on 2024/11/16.
//

import UnityFramework

class Unity: NSObject, UnityFrameworkListener, NativeCallsProtocol {
    static let shared = Unity()
    private let unityFramework: UnityFramework

    override init() {
        let bundlePath = Bundle.main.bundlePath
        let frameworkPath = bundlePath + "/Frameworks/UnityFramework.framework"
        let bundle = Bundle(path: frameworkPath)!
        if !bundle.isLoaded {
            bundle.load()
        }
        let frameworkClass = bundle.principalClass as! UnityFramework.Type
        let framework = frameworkClass.getInstance()!
        if framework.appController() == nil {
            let machineHeader = UnsafeMutablePointer<MachHeader>.allocate(capacity: 1)
            // 変更前
            // machineHeader.pointee = _mh_execute_header
            // 変更後
            machineHeader.pointee = _mh_dylib_header
            framework.setExecuteHeader(machineHeader)
        }
        unityFramework = framework
        super.init()
    }

    func start() {
        unityFramework.register(self)
        FrameworkLibAPI.registerAPIforNativeCalls(self)
        unityFramework.setDataBundleId("com.unity3d.framework")
        unityFramework.runEmbedded(
            withArgc: CommandLine.argc,
            argv: CommandLine.unsafeArgv,
            appLaunchOpts: nil
        )
    }

    var view: UIView {
        unityFramework.appController()!.rootView!
    }

    func showHostMainWindow(_ color: String!) {
    }
}
