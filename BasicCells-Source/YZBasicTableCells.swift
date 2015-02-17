/*

Copyright (c) 2015 Yichi Zhang
https://github.com/yichizhang
zhang-yi-chi@hotmail.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/

import UIKit

// MARK: Basic IMAGE Table Cell
class YZBasicImageTableCell: YZAbstractSingleItemTableViewCell {
	
	var basicImageView:UIImageView!
	
	func commonInit(){
		self.basicImageView = UIImageView()
		self.basicImageView.contentMode = UIViewContentMode.ScaleAspectFill
		self.basicImageView.clipsToBounds = true
		self.inititializeConstraintsForSingleItemView(self.basicImageView)
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		self.commonInit()
	}
	
	override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		self.commonInit()
	}
	
	required init(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func prepareForReuse() {
		self.basicImageView.image = nil
	}
	
}

// MARK: Basic LBAEL Table Cell
class YZBasicLabelTableCell: YZAbstractSingleItemTableViewCell {
	
	var basicLabel:UILabel = UILabel()
	
	func commonInit(){
		self.basicLabel.numberOfLines = 0
		self.inititializeConstraintsForSingleItemView(self.basicLabel)
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		self.commonInit()
	}
	
	override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		self.commonInit()
	}

	required init(coder aDecoder: NSCoder) {
	    fatalError("init(coder:) has not been implemented")
	}
	
	override func prepareForReuse() {
		self.basicLabel.text = ""
	}
	
}