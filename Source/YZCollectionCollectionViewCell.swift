/*
 
 Copyright (c) 2015 Yichi Zhang
 https://github.com/yichizhang
 zhang-yi-chi@hotmail.com
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 
 */
import UIKit

/// This class is meant to be an 'abstract class'
class YZCollectionCollectionViewCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
	
	var registerClasses:((UICollectionView) -> Void)?
	var numberOfSections:((Void) -> Int)?
	var numberOfItemsInSection:((Int) -> Int)!
	var cellForItemAtIndexPath:((UICollectionView, NSIndexPath) -> UICollectionViewCell)!
	var sizeForItemAtIndexPath:((UICollectionView, NSIndexPath) -> CGSize)?
	var didSelectItemAtIndexPath:((NSIndexPath) -> Void)?
	var insetForSectionAtIndex:((Int) -> UIEdgeInsets)?
	var minimumInteritemSpacingForSectionAtIndex:((Int) -> CGFloat)?
	var minimumLineSpacingForSectionAtIndex:((Int) -> CGFloat)?
	
	override func awakeFromNib() {
		super.awakeFromNib()
		
	}
	
	func cellCollectionView() -> UICollectionView{
		return UICollectionView()
	}
	
	func reloadData(){
		self.registerClasses?(self.cellCollectionView())
		
		self.cellCollectionView().delegate = self
		self.cellCollectionView().dataSource = self
		
		self.cellCollectionView().reloadData()
	}
	
	func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
		if (self.numberOfSections == nil){
			return 0
		}else{
			return self.numberOfSections!()
		}
	}
	
	func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return self.numberOfItemsInSection(section)
	}
	
	func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
		return self.cellForItemAtIndexPath(self.cellCollectionView(), indexPath)
	}
	
	func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
		if (self.sizeForItemAtIndexPath == nil){
			let h = self.cellCollectionView().bounds.height;
			return CGSizeMake(h, h)
		}else{
			return self.sizeForItemAtIndexPath!(self.cellCollectionView(), indexPath)
		}
	}
	
	func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
		self.didSelectItemAtIndexPath?(indexPath)
	}
	
	func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
		if (self.insetForSectionAtIndex == nil){
			return UIEdgeInsetsZero
		}else{
			return self.insetForSectionAtIndex!(section)
		}
	}
	
	func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
		
		if (self.minimumInteritemSpacingForSectionAtIndex == nil){
			return 0
		}else{
			return self.minimumInteritemSpacingForSectionAtIndex!(section)
		}
	}
	
	func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
		
		if (self.minimumLineSpacingForSectionAtIndex == nil){
			return 0
		}else{
			return self.minimumLineSpacingForSectionAtIndex!(section)
		}
	}

}

