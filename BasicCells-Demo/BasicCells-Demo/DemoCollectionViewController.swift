/*
 
 Copyright (c) 2015 Yichi Zhang
 https://github.com/yichizhang
 zhang-yi-chi@hotmail.com
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 
 */

/*

Author of the photos used in this demo project: fscholz
Link: https://www.flickr.com/photos/fscholz/
Licence: Creative Commons Attribution 4.0 International (CC BY 4.0)

*/

import UIKit

enum DemoCollectionViewControllerCellId : String {
	case BasicImageCellNoAutoLayoutId = "BasicImageCellNoAutoLayoutId"
	case BasicImageCellId = "BasicImageCellId"
}

enum DemoCollectionViewControllerSection : Int {
	case BasicImageCell = 0
	case NumberOfSections
}

class DemoCollectionViewController: UIViewController {

	var collectionView:UICollectionView!
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .Vertical
		layout.itemSize = CGSizeMake(view.bounds.width * 0.45, view.bounds.width * 0.45)
		
		collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)

/*
		collectionView.delegate = self
		collectionView.dataSource = self
        // Register cell classes
        collectionView.registerClass(
			YZBasicImageCollectionCell.self,
			forCellWithReuseIdentifier:DemoCollectionViewControllerCellId.BasicImageCellId.rawValue
		)
		
*/
		
		collectionView.backgroundColor = UIColor.whiteColor()
//		collectionView.registerClass(
//			YZBasicImageCollectionCell.self,
//			forCellWithReuseIdentifier:DemoCollectionViewControllerCellId.BasicImageCellId.rawValue
//		)
		
		collectionView.yz_blockCollectionViewDelegate = YZBlockCollectionViewDelegate()
		collectionView.delegate = collectionView.yz_blockCollectionViewDelegate
		collectionView.dataSource = collectionView.yz_blockCollectionViewDelegate
		
		collectionView.yz_blockCollectionViewDelegate.setUp(collectionView, registerClassesBlock: { (collectionView) -> Void in
			
			collectionView.registerClass(
				YZBasicImageCollectionCell.self,
				forCellWithReuseIdentifier:DemoCollectionViewControllerCellId.BasicImageCellId.rawValue
			)
		}, numberOfSectionsBlock: { (collectionView) -> Int in
			
			return DemoCollectionViewControllerSection.NumberOfSections.rawValue
		}, numberOfItemsInSectionBlock: { (collectionView, section) -> Int in
			
			return 6
		}, cellForItemAtIndexPathBlock: { (collectionView, indexPath) -> UICollectionViewCell in
			
			switch indexPath.section {
				
			case DemoCollectionViewControllerSection.BasicImageCell.rawValue:
				fallthrough
				
			default:
				let cell = collectionView.dequeueReusableCellWithReuseIdentifier(
					DemoCollectionViewControllerCellId.BasicImageCellId.rawValue,
					forIndexPath: indexPath
					) as YZBasicImageCollectionCell
				
				cell.imageView.image = UIImage(named: "demo-\(indexPath.row+1).jpg")
				
				return cell
				
			}
			}, sizeForItemAtIndexPathBlock: { (collectionView:UICollectionView, collectionViewLayout:UICollectionViewLayout, indexPath:NSIndexPath) -> CGSize in
				
				return CGSizeMake(self.view.bounds.width * 0.45, self.view.bounds.width * 0.45)
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
