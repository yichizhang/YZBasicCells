/*

Copyright (c) 2015 Yichi Zhang
https://github.com/yichizhang
zhang-yi-chi@hotmail.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/

import UIKit

class CrazyHorizontalCellViewController: UIViewController {
	
	var collectionView:UICollectionView!
	var mode:Int = 0
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Uncomment the following line to preserve selection between presentations
		// self.clearsSelectionOnViewWillAppear = false
		
		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .Vertical
		layout.itemSize = CGSizeMake(view.bounds.width * 0.45, view.bounds.width * 0.45)
		
		collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
		
		collectionView.backgroundColor = UIColor.whiteColor()
		
		collectionView.yz_blockCollectionViewDelegate = YZBlockCollectionViewDelegate()
		collectionView.yz_blockCollectionViewDelegate.setUpForCollectionView(collectionView, registerClassesBlock: { (collectionView) -> Void in
			
			collectionView.registerClass(
				YZBasicHorizontalCollectionCell.self,
				forCellWithReuseIdentifier:DemoCells.BasicHorizontalCollectionCellId.rawValue
			)
			}, numberOfSectionsBlock: { (collectionView) -> Int in
				
				return 1
			}, numberOfItemsInSectionBlock: { (collectionView, section) -> Int in
				
				return 36
			}, cellForItemAtIndexPathBlock: { (collectionView, indexPath) -> UICollectionViewCell in
                    
                let cell = collectionView.dequeueReusableCellWithReuseIdentifier(
                    DemoCells.BasicHorizontalCollectionCellId.rawValue,
                    forIndexPath: indexPath
                    ) as YZBasicHorizontalCollectionCell
                
                var imageFileNumber = (indexPath.row % 6) + 1
                
                cell.collectionView.yz_blockCollectionViewDelegate = YZBlockCollectionViewDelegate()
                cell.collectionView.yz_blockCollectionViewDelegate.setUpForCollectionView(cell.collectionView, registerClassesBlock: { (collectionView) -> Void in
                    
                    collectionView.registerClass(
                        YZBasicImageCollectionCell.self,
                        forCellWithReuseIdentifier:DemoCells.BasicImageCellId.rawValue
                    )
                    }, numberOfSectionsBlock: { (collectionView) -> Int in
                        
                        return 1
                    }, numberOfItemsInSectionBlock: { (collectionView, section) -> Int in
                        
                        return 5
                    }, cellForItemAtIndexPathBlock: { (collectionView, indexPath) -> UICollectionViewCell in
                        
                            let cell = collectionView.dequeueReusableCellWithReuseIdentifier(
                                DemoCells.BasicImageCellId.rawValue,
                                forIndexPath: indexPath
                                ) as YZBasicImageCollectionCell
                            
                            cell.imageView.image = UIImage(named: "demo-\(imageFileNumber).jpg")
                        
                            return cell
                    
                    }, sizeForItemAtIndexPathBlock: { (collectionView:UICollectionView, collectionViewLayout:UICollectionViewLayout, indexPath:NSIndexPath) -> CGSize in
                        
                        return CGSizeMake(60, 60)
                    }, didSelectItemAtIndexPathBlock: { (collectionView, indexPath) -> Void in
                        
                    }, insetForSectionAtIndexBlock: nil, minimumInteritemSpacingForSectionAtIndexBlock: { (collectionView, collectionViewLayout, section) -> CGFloat in
                        
                        return 5
                    }, minimumLineSpacingForSectionAtIndexBlock: { (collectionView:UICollectionView, collectionViewLayout, section) -> CGFloat in
                        
                        return 10
                })
                
                cell.collectionView.reloadData()
                cell.collectionView.backgroundColor = UIColor.whiteColor()//UIColor(hue: 0.1*CGFloat(imageFileNumber), saturation: 1, brightness: 1, alpha: 1)
                
                return cell
				
			}, sizeForItemAtIndexPathBlock: { (collectionView:UICollectionView, collectionViewLayout:UICollectionViewLayout, indexPath:NSIndexPath) -> CGSize in
				
				return CGSizeMake(self.view.bounds.width * 0.5 - 5, 70)
			}, didSelectItemAtIndexPathBlock: { (collectionView, indexPath) -> Void in
				
			}, insetForSectionAtIndexBlock: nil, minimumInteritemSpacingForSectionAtIndexBlock: nil, minimumLineSpacingForSectionAtIndexBlock: nil)
		
		collectionView.reloadData()
		
		view.addSubview(collectionView)
		// Do any additional setup after loading the view.
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
}
