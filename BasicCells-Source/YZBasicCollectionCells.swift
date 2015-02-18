/*

Copyright (c) 2015 Yichi Zhang
https://github.com/yichizhang
zhang-yi-chi@hotmail.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/

import UIKit

// MARK: Basic IMAGE Collection Cell
class YZBasicImageCollectionCell: YZAbstractSingleItemCollectionViewCell {
	
	lazy var imageView:UIImageView = {
		let imageView = UIImageView()
		imageView.contentMode = UIViewContentMode.ScaleAspectFill
		imageView.clipsToBounds = true
		return imageView
	}()
	
	func commonInit(){
		self.addToSubviewAndSetupConstraintsForSingleItemView(self.imageView)
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		self.commonInit()
	}
	
	required init(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func prepareForReuse() {
		self.imageView.image = nil
	}
	
}

// MARK: Basic LABEL Collection Cell
class YZBasicLabelCollectionCell: YZAbstractSingleItemCollectionViewCell {

	var basicLabel:UILabel = {
		let label = UILabel()
		label.numberOfLines = 0
		return label
	}()
	
	func commonInit(){
		self.addToSubviewAndSetupConstraintsForSingleItemView(self.basicLabel)
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		self.commonInit()
	}
	
	required init(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func prepareForReuse() {
		self.basicLabel.text = ""
	}

}

// MARK: Basic "Horizontal Items" Collection Cell
class YZBasicHorizontalCollectionCell : YZAbstractSingleItemCollectionViewCell {
    
    lazy var collectionView:UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .Horizontal
        layout.itemSize = CGSizeMake(self.contentView.bounds.height, self.contentView.bounds.height)
        
        let collectionView = UICollectionView(frame: self.contentView.bounds, collectionViewLayout: layout)
        
        return collectionView
    }()
    
    func commonInit(){
        self.addToSubviewAndSetupConstraintsForSingleItemView(self.collectionView)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        self.collectionView.yz_blockCollectionViewDelegate = nil
    }

}