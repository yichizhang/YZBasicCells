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
	case BasicImageCellNoAutoLayout = 0
	case BasicImageCell
	case NumberOfSections
}

class DemoCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.registerClass(
			YZBasicImageCollectionCell.self,
			forCellWithReuseIdentifier:DemoCollectionViewControllerCellId.BasicImageCellId.rawValue
		)
		
		self.collectionView!.registerClass(
			YZBasicImageCollectionCellNoAutoLayout.self,
			forCellWithReuseIdentifier:DemoCollectionViewControllerCellId.BasicImageCellNoAutoLayoutId.rawValue
		)
		
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        //#warning Incomplete method implementation -- Return the number of sections
        return DemoCollectionViewControllerSection.NumberOfSections.rawValue
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //#warning Incomplete method implementation -- Return the number of items in the section
        return 6
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
		
		switch indexPath.section {
		case DemoCollectionViewControllerSection.BasicImageCell.rawValue:
			
			let cell = collectionView.dequeueReusableCellWithReuseIdentifier(
				DemoCollectionViewControllerCellId.BasicImageCellId.rawValue,
				forIndexPath: indexPath
				) as YZBasicImageCollectionCell
			
			cell.imageView.image = UIImage(named: "demo-\(indexPath.row+1).jpg")
			
			return cell
			
		case DemoCollectionViewControllerSection.BasicImageCellNoAutoLayout.rawValue:
			fallthrough
			
		default:
			
			let cell = collectionView.dequeueReusableCellWithReuseIdentifier(
				DemoCollectionViewControllerCellId.BasicImageCellNoAutoLayoutId.rawValue,
				forIndexPath: indexPath
				) as YZBasicImageCollectionCellNoAutoLayout
			
			cell.imageView.image = UIImage(named: "demo-\(indexPath.row+1).jpg")
			
			return cell
		}
		
		
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */

}
