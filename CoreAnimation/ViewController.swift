//
//  ViewController.swift
//  CoreAnimation
//
//  Created by Kevin Maulana on 15/11/2021.
//

import UIKit
import ViewAnimator
 
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    private let myTable = UITableView()
    
    let data = ["Animation 1",
                "Animation 2",
                "Animation 3",
                "Animation 4",
                "Animation 5",
                "Animation 6",
                "Animation 7",
                "Animation 8",
                "Animation 9"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(myTable)
        myTable.frame = view.bounds
        myTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        myTable.delegate = self
        myTable.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let animation = AnimationType.from(direction: .top, offset: 300)
        UIView.animate(views: myTable.visibleCells, animations: [animation], duration: 1)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        cell.backgroundColor = .link
        
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = .systemBlue
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 0 {
            let FirstViewController = FirstViewController()
//            FirstViewController.modalPresentationStyle = .fullScreen
            present(FirstViewController, animated: true)
        } else if indexPath.row == 1 {
            let SecondViewController = SecondViewController()
//            SecondViewController.modalPresentationStyle = .fullScreen
            present(SecondViewController, animated: true)
        } else if indexPath.row == 2 {
            
            let ThirdViewController = ThirdViewController()
//            ThirdViewController.modalPresentationStyle = .fullScreen
            present(ThirdViewController, animated: true)
        } else {
            let RandomViewController = RandomViewController()
//            RandomViewController.modalPresentationStyle = .fullScreen
            present(RandomViewController, animated: true)
        }
    }

}


class FirstViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let myView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        myView.center = view.center
        view.addSubview(myView)
        myView.backgroundColor = .black
        
        myView.animate(animations: [AnimationType.rotate(angle: .pi/5)], delay: 1, duration: 1)
    }
}


class SecondViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let myView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        myView.center = view.center
        view.addSubview(myView)
        myView.backgroundColor = .systemRed
        
        myView.animate(animations: [AnimationType.zoom(scale: 4)], delay: 1, duration: 1)
    }
}


class ThirdViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let myView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        myView.center = view.center
        view.addSubview(myView)
        myView.backgroundColor = .systemRed
        
        
        let animations: [Animation] = [
            AnimationType.from(direction: .bottom, offset: 300),
            AnimationType.rotate(angle: .pi/4),
            AnimationType.zoom(scale: 3)
        ]
        myView.animate(animations: [AnimationType.zoom(scale: 4)], delay: 1, duration: 1)
    }
}

class RandomViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let myView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        myView.center = view.center
        view.addSubview(myView)
        myView.backgroundColor = .systemMint
        
        myView.animate(animations: [AnimationType.random()], delay: 1, duration: 1)
    }
}

