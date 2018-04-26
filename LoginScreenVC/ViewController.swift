//
//  ViewController.swift
//  LoginScreenVC
//
//  Created by Verma Mukesh on 22/04/18.
//  Copyright © 2018 Verma Mukesh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UIScrollViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var imgCut: UIImageView!
    
    var arrIntro = [NSDictionary]()
    
    fileprivate var headerMaskLayer: CAShapeLayer?
    
    
    @IBOutlet weak var introCollectionVIew: UICollectionView!
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //
        
        let dicc = arrIntro[indexPath.row] as NSDictionary
        
        
        let cell:IntroCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier:"IntroCollectionCell", for: indexPath as IndexPath) as! IntroCollectionCell
        let aStr = String(format: "%@%d", "icon", indexPath.row + 1)

        cell.imgIcon.image = UIImage.init(named: aStr)
        cell.lblDesc.text = dicc["desc"] as! NSString as String
        cell.lblTitle.text = dicc["title"] as! NSString as String
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
       
        let wid = collectionView.frame.size.width
        print(wid);
        
        return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        pageControl.currentPage = Int(pageNumber)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // prints 1-10  ""  ""
        
         let dicc = NSDictionary.init(objects: ["Make an offer", "Make an offer to hotel owner for the price that suits you"], forKeys: [ "title" as NSCopying, "desc" as NSCopying])
        
        arrIntro.append(dicc)
        
    
        let dicc2 = NSDictionary.init(objects: ["Rent a car", "Rent a car for your outdoor activites with afforable price"], forKeys: [ "title" as NSCopying, "desc" as NSCopying])
        
        arrIntro.append(dicc2)
        
        let dicc1 = NSDictionary.init(objects: ["Free cancellation", "Cancel the booking at anytime with no additional cost"], forKeys: [ "title" as NSCopying, "desc" as NSCopying])
        
        arrIntro.append(dicc1)
        
        let dicc3 = NSDictionary.init(objects: ["Two way reviews", "Review each other once you have consume the service and let the world know about your expierence"], forKeys: [ "title" as NSCopying, "desc" as NSCopying])
        
        arrIntro.append(dicc3)
        
        headerMaskLayer = CAShapeLayer()
        headerMaskLayer?.fillColor = UIColor.orange.cgColor
        imgCut?.layer.mask = headerMaskLayer
        
        updateHeaderView()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func updateHeaderView() {
        
        let headerRect = CGRect(x: 0, y:0, width: self.view.frame.size.width, height: introCollectionVIew.frame.size.height)
        
        // cut away
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: headerRect.width, y: 0))
        path.addLine(to: CGPoint(x: headerRect.width, y: headerRect.height))
        path.addLine(to: CGPoint(x: 0, y: introCollectionVIew.frame.size.height-60))
        headerMaskLayer?.path = path.cgPath
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

