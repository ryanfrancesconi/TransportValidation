//
//  AudioUnitViewController.swift
//  TransportValidationExtension
//
//  Created by Ryan Francesconi on 6/8/26.
//

import CoreAudioKit
import SPFKAudioWorkspace

@available(macOS 14, *)
@MainActor
public class AudioUnitViewController: AUViewController, AUAudioUnitFactory {
    private var pendingAU: TransportValidationAU?
    private var inspectorVC: TransportValidationViewController?

    public override func viewDidLoad() {
        super.viewDidLoad()
        preferredContentSize = TransportValidationViewController.contentSize
        if let au = pendingAU {
            attach(au)
            pendingAU = nil
        }
    }

    nonisolated public func createAudioUnit(with componentDescription: AudioComponentDescription) throws -> AUAudioUnit {
        let au = try TransportValidationAU(componentDescription: componentDescription)
        Task { @MainActor in
            if self.isViewLoaded {
                self.attach(au)
            } else {
                self.pendingAU = au
            }
        }
        return au
    }

    private func attach(_ au: TransportValidationAU) {
        let vc = TransportValidationViewController(validationAU: au)
        addChild(vc)
        vc.view.autoresizingMask = [.width, .height]
        vc.view.frame = view.bounds
        view.addSubview(vc.view)
        inspectorVC = vc
    }
}
