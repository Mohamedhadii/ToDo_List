//
//  ViewController.swift
//  tableViewStudy
//
//  Created by Hady on 11/4/19.
//  Copyright © 2019 gadou. All rights reserved.
//

import UIKit

class Media {
    var image: UIImage
    var title: String
    var isfinished : Bool
    init(image: UIImage, title: String , isfinished: Bool) {
        self.image = image
        self.title = title
        self.isfinished = isfinished
    }
}


class ViewController: UIViewController,UITableViewDelegate , UITableViewDataSource {
    
    var media: [Media] = []
    var Done: [Media] = []  // segment control
    var isDone = false

    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     media = createMedia()
        
    }
    
    func createMedia() -> [Media] {
        var tempmedia = [Media]()
        let media1 = Media(image: UIImage(named: "fb")!, title: "facebook", isfinished: false)
        let media2 = Media(image: UIImage(named: "whatsapp")!, title: "whatsApp", isfinished: false)
        let media3 = Media(image: UIImage(named: "skybe")!, title: "fskybe", isfinished: false)
        let media4 = Media(image: UIImage(named: "instgram")!, title: "instgram", isfinished: false)
        let media5 = Media(image: UIImage(named: "massenger")!, title: "massenger", isfinished: false)
        tempmedia.append(media1)
        tempmedia.append(media2)
        tempmedia.append(media3)
        tempmedia.append(media4)
        tempmedia.append(media5)
        return tempmedia
    }
    
    
    
    
    @IBAction func segmentControl(_ sender: Any) {
        isDone = isDone ? false : true
        myTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isDone {
        return Done.count
        }
        return media.count
            
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if isDone{
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! dataCell
        let mediaa = Done[indexPath.row]
            cell.accessoryType = mediaa.isfinished ? .checkmark : .none
        cell.setMedia(App: mediaa)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! dataCell
            let mediaa = media[indexPath.row]
            cell.accessoryType = mediaa.isfinished ? .checkmark : .none
            cell.setMedia(App: mediaa)
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        if isDone {
             Done[indexPath.row].isfinished = false
            cell?.accessoryType = .none
            media.append(Done[indexPath.row])
            Done.remove(at: indexPath.row)
            tableView.reloadData()
        }else {
            media[indexPath.row].isfinished = true
            cell?.accessoryType = .checkmark
            Done.append(media[indexPath.row])
            media.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
}

