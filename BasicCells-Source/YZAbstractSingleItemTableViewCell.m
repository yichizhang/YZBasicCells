/*
 
 Copyright (c) 2015 Yichi Zhang
 https://github.com/yichizhang
 zhang-yi-chi@hotmail.com
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 
 */

#import "YZAbstractSingleItemTableViewCell.h"

@implementation YZAbstractSingleItemTableViewCell

- (void)inititializeConstraintsForSingleItemView:(UIView*)singleItemView{
	
	[self.contentView addSubview:singleItemView];
	
	singleItemView.translatesAutoresizingMaskIntoConstraints = NO;
	
	self.topConstraint = [NSLayoutConstraint
						  constraintWithItem:singleItemView
						  attribute:NSLayoutAttributeTop
						  relatedBy:NSLayoutRelationEqual
						  toItem:self.contentView
						  attribute:NSLayoutAttributeTop
						  multiplier:1.0f
						  constant:0.f];
	self.leadingConstraint = [NSLayoutConstraint
							  constraintWithItem:singleItemView
							  attribute:NSLayoutAttributeLeading
							  relatedBy:NSLayoutRelationEqual
							  toItem:self.contentView
							  attribute:NSLayoutAttributeLeading
							  multiplier:1.0f
							  constant:0.f];
	self.bottomConstraint = [NSLayoutConstraint
							 constraintWithItem:singleItemView
							 attribute:NSLayoutAttributeBottom
							 relatedBy:NSLayoutRelationEqual
							 toItem:self.contentView
							 attribute:NSLayoutAttributeBottom
							 multiplier:1.0f
							 constant:0.f];
	self.trailingConstraint = [NSLayoutConstraint
							   constraintWithItem:singleItemView
							   attribute:NSLayoutAttributeTrailing
							   relatedBy:NSLayoutRelationEqual
							   toItem:self.contentView
							   attribute:NSLayoutAttributeTrailing
							   multiplier:1.0f
							   constant:0.f];
	[self.contentView addConstraint:self.topConstraint];
	[self.contentView addConstraint:self.leadingConstraint];
	[self.contentView addConstraint:self.bottomConstraint];
	[self.contentView addConstraint:self.trailingConstraint];
}

- (void)setUpWithPadding:(UIEdgeInsets)insets{
	self.topConstraint.constant = insets.top;
	self.leadingConstraint.constant = insets.left;
	self.trailingConstraint.constant = insets.right;
	self.bottomConstraint.constant = insets.bottom;
	
	[self setNeedsUpdateConstraints];
}

@end
