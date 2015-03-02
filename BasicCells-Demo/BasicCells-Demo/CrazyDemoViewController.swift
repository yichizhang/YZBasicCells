//
//  CrazyDemoViewController.swift
//  BasicCells-Demo
//
//  Created by Yichi on 2/03/2015.
//  Copyright (c) 2015 Yichi Zhang. All rights reserved.
//

import UIKit

class CrazyDemoViewController: UIViewController {

	lazy var button1:UIButton = {
		let r = CGRect(x: 0, y: self.view.bounds.height * 0.2, width: self.view.bounds.width, height: self.view.bounds.height * 0.2)
		let b = UIButton(frame: r)
		return b
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		button1.addTarget(self, action: "buttonTapped:", forControlEvents: .TouchUpInside)
		button1.setTitle("Show me the last row", forState: .Normal)
		view.addSubview(button1)
	}
	
	func buttonTapped(button:UIButton) {
		let vc = PrescrollDemoViewController()
		vc.rowToPrescrollTo = vc.colorList.count - 1
		vc.prescrollMode = PrescrollMode.InViewDidLayoutSubviewsWithFlag
		self.navigationController?.pushViewController(vc, animated: true)
	}

}

enum PrescrollMode : Int {
	case InViewWillAppear
	case InViewDidAppearAnimated
	case InViewDidLayoutSubviewsWithFlag
}

class PrescrollDemoViewController : UITableViewController {
	lazy var colorList:[UIColor] = {
		return [
			UIColor.gmc_redColor(),
			UIColor.gmc_pinkColor(),
			UIColor.gmc_purpleColor(),
			
			UIColor.gmc_lightBlueColor(),
			UIColor.gmc_indigoColor(),
			UIColor.gmc_blueColor(),
			
			UIColor.gmc_lightBlueColor(),
			UIColor.gmc_cyanColor(),
			UIColor.gmc_tealColor(),
			
			UIColor.gmc_greenColor(),
			UIColor.gmc_lightGreenColor(),
			UIColor.gmc_limeColor(),
						
			UIColor.gmc_yellowColor(),
			UIColor.gmc_amberColor(),
			UIColor.gmc_orangeColor(),
						
			UIColor.gmc_deepOrangeColor(),
			UIColor.gmc_brownColor(),
			UIColor.gmc_greyColor(),
						
			UIColor.gmc_blueGreyColor(),
		]
	}()
	let BasicLabelCellId = "BasicLabelCellId"
	var prescrollMode:PrescrollMode?
	var shouldPrescroll = false
	var rowToPrescrollTo:Int?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		tableView.separatorStyle = .None
		tableView.registerClass(YZBasicLabelTableCell.self, forCellReuseIdentifier: BasicLabelCellId)
		
	}
	
	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)
		
		if prescrollMode == .InViewWillAppear {
			prescrollTableView(animated: false)
		} else if prescrollMode == .InViewDidLayoutSubviewsWithFlag {
			shouldPrescroll = true
		}
	}
	
	override func viewDidAppear(animated: Bool) {
		super.viewDidAppear(animated)
		
		if prescrollMode == .InViewDidAppearAnimated {
			prescrollTableView(animated: true)
		} else if prescrollMode == .InViewDidLayoutSubviewsWithFlag {
			shouldPrescroll = false
		}
	}
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		
		if shouldPrescroll && prescrollMode == .InViewDidLayoutSubviewsWithFlag {
			prescrollTableView(animated: false)
		}
	}
	
	// MARK: Pre-scroll
	func prescrollTableView(#animated:Bool) {
		if let rowToPrescrollTo = rowToPrescrollTo {
			let indexPath = NSIndexPath(forRow: rowToPrescrollTo, inSection: 0)
			self.tableView.scrollToRowAtIndexPath(indexPath, atScrollPosition: UITableViewScrollPosition.Top, animated: animated)
		}
	}
	
	// MARK: Table view delegate and data source
	override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		return 1
	}
	
	override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return colorList.count
	}
	
	override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
		let row = CGFloat(indexPath.row)
		let k = CGFloat(colorList.count) / 2
		return pow( k - row, 2 )  + 60
	}
	
	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath:NSIndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCellWithIdentifier(BasicLabelCellId, forIndexPath: indexPath) as YZBasicLabelTableCell
		
		let color = colorList[indexPath.row]
		cell.backgroundColor = color
		cell.basicLabel.backgroundColor = color
		cell.basicLabel.font = UIFont.boldSystemFontOfSize(30)
		cell.basicLabel.textColor = UIColor.whiteColor()
		cell.basicLabel.text = "\(indexPath.row)"
		cell.basicLabel.textAlignment = .Center
		
		cell.selectionStyle = .None
		
		return cell
	}
	
}