//
//  RoomView.swift
//  Room
//
//  Created by Truong, Thao | LTPD on 2021/10/27.
//

import UIKit
import ReSwift
import Contract

public class RoomView: UIView {
    public var increaseCounterCallback: (() -> Void)?

    lazy var numPeopleLabel: UILabel = {
        let label = UILabel()
        label.text = "Num peope: 0"
        label.sizeToFit()
        return label
    }()
    
    lazy var openningStatusLabel: UILabel = {
        let label = UILabel()
        label.text = "Room is openning"
        label.sizeToFit()
        return label
    }()

    lazy var increaseCounterButton: UIButton = {
        let button = UIButton()
        button.setTitle("Add 1 person", for: .normal)
        button.addTarget(self, action: #selector(tapIncreaseCounterButton), for: .touchUpInside)
        button.setTitleColor(.red, for: .normal)
        button.sizeToFit()
        return button
    }()
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }

    private func setupView() {
        backgroundColor = .white
        addSubview(numPeopleLabel)
        addSubview(openningStatusLabel)
        addSubview(increaseCounterButton)
        setupLayout()

        roomStore?.subscribe(self) {
            $0.select { (room: $0.roomState, counter: $0.counterState) }
        }
    }
    
    private func setupLayout() {
        numPeopleLabel.translatesAutoresizingMaskIntoConstraints = false
        openningStatusLabel.translatesAutoresizingMaskIntoConstraints = false
        increaseCounterButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            numPeopleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            numPeopleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            openningStatusLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            openningStatusLabel.topAnchor.constraint(equalTo: numPeopleLabel.bottomAnchor, constant: 10),
            increaseCounterButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            increaseCounterButton.topAnchor.constraint(equalTo: openningStatusLabel.bottomAnchor, constant: 10)
        ])
    }

    @objc func tapIncreaseCounterButton(sender:UIButton)
    {
        increaseCounterCallback?()
    }
    
    deinit {
        roomStore?.unsubscribe(self)
    }
}

extension RoomView: StoreSubscriber
{
    public func newState(state: (room: RoomState, counter: CounterState)) {
        openningStatusLabel.text = "Room is \(state.room.isOpenning ? "openning" : "closed")"
        numPeopleLabel.text = "Num peope: \(state.counter.counter)"
    }
}
