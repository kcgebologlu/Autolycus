//
//  ConstraintTests.swift
//  AutolycusTests
//
//  Created by Harlan Kellaway on 11/3/17.
//  Copyright © 2017 Harlan Kellaway. All rights reserved.
//

import XCTest
@testable import Autolycus

class ConstraintTests: XCTestCase {
    
    func test_constrain_centerX() {
        let commonAncestor = UIView()
        let child = UIView()
        commonAncestor.tag = 124
        child.tag = 456
        
        commonAncestor.addSubview(child)
        child.constrain().centerX(to: commonAncestor)
        
        XCTAssertEqual(commonAncestor.constraints.count, 1)
        XCTAssertTrue(commonAncestor.constraints[0]
            .hasValues(firstItem: child.tag,
                       firstAttribute: .centerX,
                       relation: .equal,
                       secondItem: commonAncestor.tag,
                       secondAttribute: .centerX))
    }
    
    func test_constrain_centerY() {
        let commonAncestor = UIView()
        let child = UIView()
        commonAncestor.tag = 124
        child.tag = 456
        
        commonAncestor.addSubview(child)
        child.constrain().centerY(to: commonAncestor)
        
        XCTAssertEqual(commonAncestor.constraints.count, 1)
        XCTAssertTrue(commonAncestor.constraints[0]
            .hasValues(firstItem: child.tag,
                       firstAttribute: .centerY,
                       relation: .equal,
                       secondItem: commonAncestor.tag,
                       secondAttribute: .centerY))
    }
    
    func test_constrain_toCenter() {
        let commonAncestor = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        let child = UIView()
        commonAncestor.tag = 123
        child.tag = 456
        
        commonAncestor.addSubview(child)
        child.constrain().inCenter(of: commonAncestor)
        
        XCTAssertEqual(commonAncestor.firstItem(constraint: .centerX)?.tag, child.tag)
        XCTAssertEqual(commonAncestor.firstAttribute(constraint: .centerX), .centerX)
        XCTAssertEqual(commonAncestor.secondItem(constraint: .centerX)?.tag, commonAncestor.tag)
        XCTAssertEqual(commonAncestor.secondAttribute(constraint: .centerX), .centerX)
        
        XCTAssertEqual(commonAncestor.firstItem(constraint: .centerY)?.tag, child.tag)
        XCTAssertEqual(commonAncestor.firstAttribute(constraint: .centerY), .centerY)
        XCTAssertEqual(commonAncestor.secondItem(constraint: .centerY)?.tag, commonAncestor.tag)
        XCTAssertEqual(commonAncestor.secondAttribute(constraint: .centerY), .centerY)
    }
    
    func test_constrain_edges() {
        let commonAncestor = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        let child = UIView()
        commonAncestor.tag = 124
        child.tag = 456
        
        commonAncestor.addSubview(child)
        child.constrain().edges(to: commonAncestor)
        
        XCTAssertEqual(commonAncestor.firstItem(constraint: .leading)?.tag, child.tag)
        XCTAssertEqual(commonAncestor.firstAttribute(constraint: .leading), .leading)
        XCTAssertEqual(commonAncestor.secondItem(constraint: .leading)?.tag, commonAncestor.tag)
        XCTAssertEqual(commonAncestor.secondAttribute(constraint: .leading), .leading)
        
        XCTAssertEqual(commonAncestor.firstItem(constraint: .trailing)?.tag, child.tag)
        XCTAssertEqual(commonAncestor.firstAttribute(constraint: .trailing), .trailing)
        XCTAssertEqual(commonAncestor.secondItem(constraint: .trailing)?.tag, commonAncestor.tag)
        XCTAssertEqual(commonAncestor.secondAttribute(constraint: .trailing), .trailing)
        
        XCTAssertEqual(commonAncestor.firstItem(constraint: .top)?.tag, child.tag)
        XCTAssertEqual(commonAncestor.firstAttribute(constraint: .top), .top)
        XCTAssertEqual(commonAncestor.secondItem(constraint: .top)?.tag, commonAncestor.tag)
        XCTAssertEqual(commonAncestor.secondAttribute(constraint: .top), .top)
        
        XCTAssertEqual(commonAncestor.firstItem(constraint: .bottom)?.tag, child.tag)
        XCTAssertEqual(commonAncestor.firstAttribute(constraint: .bottom), .bottom)
        XCTAssertEqual(commonAncestor.secondItem(constraint: .bottom)?.tag, commonAncestor.tag)
        XCTAssertEqual(commonAncestor.secondAttribute(constraint: .bottom), .bottom)
    }
    
    func test_constrain_size_value() {
        let view = UIView()
        
        view.constrain().size(CGSize(width: 20, height: 30))
        
        XCTAssertEqual(view.widthConstraint()?.constant, 20)
        XCTAssertEqual(view.heightConstraint()?.constant, 30)
    }
    
    func test_constrain_size_toOtherView() {
        let commonAncestor = UIView()
        let child = UIView()
        commonAncestor.tag = 123
        child.tag = 456
        
        commonAncestor.addSubview(child)
        child.constrain().size(of: commonAncestor)
        
        XCTAssertEqual(commonAncestor.firstItem(constraint: .width)?.tag, child.tag)
        XCTAssertEqual(commonAncestor.firstAttribute(constraint: .width), .width)
        XCTAssertEqual(commonAncestor.secondItem(constraint: .width)?.tag, commonAncestor.tag)
        XCTAssertEqual(commonAncestor.secondAttribute(constraint: .width), .width)
        
        XCTAssertEqual(commonAncestor.firstItem(constraint: .height)?.tag, child.tag)
        XCTAssertEqual(commonAncestor.firstAttribute(constraint: .height), .height)
        XCTAssertEqual(commonAncestor.secondItem(constraint: .height)?.tag, commonAncestor.tag)
        XCTAssertEqual(commonAncestor.secondAttribute(constraint: .height), .height)
    }
    
    func test_constrain_origin_toOtherView() {
        let commonAncestor = UIView()
        let child = UIView()
        commonAncestor.tag = 123
        child.tag = 456
        
        commonAncestor.addSubview(child)
        child.constrain().origin(to: commonAncestor)
        
        XCTAssertEqual(commonAncestor.firstItem(constraint: .left)?.tag, child.tag)
        XCTAssertEqual(commonAncestor.firstAttribute(constraint: .left), .left)
        XCTAssertEqual(commonAncestor.secondItem(constraint: .left)?.tag, commonAncestor.tag)
        XCTAssertEqual(commonAncestor.secondAttribute(constraint: .left), .left)
        
        XCTAssertEqual(commonAncestor.firstItem(constraint: .top)?.tag, child.tag)
        XCTAssertEqual(commonAncestor.firstAttribute(constraint: .top), .top)
        XCTAssertEqual(commonAncestor.secondItem(constraint: .top)?.tag, commonAncestor.tag)
        XCTAssertEqual(commonAncestor.secondAttribute(constraint: .top), .top)
    }
    
    func test_constrain_width_value() {
        let view = UIView()
        
        view.constrain().width(10)
        
        XCTAssertEqual(view.widthConstraint()?.constant, 10)
    }
    
    func test_constrain_width_toOtherview() {
        let commonAncestor = UIView()
        let child = UIView()
        commonAncestor.tag = 124
        child.tag = 456
        
        commonAncestor.addSubview(child)
        child.constrain().width(to: commonAncestor)
        
        XCTAssertEqual(commonAncestor.firstItem(constraint: .width)?.tag, child.tag)
        XCTAssertEqual(commonAncestor.firstAttribute(constraint: .width), .width)
        XCTAssertEqual(commonAncestor.secondItem(constraint: .width)?.tag, commonAncestor.tag)
        XCTAssertEqual(commonAncestor.secondAttribute(constraint: .width), .width)
    }
    
    func test_constrain_width_minMax() {
        let view = UIView()
        
        view.constrain().width(min: 10, max: 100)
        
        let widthConstraints = view.widthConstraints()
        let minConstraint = widthConstraints[0]
        let maxConstraint = widthConstraints[1]
        
        XCTAssertEqual(minConstraint.relation, .greaterThanOrEqual)
        XCTAssertEqual(minConstraint.constant, 10)
        XCTAssertEqual(maxConstraint.relation, .lessThanOrEqual)
        XCTAssertEqual(maxConstraint.constant, 100)
    }
    
    func test_constrain_height_value() {
        let view = UIView()
        
        view.constrain().height(10)
        
        XCTAssertEqual(view.heightConstraint()?.constant, 10)
    }
    
    func test_constrain_height_toOtherview() {
        let commonAncestor = UIView()
        let child = UIView()
        commonAncestor.tag = 124
        child.tag = 456
        
        commonAncestor.addSubview(child)
        child.constrain().height(to: commonAncestor)
        
        XCTAssertEqual(commonAncestor.firstItem(constraint: .height)?.tag, child.tag)
        XCTAssertEqual(commonAncestor.firstAttribute(constraint: .height), .height)
        XCTAssertEqual(commonAncestor.secondItem(constraint: .height)?.tag, commonAncestor.tag)
        XCTAssertEqual(commonAncestor.secondAttribute(constraint: .height), .height)
    }
    
    func test_constrain_height_minMax() {
        let view = UIView()
        
        view.constrain().height(min: 10, max: 100)
        
        let heightConstraints = view.heightConstraints()
        let minConstraint = heightConstraints[0]
        let maxConstraint = heightConstraints[1]
        
        XCTAssertEqual(minConstraint.relation, .greaterThanOrEqual)
        XCTAssertEqual(minConstraint.constant, 10)
        XCTAssertEqual(maxConstraint.relation, .lessThanOrEqual)
        XCTAssertEqual(maxConstraint.constant, 100)
    }
    
    func test_constrain_leadingToTrailing() {
        let commonAncestor = UIView()
        let child = UIView()
        commonAncestor.tag = 123
        child.tag = 456
        
        commonAncestor.addSubview(child)
        child.constrain().leadingToTrailing(of: commonAncestor)
        
        XCTAssertEqual(commonAncestor.constraints.count, 1)
        XCTAssertTrue(commonAncestor.constraints[0]
            .hasValues(firstItem: child.tag,
                       firstAttribute: .leading,
                       relation: .equal,
                       secondItem: commonAncestor.tag,
                       secondAttribute: .trailing))
    }
    
    func test_constrain_leading() {
        let commonAncestor = UIView()
        let child = UIView()
        commonAncestor.tag = 124
        child.tag = 456
        
        commonAncestor.addSubview(child)
        child.constrain().leading(to: commonAncestor)
        
        XCTAssertEqual(commonAncestor.constraints.count, 1)
        XCTAssertTrue(commonAncestor.constraints[0]
            .hasValues(firstItem: child.tag,
                       firstAttribute: .leading,
                       relation: .equal,
                       secondItem: commonAncestor.tag,
                       secondAttribute: .leading))
    }
    
    func test_constrain_leftToRight() {
        let commonAncestor = UIView()
        let child = UIView()
        commonAncestor.tag = 123
        child.tag = 456
        
        commonAncestor.addSubview(child)
        child.constrain().leftToRight(of: commonAncestor)
        
        XCTAssertEqual(commonAncestor.constraints.count, 1)
        XCTAssertTrue(commonAncestor.constraints[0]
            .hasValues(firstItem: child.tag,
                       firstAttribute: .left,
                       relation: .equal,
                       secondItem: commonAncestor.tag,
                       secondAttribute: .right))
    }
    
    func test_constrain_left() {
        let commonAncestor = UIView()
        let child = UIView()
        commonAncestor.tag = 124
        child.tag = 456
        
        commonAncestor.addSubview(child)
        child.constrain().left(to: commonAncestor)
        
        XCTAssertEqual(commonAncestor.constraints.count, 1)
        XCTAssertTrue(commonAncestor.constraints[0]
            .hasValues(firstItem: child.tag,
                       firstAttribute: .left,
                       relation: .equal,
                       secondItem: commonAncestor.tag,
                       secondAttribute: .left))
    }
    
    func test_constrain_trailingToLeading() {
        let commonAncestor = UIView()
        let child = UIView()
        commonAncestor.tag = 123
        child.tag = 456
        
        commonAncestor.addSubview(child)
        child.constrain().trailingToLeading(of: commonAncestor)
        
        XCTAssertEqual(commonAncestor.constraints.count, 1)
        XCTAssertTrue(commonAncestor.constraints[0]
            .hasValues(firstItem: child.tag,
                       firstAttribute: .trailing,
                       relation: .equal,
                       secondItem: commonAncestor.tag,
                       secondAttribute: .leading))
    }
    
    func test_constrain_trailing() {
        let commonAncestor = UIView()
        let child = UIView()
        commonAncestor.tag = 124
        child.tag = 456
        
        commonAncestor.addSubview(child)
        child.constrain().trailing(to: commonAncestor)
        
        XCTAssertEqual(commonAncestor.constraints.count, 1)
        XCTAssertTrue(commonAncestor.constraints[0]
            .hasValues(firstItem: child.tag,
                       firstAttribute: .trailing,
                       relation: .equal,
                       secondItem: commonAncestor.tag,
                       secondAttribute: .trailing))
    }
    
    func test_constrain_rightToLeft() {
        let commonAncestor = UIView()
        let child = UIView()
        commonAncestor.tag = 123
        child.tag = 456
        
        commonAncestor.addSubview(child)
        child.constrain().rightToLeft(of: commonAncestor)
        
        XCTAssertEqual(commonAncestor.constraints.count, 1)
        XCTAssertTrue(commonAncestor.constraints[0]
            .hasValues(firstItem: child.tag,
                       firstAttribute: .right,
                       relation: .equal,
                       secondItem: commonAncestor.tag,
                       secondAttribute: .left))
    }
    
    func test_constrain_right() {
        let commonAncestor = UIView()
        let child = UIView()
        commonAncestor.tag = 124
        child.tag = 456
        
        commonAncestor.addSubview(child)
        child.constrain().right(to: commonAncestor)
        
        XCTAssertEqual(commonAncestor.constraints.count, 1)
        XCTAssertTrue(commonAncestor.constraints[0]
            .hasValues(firstItem: child.tag,
                       firstAttribute: .right,
                       relation: .equal,
                       secondItem: commonAncestor.tag,
                       secondAttribute: .right))
    }
    
    func test_constrain_topToBottom() {
        let commonAncestor = UIView()
        let child = UIView()
        commonAncestor.tag = 123
        child.tag = 456
        
        commonAncestor.addSubview(child)
        child.constrain().topToBottom(of: commonAncestor)
        
        XCTAssertEqual(commonAncestor.constraints.count, 1)
        XCTAssertTrue(commonAncestor.constraints[0]
            .hasValues(firstItem: child.tag,
                       firstAttribute: .top,
                       relation: .equal,
                       secondItem: commonAncestor.tag,
                       secondAttribute: .bottom))
    }
    
    func test_constrain_top() {
        let commonAncestor = UIView()
        let child = UIView()
        commonAncestor.tag = 124
        child.tag = 456
        
        commonAncestor.addSubview(child)
        child.constrain().top(to: commonAncestor)
        
        XCTAssertEqual(commonAncestor.constraints.count, 1)
        XCTAssertTrue(commonAncestor.constraints[0]
            .hasValues(firstItem: child.tag,
                       firstAttribute: .top,
                       relation: .equal,
                       secondItem: commonAncestor.tag,
                       secondAttribute: .top))
    }
    
    func test_constrain_bottomToTop() {
        let commonAncestor = UIView()
        let child = UIView()
        commonAncestor.tag = 123
        child.tag = 456
        
        commonAncestor.addSubview(child)
        child.constrain().bottomToTop(of: commonAncestor)
        
        XCTAssertEqual(commonAncestor.constraints.count, 1)
        XCTAssertTrue(commonAncestor.constraints[0]
            .hasValues(firstItem: child.tag,
                       firstAttribute: .bottom,
                       relation: .equal,
                       secondItem: commonAncestor.tag,
                       secondAttribute: .top))
    }
    
    func test_constrain_bottom() {
        let commonAncestor = UIView()
        let child = UIView()
        commonAncestor.tag = 124
        child.tag = 456
        
        commonAncestor.addSubview(child)
        child.constrain().bottom(to: commonAncestor)
        
        XCTAssertEqual(commonAncestor.constraints.count, 1)
        XCTAssertTrue(commonAncestor.constraints[0]
            .hasValues(firstItem: child.tag,
                       firstAttribute: .bottom,
                       relation: .equal,
                       secondItem: commonAncestor.tag,
                       secondAttribute: .bottom))
    }
    
    // MARK: Superview
    
    func test_constrain_centerXToSuperview() {
        let superview = UIView()
        let child = UIView()
        superview.tag = 124
        child.tag = 456
        
        superview.addSubview(child)
        child.constrain().centerXToSuperview()
        
        XCTAssertEqual(superview.constraints.count, 1)
        XCTAssertTrue(superview.constraints[0]
            .hasValues(firstItem: child.tag,
                       firstAttribute: .centerX,
                       relation: .equal,
                       secondItem: superview.tag,
                       secondAttribute: .centerX))
    }
    
    func test_constrain_centerYToSuperview() {
        let superview = UIView()
        let child = UIView()
        superview.tag = 124
        child.tag = 456
        
        superview.addSubview(child)
        child.constrain().centerYToSuperview()
        
        XCTAssertEqual(superview.constraints.count, 1)
        XCTAssertTrue(superview.constraints[0]
            .hasValues(firstItem: child.tag,
                       firstAttribute: .centerY,
                       relation: .equal,
                       secondItem: superview.tag,
                       secondAttribute: .centerY))
    }
    
    func test_constrain_inCenterOfSuperview() {
        let superview = UIView()
        let child = UIView()
        superview.tag = 123
        child.tag = 456
        
        superview.addSubview(child)
        child.constrain().inCenter(of: superview)
        
        XCTAssertEqual(superview.firstItem(constraint: .centerX)?.tag, child.tag)
        XCTAssertEqual(superview.firstAttribute(constraint: .centerX), .centerX)
        XCTAssertEqual(superview.secondItem(constraint: .centerX)?.tag, superview.tag)
        XCTAssertEqual(superview.secondAttribute(constraint: .centerX), .centerX)
        
        XCTAssertEqual(superview.firstItem(constraint: .centerY)?.tag, child.tag)
        XCTAssertEqual(superview.firstAttribute(constraint: .centerY), .centerY)
        XCTAssertEqual(superview.secondItem(constraint: .centerY)?.tag, superview.tag)
        XCTAssertEqual(superview.secondAttribute(constraint: .centerY), .centerY)
    }
    
    func test_constrain_edgesToSuperview() {
        let superview = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        let child = UIView()
        superview.tag = 124
        child.tag = 456
        
        superview.addSubview(child)
        child.constrain().edges(to: superview)
        
        XCTAssertEqual(superview.firstItem(constraint: .leading)?.tag, child.tag)
        XCTAssertEqual(superview.firstAttribute(constraint: .leading), .leading)
        XCTAssertEqual(superview.secondItem(constraint: .leading)?.tag, superview.tag)
        XCTAssertEqual(superview.secondAttribute(constraint: .leading), .leading)
        
        XCTAssertEqual(superview.firstItem(constraint: .trailing)?.tag, child.tag)
        XCTAssertEqual(superview.firstAttribute(constraint: .trailing), .trailing)
        XCTAssertEqual(superview.secondItem(constraint: .trailing)?.tag, superview.tag)
        XCTAssertEqual(superview.secondAttribute(constraint: .trailing), .trailing)
        
        XCTAssertEqual(superview.firstItem(constraint: .top)?.tag, child.tag)
        XCTAssertEqual(superview.firstAttribute(constraint: .top), .top)
        XCTAssertEqual(superview.secondItem(constraint: .top)?.tag, superview.tag)
        XCTAssertEqual(superview.secondAttribute(constraint: .top), .top)
        
        XCTAssertEqual(superview.firstItem(constraint: .bottom)?.tag, child.tag)
        XCTAssertEqual(superview.firstAttribute(constraint: .bottom), .bottom)
        XCTAssertEqual(superview.secondItem(constraint: .bottom)?.tag, superview.tag)
        XCTAssertEqual(superview.secondAttribute(constraint: .bottom), .bottom)
    }
    
    func test_constrain_originToSuperview() {
        let superview = UIView()
        let child = UIView()
        superview.tag = 123
        child.tag = 456
        
        superview.addSubview(child)
        child.constrain().origin(to: superview)
        
        XCTAssertEqual(superview.firstItem(constraint: .left)?.tag, child.tag)
        XCTAssertEqual(superview.firstAttribute(constraint: .left), .left)
        XCTAssertEqual(superview.secondItem(constraint: .left)?.tag, superview.tag)
        XCTAssertEqual(superview.secondAttribute(constraint: .left), .left)
        
        XCTAssertEqual(superview.firstItem(constraint: .top)?.tag, child.tag)
        XCTAssertEqual(superview.firstAttribute(constraint: .top), .top)
        XCTAssertEqual(superview.secondItem(constraint: .top)?.tag, superview.tag)
        XCTAssertEqual(superview.secondAttribute(constraint: .top), .top)
    }
    
    func test_constrain_sizeOfSuperview() {
        let superview = UIView()
        let child = UIView()
        superview.tag = 123
        child.tag = 456
        
        superview.addSubview(child)
        child.constrain().size(of: superview)
        
        XCTAssertEqual(superview.firstItem(constraint: .width)?.tag, child.tag)
        XCTAssertEqual(superview.firstAttribute(constraint: .width), .width)
        XCTAssertEqual(superview.secondItem(constraint: .width)?.tag, superview.tag)
        XCTAssertEqual(superview.secondAttribute(constraint: .width), .width)
        
        XCTAssertEqual(superview.firstItem(constraint: .height)?.tag, child.tag)
        XCTAssertEqual(superview.firstAttribute(constraint: .height), .height)
        XCTAssertEqual(superview.secondItem(constraint: .height)?.tag, superview.tag)
        XCTAssertEqual(superview.secondAttribute(constraint: .height), .height)
    }
    
    func test_constrain_width_toSuperview() {
        let superview = UIView()
        let child = UIView()
        superview.tag = 124
        child.tag = 456
        
        superview.addSubview(child)
        child.constrain().width(to: superview)
        
        XCTAssertEqual(superview.firstItem(constraint: .width)?.tag, child.tag)
        XCTAssertEqual(superview.firstAttribute(constraint: .width), .width)
        XCTAssertEqual(superview.secondItem(constraint: .width)?.tag, superview.tag)
        XCTAssertEqual(superview.secondAttribute(constraint: .width), .width)
    }
    
    func test_constrain_height_toSuperview() {
        let superview = UIView()
        let child = UIView()
        superview.tag = 124
        child.tag = 456
        
        superview.addSubview(child)
        child.constrain().height(to: superview)
        
        XCTAssertEqual(superview.firstItem(constraint: .height)?.tag, child.tag)
        XCTAssertEqual(superview.firstAttribute(constraint: .height), .height)
        XCTAssertEqual(superview.secondItem(constraint: .height)?.tag, superview.tag)
        XCTAssertEqual(superview.secondAttribute(constraint: .height), .height)
    }
    
    func test_constrain_leadingToSuperview() {
        let superview = UIView()
        let child = UIView()
        superview.tag = 124
        child.tag = 456
        
        superview.addSubview(child)
        child.constrain().leadingToSuperview()
        
        XCTAssertEqual(superview.constraints.count, 1)
        XCTAssertTrue(superview.constraints[0]
            .hasValues(firstItem: child.tag,
                       firstAttribute: .leading,
                       relation: .equal,
                       secondItem: superview.tag,
                       secondAttribute: .leading))
    }
    
    func test_constrain_leftToSuperview() {
        let superview = UIView()
        let child = UIView()
        superview.tag = 124
        child.tag = 456
        
        superview.addSubview(child)
        child.constrain().leftToSuperview()
        
        XCTAssertEqual(superview.constraints.count, 1)
        XCTAssertTrue(superview.constraints[0]
            .hasValues(firstItem: child.tag,
                       firstAttribute: .left,
                       relation: .equal,
                       secondItem: superview.tag,
                       secondAttribute: .left))
    }
    
    func test_constrain_trailingToSuperview() {
        let superview = UIView()
        let child = UIView()
        superview.tag = 124
        child.tag = 456
        
        superview.addSubview(child)
        child.constrain().trailingToSuperview()
        
        XCTAssertEqual(superview.constraints.count, 1)
        XCTAssertTrue(superview.constraints[0]
            .hasValues(firstItem: child.tag,
                       firstAttribute: .trailing,
                       relation: .equal,
                       secondItem: superview.tag,
                       secondAttribute: .trailing))
    }
    
    func test_constrain_rightToSuperview() {
        let superview = UIView()
        let child = UIView()
        superview.tag = 124
        child.tag = 456
        
        superview.addSubview(child)
        child.constrain().rightToSuperview()
        
        XCTAssertEqual(superview.constraints.count, 1)
        XCTAssertTrue(superview.constraints[0]
            .hasValues(firstItem: child.tag,
                       firstAttribute: .right,
                       relation: .equal,
                       secondItem: superview.tag,
                       secondAttribute: .right))
    }
    
    func test_constrain_topToSuperview() {
        let superview = UIView()
        let child = UIView()
        superview.tag = 124
        child.tag = 456
        
        superview.addSubview(child)
        child.constrain().topToSuperview()
        
        XCTAssertEqual(superview.constraints.count, 1)
        XCTAssertTrue(superview.constraints[0]
            .hasValues(firstItem: child.tag,
                       firstAttribute: .top,
                       relation: .equal,
                       secondItem: superview.tag,
                       secondAttribute: .top))
    }
    
}
