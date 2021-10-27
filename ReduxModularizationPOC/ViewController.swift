//
//  ViewController.swift
//  ReduxModularizationPOC
//
//  Created by Truong, Thao | LTPD on 2021/10/27.
//

import UIKit
import ReSwift
import Counter
import Room

class ViewController: UIViewController {

    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var roomView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let embeddedRoomView = RoomView<Store<AppState>>(frame: roomView.bounds)
        embeddedRoomView.store = mainStore
        roomView.addSubview(embeddedRoomView)
    }

    override func viewWillAppear(_ animated: Bool) {
        mainStore.subscribe(self)
    }

    override func viewWillDisappear(_ animated: Bool) {
        mainStore.unsubscribe(self)
    }
    
    @IBAction func tapDownButton(_ sender: Any) {
        mainStore.dispatch(CounterActionDecrease())
    }
    
    @IBAction func tapUpButton(_ sender: Any) {
        mainStore.dispatch(CounterActionIncrease())
    }
    
    @IBAction func tapCloseButton(_ sender: Any) {
        mainStore.dispatch(RoomActionClose())
    }
    
    
    @IBAction func tapOpenButton(_ sender: Any) {
        mainStore.dispatch(RoomActionOpen())
    }
}

extension ViewController: StoreSubscriber {
    func newState(state: AppState) {
        countLabel.text = "\(state.counterState.counter)"
    }
}
