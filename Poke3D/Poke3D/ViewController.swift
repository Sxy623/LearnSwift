//
//  ViewController.swift
//  Poke3D
//
//  Created by 沈心逸 on 2020/3/14.
//  Copyright © 2020 Xinyi Shen. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sceneView.delegate = self

        sceneView.showsStatistics = true
        
        sceneView.autoenablesDefaultLighting = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let configuration = ARImageTrackingConfiguration()
        
        if let imageToTrack = ARReferenceImage.referenceImages(inGroupNamed: "Pokemon Cards", bundle: Bundle.main) {
            
            configuration.trackingImages = imageToTrack
            
            configuration.maximumNumberOfTrackedImages = 1
        }

        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        sceneView.session.pause()
    }
    
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        
        let node = SCNNode()
        
        if let imageAnchor = anchor as? ARImageAnchor {
            
            let plane = SCNPlane(width: imageAnchor.referenceImage.physicalSize.width, height: imageAnchor.referenceImage.physicalSize.height)
            
            plane.firstMaterial?.diffuse.contents = UIColor(white: 1.0, alpha: 0.5)
            
            let planeNode = SCNNode(geometry: plane)
            
            planeNode.eulerAngles.x = -.pi / 2
            
            node.addChildNode(planeNode)
            
            if imageAnchor.referenceImage.name == "Eevee" {
                
                if let pokeScene = SCNScene(named: "art.scnassets/eevee.scn"), let pokeNode = pokeScene.rootNode.childNodes.first {
                    
                    pokeNode.eulerAngles.x = .pi / 2
                    
                    planeNode.addChildNode(pokeNode)
                }
            }
            
            if imageAnchor.referenceImage.name == "Oddish" {
                
                if let pokeScene = SCNScene(named: "art.scnassets/oddish.scn"), let pokeNode = pokeScene.rootNode.childNodes.first {
                    
                    pokeNode.eulerAngles.x = .pi / 2
                    
                    planeNode.addChildNode(pokeNode)
                }
            }
            
            if imageAnchor.referenceImage.name == "Pikachu" {
                
                if let pokeScene = SCNScene(named: "art.scnassets/pikachu.scn"), let pokeNode = pokeScene.rootNode.childNodes.first {
                    
                    pokeNode.eulerAngles.x = .pi / 2
                    
                    planeNode.addChildNode(pokeNode)
                }
            }
            
            if imageAnchor.referenceImage.name == "Bulbasaur" {
                
                if let pokeScene = SCNScene(named: "art.scnassets/bulbasaur.scn"), let pokeNode = pokeScene.rootNode.childNodes.first {
                    
                    pokeNode.eulerAngles.x = .pi / 2
                    
                    planeNode.addChildNode(pokeNode)
                }
            }
            
            if imageAnchor.referenceImage.name == "Charizard" {
                
                if let pokeScene = SCNScene(named: "art.scnassets/charizard.scn"), let pokeNode = pokeScene.rootNode.childNodes.first {
                    
                    pokeNode.eulerAngles.x = .pi / 2
                    
                    planeNode.addChildNode(pokeNode)
                }
            }
        }
        
        return node
    }
    
}
