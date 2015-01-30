/*

Copyright (c) 2015 Yichi Zhang
https://github.com/yichizhang
zhang-yi-chi@hotmail.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/

import Foundation
import ObjectiveC

protocol YZBlockCollectionViewDelegateProtocol {
	func setUp(
		collectionView:UICollectionView!,
		registerClassesBlock: ((collectionView:UICollectionView) -> Void)?,
		numberOfSectionsBlock: ((collectionView:UICollectionView) -> Int)?,
		numberOfItemsInSectionBlock: ((collectionView:UICollectionView, section:Int) -> Int)!,
		cellForItemAtIndexPathBlock: ((collectionView:UICollectionView, indexPath:NSIndexPath) -> UICollectionViewCell)!,
		sizeForItemAtIndexPathBlock: ((collectionView:UICollectionView, collectionViewLayout:UICollectionViewLayout, indexPath:NSIndexPath) -> CGSize)?,
		didSelectItemAtIndexPathBlock: ((collectionView:UICollectionView, indexPath:NSIndexPath) -> Void)?,
		insetForSectionAtIndexBlock: ((collectionView:UICollectionView, collectionViewLayout:UICollectionViewLayout, Int) -> UIEdgeInsets)?,
		minimumInteritemSpacingForSectionAtIndexBlock: ((collectionView:UICollectionView, collectionViewLayout:UICollectionViewLayout, section:Int) -> CGFloat)?,
		minimumLineSpacingForSectionAtIndexBlock: ((collectionView:UICollectionView, collectionViewLayout:UICollectionViewLayout, section:Int) -> CGFloat)?
	);
}

class YZBlockCollectionViewDelegate : NSObject, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, YZBlockCollectionViewDelegateProtocol {
	
	weak var collectionView:UICollectionView?
	
	var registerClassesBlock: ((UICollectionView) -> Void)?
	var numberOfSectionsBlock: ((UICollectionView) -> Int)?
	var numberOfItemsInSectionBlock: ((UICollectionView, Int) -> Int)!
	var cellForItemAtIndexPathBlock: ((UICollectionView, NSIndexPath) -> UICollectionViewCell)!
	var sizeForItemAtIndexPathBlock: ((UICollectionView, UICollectionViewLayout, NSIndexPath) -> CGSize)?
	var didSelectItemAtIndexPathBlock: ((UICollectionView, NSIndexPath) -> Void)?
	var insetForSectionAtIndexBlock: ((UICollectionView, UICollectionViewLayout, Int) -> UIEdgeInsets)?
	var minimumInteritemSpacingForSectionAtIndexBlock: ((UICollectionView, UICollectionViewLayout, Int) -> CGFloat)?
	var minimumLineSpacingForSectionAtIndexBlock: ((UICollectionView, UICollectionViewLayout, Int) -> CGFloat)?
	
	func setUp(
		collectionView:UICollectionView!,
		registerClassesBlock: ((collectionView:UICollectionView) -> Void)?,
		numberOfSectionsBlock: ((collectionView:UICollectionView) -> Int)?,
		numberOfItemsInSectionBlock: ((collectionView:UICollectionView, section:Int) -> Int)!,
		cellForItemAtIndexPathBlock: ((collectionView:UICollectionView, indexPath:NSIndexPath) -> UICollectionViewCell)!,
		sizeForItemAtIndexPathBlock: ((collectionView:UICollectionView, collectionViewLayout:UICollectionViewLayout, indexPath:NSIndexPath) -> CGSize)?,
		didSelectItemAtIndexPathBlock: ((collectionView:UICollectionView, indexPath:NSIndexPath) -> Void)?,
		insetForSectionAtIndexBlock: ((collectionView:UICollectionView, collectionViewLayout:UICollectionViewLayout, Int) -> UIEdgeInsets)?,
		minimumInteritemSpacingForSectionAtIndexBlock: ((collectionView:UICollectionView, collectionViewLayout:UICollectionViewLayout, section:Int) -> CGFloat)?,
		minimumLineSpacingForSectionAtIndexBlock: ((collectionView:UICollectionView, collectionViewLayout:UICollectionViewLayout, section:Int) -> CGFloat)?
		) {
	
			self.collectionView = collectionView
			self.registerClassesBlock = registerClassesBlock
			self.numberOfSectionsBlock = numberOfSectionsBlock
			self.numberOfItemsInSectionBlock = numberOfItemsInSectionBlock
			self.cellForItemAtIndexPathBlock = cellForItemAtIndexPathBlock
			self.sizeForItemAtIndexPathBlock = sizeForItemAtIndexPathBlock
			self.didSelectItemAtIndexPathBlock = didSelectItemAtIndexPathBlock
			self.insetForSectionAtIndexBlock = insetForSectionAtIndexBlock
			self.minimumInteritemSpacingForSectionAtIndexBlock = minimumInteritemSpacingForSectionAtIndexBlock
			self.minimumLineSpacingForSectionAtIndexBlock = minimumLineSpacingForSectionAtIndexBlock
	}
	
	func reloadData(){
		
		if let collectionView = collectionView {
			
			self.registerClassesBlock?(collectionView)
			
			collectionView.delegate = self
			collectionView.dataSource = self
			
			collectionView.reloadData()
		}
	}
	
	func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
		if (self.numberOfSectionsBlock == nil){
			return 0
		}else{
			return self.numberOfSectionsBlock!(collectionView)
		}
	}
	
	func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return self.numberOfItemsInSectionBlock(collectionView, section)
	}
	
	func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
		return self.cellForItemAtIndexPathBlock(collectionView, indexPath)
	}
	
	func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
		if (self.sizeForItemAtIndexPathBlock == nil){
			let h = collectionView.bounds.height;
			return CGSizeMake(h, h)
		}else{
			return self.sizeForItemAtIndexPathBlock!(collectionView, collectionViewLayout, indexPath)
		}
	}
	
	func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
		self.didSelectItemAtIndexPathBlock?(collectionView, indexPath)
	}
	
	func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
		if (self.insetForSectionAtIndexBlock == nil){
			return UIEdgeInsetsZero
		}else{
			return self.insetForSectionAtIndexBlock!(collectionView, collectionViewLayout, section)
		}
	}
	
	func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
		
		if (self.minimumInteritemSpacingForSectionAtIndexBlock == nil){
			return 0
		}else{
			return self.minimumInteritemSpacingForSectionAtIndexBlock!(collectionView, collectionViewLayout, section)
		}
	}
	
	func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
		
		if (self.minimumLineSpacingForSectionAtIndexBlock == nil){
			return 0
		}else{
			return self.minimumLineSpacingForSectionAtIndexBlock!(collectionView, collectionViewLayout, section)
		}
	}

}

private var YZBlockCollectionViewDelegateAssociationKey: UInt8 = 0
extension NSObject {
	
	var yz_blockCollectionViewDelegate: YZBlockCollectionViewDelegate! {
		get {
			return objc_getAssociatedObject(self, &YZBlockCollectionViewDelegateAssociationKey) as? YZBlockCollectionViewDelegate
		}
		set(newValue) {
			objc_setAssociatedObject(self, &YZBlockCollectionViewDelegateAssociationKey, newValue, objc_AssociationPolicy(OBJC_ASSOCIATION_RETAIN))
		}
	}
}