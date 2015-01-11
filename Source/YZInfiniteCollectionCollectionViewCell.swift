/*

Copyright (c) 2015 Yichi Zhang
https://github.com/yichizhang
zhang-yi-chi@hotmail.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/

import UIKit

class YZInfiniteCollectionCollectionViewCell: YZCollectionCollectionViewCell {
	
	var numberOfItems:Int!
	var fakeNumberOfItems = 10000
	var cellForItemAtIndexPathAndIndex:((UICollectionView, NSIndexPath, Int) -> UICollectionViewCell)!
	var sizeForItemAtIndexPathAndIndex:((UICollectionView, NSIndexPath, Int) -> CGSize)?
	var didSelectItemAtIndexPathAndIndex:((NSIndexPath, Int) -> Void)?
	
	func realIndexForIndexPath(indexPath:NSIndexPath) -> Int{
		let index = indexPath.item % numberOfItems
		return index
	}
	
	func setUpWithNumberOfItems(num:Int, cellForItemAtIndexPathAndIndex cellBlock:((UICollectionView, NSIndexPath, Int) -> UICollectionViewCell), sizeForItemAtIndexPathAndIndex sizeBlock:((UICollectionView, NSIndexPath, Int) -> CGSize)){
		
		self.numberOfItems = num
		self.cellForItemAtIndexPathAndIndex = cellBlock
		self.sizeForItemAtIndexPathAndIndex = sizeBlock
		
		self.numberOfSections = { (Void) -> Int in
			return 1
		}
		self.numberOfItemsInSection = { (section:Int) -> Int in
			return self.fakeNumberOfItems
		}
		self.sizeForItemAtIndexPath = { (collectionView:UICollectionView, indexPath:NSIndexPath) -> CGSize in
			let index = self.realIndexForIndexPath(indexPath)
			return self.sizeForItemAtIndexPathAndIndex!(collectionView, indexPath, index)
		}
		self.cellForItemAtIndexPath = { (collectionView:UICollectionView, indexPath:NSIndexPath) -> UICollectionViewCell in
			let index = self.realIndexForIndexPath(indexPath)
			return self.cellForItemAtIndexPathAndIndex(collectionView, indexPath, index)
		}
		self.didSelectItemAtIndexPath = { (indexPath:NSIndexPath) -> Void in
			if self.didSelectItemAtIndexPathAndIndex != nil{
				let index = self.realIndexForIndexPath(indexPath)
				return self.didSelectItemAtIndexPathAndIndex!(indexPath, index)
			}
		}
		
		self.reloadData()
		self.cellCollectionView().alpha = 0.0
		
		var dispatchTime: dispatch_time_t = dispatch_time(DISPATCH_TIME_NOW, Int64(0.01 * Double(NSEC_PER_SEC)))
		dispatch_after(dispatchTime, dispatch_get_main_queue(), {
			let indexPath = NSIndexPath(forRow: self.fakeNumberOfItems/2, inSection: 0)
			self.cellCollectionView().scrollToItemAtIndexPath(indexPath, atScrollPosition: UICollectionViewScrollPosition.Left, animated: false)
			self.cellCollectionView().alpha = 1.0
		})
	}
	
}
