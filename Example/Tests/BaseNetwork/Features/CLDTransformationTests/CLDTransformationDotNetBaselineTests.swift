//
//  CLDTransformationDotNetBaselineTests.swift
//
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

@testable import Cloudinary
import Foundation
import XCTest

// MARK: - CLDTransformationDotNetBaselineTests
class CLDTransformationDotNetBaselineTests: BaseTestCase {
    
    var sut : CLDTransformation!
    
    // MARK: - setup and teardown
    override func setUp() {
        super.setUp()
        sut = CLDTransformation.init()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    // MARK: - ifCondition with String
    func test_ifCondition_emptyStringProperty_shouldNotStoreNewParam() {
        
        // Given
        let stringInput = String()
        
        // When
        sut.ifCondition(stringInput)
        
        let actualResult = sut.ifParam!
        
        // Then
        XCTAssertTrue(actualResult.isEmpty, "Empty expression should not be stored in params")
    }
    // MARK: -
    func test_WithLiteral()
    {
        var transformation = CLDTransformation().ifCondition("w_lt_200").setCrop("fill").setHeight(120).setWidth(80)
        var sTransform = transformation.asString()!
        XCTAssertEqual(sTransform.firstIndex(of: "if"), 0, "should include the if parameter as the first component in the transformation string")
        XCTAssertEqual("if_w_lt_200,c_fill,h_120,w_80", sTransform, "should be proper transformation string")
        
        transformation = CLDTransformation().setCrop("fill").setHeight(120).ifCondition("w_lt_200").setWidth(80);
        sTransform = transformation.asString()!
        XCTAssertEqual(sTransform.firstIndex(of: "if"), 0, "should include the if parameter as the first component in the transformation string");
        XCTAssertEqual("if_w_lt_200,c_fill,h_120,w_80", sTransform, "components should be in proper order")
        
        transformation = CLDTransformation().ifCondition("w_lt_200").setCrop("fill").setHeight(120).setWidth(80)
            .chain().ifCondition("w_gt_400").setCrop("fit").setHeight(150).setWidth(150)
            .chain().setEffect("sepia")
        sTransform = transformation.asString()!
        XCTAssertEqual("if_w_lt_200,c_fill,h_120,w_80/if_w_gt_400,c_fit,h_150,w_150/e_sepia", sTransform, "should allow multiple conditions when chaining transformations")
    }
    
    func test_LiteralWithSpaces()
    {
        let transformation = CLDTransformation().ifCondition("w < 200").setCrop("fill").setHeight(120).setWidth(80)
        let sTransform = transformation.asString()!
        XCTAssertEqual("if_w_lt_200,c_fill,h_120,w_80", sTransform, "should translate operators")
    }
    
    func test_EndIf()
    {
        let transformation = CLDTransformation().ifCondition("w_lt_200").setCrop("fill").setHeight(120).setWidth(80).setEffect("sharpen")
            .chain().setEffect("brightness", param: "50")
            .chain().setEffect("shadow").setColor("red")
            .endIf()
        
        let sTransform = transformation.asString()!
        XCTAssertTrue(sTransform.hasSuffix("if_end"), "should include the if_end as the last parameter in its component")
        XCTAssertEqual("if_w_lt_200/c_fill,e_sharpen,h_120,w_80/e_brightness:50/co_red,e_shadow/if_end", sTransform, "should be proper transformation string")
    }
    
    func test_IfElse()
    {
        // var transformations = new List<Transformation>()
        // {
        //     new Transformation().IfCondition("w_lt_200").Crop("fill").Height(120).Width(80),
        //     new Transformation().IfElse().Crop("fill").Height(90).Width(100)
        // };
        // var transformation = new Transformation(transformations);
        // var sTransform = transformation.ToString();
        // Assert.AreEqual("if_w_lt_200,c_fill,h_120,w_80/if_else,c_fill,h_90,w_100", sTransform, "should support if_else with transformation parameters");
        
        // transformations = new List<Transformation>()
        // {
        //         new Transformation().IfCondition("w_lt_200"),
        //         new Transformation().Crop("fill").Height(120).Width(80),
        //         new Transformation().IfElse(),
        //         new Transformation().Crop("fill").Height(90).Width(100)
        // };
        // transformation = new Transformation(transformations);
        // sTransform = transformation.ToString();
        // Assert.IsTrue(sTransform.Contains("/if_else/"), "if_else should be without any transformation parameters");
        // Assert.AreEqual("if_w_lt_200/c_fill,h_120,w_80/if_else/c_fill,h_90,w_100", sTransform, "should be proper transformation string");
    }
    
    func test_ChainedConditions()
    {
        //        var transformation = new Transformation().IfCondition().AspectRatio("gt", "3:4").Then().Width(100).Crop("scale");
        //        Assert.AreEqual("if_ar_gt_3:4,c_scale,w_100", transformation.ToString(), "passing an operator and a value adds a condition");
        //
        //        transformation = new Transformation().IfCondition().AspectRatio("gt", "3:4").And().Width("gt", 100).Then().Width(50).Crop("scale");
        //        Assert.AreEqual("if_ar_gt_3:4_and_w_gt_100,c_scale,w_50", transformation.ToString(), "should chaining condition with `and`");
        //
        //        transformation = new Transformation().IfCondition().AspectRatio("gt", "3:4").And().Width("gt", 100).Or().Width("gt", 200).Then().Width(50).Crop("scale");
        //        Assert.AreEqual("if_ar_gt_3:4_and_w_gt_100_or_w_gt_200,c_scale,w_50", transformation.ToString(), "should chain conditions with `or`");
        //
        //        transformation = new Transformation().IfCondition().AspectRatio(">", "3:4").And().Width("<=", 100).Or().Width("gt", 200).Then().Width(50).Crop("scale");
        //        Assert.AreEqual("if_ar_gt_3:4_and_w_lte_100_or_w_gt_200,c_scale,w_50", transformation.ToString(), "should translate operators");
        //
        //        transformation = new Transformation().IfCondition().AspectRatio(">", "3:4").And().Width("<=", 100).Or().Width(">", 200).Then().Width(50).Crop("scale");
        //        Assert.AreEqual("if_ar_gt_3:4_and_w_lte_100_or_w_gt_200,c_scale,w_50", transformation.ToString(), "should translate operators");
        //
        //        transformation = new Transformation().IfCondition().AspectRatio(">=", "3:4").And().PageCount(">=", 100).Or().PageCount("!=", 0).Then().Width(50).Crop("scale");
        //        Assert.AreEqual("if_ar_gte_3:4_and_pc_gte_100_or_pc_ne_0,c_scale,w_50", transformation.ToString(), "should translate operators");
        //
        //        transformation = new Transformation().IfCondition().AspectRatio("gt", "3:4").And().InitialHeight(">", 100).And().InitialWidth("<", 500).Then().Width(100).Crop("scale");
        //        Assert.AreEqual("if_ar_gt_3:4_and_ih_gt_100_and_iw_lt_500,c_scale,w_100", transformation.ToString(), "passing an operator and a value adds a condition");
        //
        //        transformation = new Transformation().IfCondition().InitialDuration(">", 30).And().InitialHeight(">", 100).And().InitialWidth("<", 500).Then().Width(100).Crop("scale");
        //        Assert.AreEqual("if_idu_gt_30_and_ih_gt_100_and_iw_lt_500,c_scale,w_100", transformation.ToString(), "passing an operator and a value adds a condition");
        //
        //        transformation = new Transformation().IfCondition().Duration("<", 30).And().InitialHeight(">", 100).And().InitialWidth("<", 500).Then().Width(100).Crop("scale");
        //        Assert.AreEqual("if_du_lt_30_and_ih_gt_100_and_iw_lt_500,c_scale,w_100", transformation.ToString(), "passing an operator and a value adds a condition");
    }
    
    func test_ShouldSupportAndTranslateOperators()
    {
        var allOperators = "if_" +
            "w_eq_0_and" +
            "_h_ne_0_or" +
            "_ar_lt_0_and" +
            "_pc_gt_0_and" +
            "_fc_lte_0_and" +
            "_w_gte_0" +
        ",e_grayscale"
        
        //        Assert.AreEqual(allOperators, new Transformation().IfCondition()
        //                        .Width("=", 0).And()
        //                        .Height("!=", 0).Or()
        //                        .AspectRatio("<", "0").And()
        //                        .PageCount(">", 0).And()
        //                        .FaceCount("<=", 0).And()
        //                        .Width(">=", 0)
        //                        .Then().Effect("grayscale").ToString(), "should support and translate operators:  '=', '!=', '<', '>', '<=', '>=', '&&', '||'");
        //
        //        Assert.AreEqual(allOperators, new Transformation().IfCondition("w = 0 && height != 0 || aspectRatio < 0 and pageCount > 0 and faceCount <= 0 and width >= 0")
        //                    .Effect("grayscale")
        //                    .ToString());
    }
    
    func test_EndIf2()
    {
        var transformation : CLDTransformation
        
        transformation = CLDTransformation().ifCondition().width("gt", 100).and().width("lt", 200).then().setWidth(50).setCrop("scale").endIf()
        // var transformation = new Transformation().IfCondition().Width("gt", 100).And().Width("lt", 200).Then().Width(50).Crop("scale").EndIf();
        XCTAssertEqual("if_w_gt_100_and_w_lt_200/c_scale,w_50/if_end", transformation.asString()!, "should serialize to 'if_end'");
        transformation = CLDTransformation().ifCondition().width("gt", 100).and().width("lt", 200).then().setWidth(50).setCrop("scale").endIf()

        // transformation = new Transformation().IfCondition().Width("gt", 100).And().Width("lt", 200).Then().Width(50).Crop("scale").EndIf();
        XCTAssertEqual("if_w_gt_100_and_w_lt_200/c_scale,w_50/if_end", transformation.asString(), "force the if clause to be chained");
        
        transformation = CLDTransformation().ifCondition().width("gt", 100).and().width("lt", 200).then().setWidth(50).setCrop("scale").ifElse().setWidth(100).setCrop("crop").endIf()
        // transformation = new Transformation().IfCondition().Width("gt", 100).And().Width("lt", 200).Then().Width(50).Crop("scale").IfElse().Width(100).Crop("crop").EndIf();
        XCTAssertEqual("if_w_gt_100_and_w_lt_200/c_scale,w_50/if_else/c_crop,w_100/if_end", transformation.asString()!, "force the if_else clause to be chained");
    }
    
    func test_TestExpressionOperators()
    {
        let transformationStr = "$foo_10,$foostr_!my:str:ing!/if_fc_gt_2_and" +
            "_pc_lt_300_or" +
            "_!myTag1!_in_tags_and" +
            "_!myTag2!_nin_tags_and" +
            "_w_gte_200_and" +
            "_h_eq_$foo_and" +
            "_w_ne_$foo_mul_2_and" +
            "_h_lt_$foo_or" +
            "_w_lte_500_and" +
            "_ils_lt_0_and" +
            "_cp_eq_10_and" +
            "_px_lt_300_and" +
            "_py_lt_300_and" +
            "_py_ne_400_and" +
            "_ar_gt_3:4_and" +
            "_iar_gt_3:4_and" +
            "_h_lt_iw_div_2_add_1_and" +
            "_w_lt_ih_sub_$foo_and" +
            "_du_eq_$foo_and" +
            "_du_ne_$foo_and" +
            "_du_lt_30_and" +
            "_du_lte_$foo_and" +
            "_du_gt_30_and" +
            "_du_gte_$foo_and" +
            "_idu_eq_$foo_and" +
            "_idu_ne_$foo_and" +
            "_idu_lt_30_and" +
            "_idu_lte_$foo_and" +
            "_idu_gt_30_and" +
            "_idu_gte_$foo" +
            "/c_scale,l_$foostr" +
            // ",w_$foo_mul_200_div_fc" +
        "/if_end";
        
        let transformation = CLDTransformation()
            .setVariable(CLDVariable(name: "$foo", value: 10))
            .setVariable(CLDVariable(name: "$foostr", values: ["my", "str", "ing"]))
            .chain()
            .ifCondition(
                CLDConditionExpression.faceCount().greater(then: 2)
                    .and().value(CLDConditionExpression.pageCount().less(then: 300))
                    .or(string: "!myTag1!").inside(.tags())
                    .and(string: "!myTag2!").notInside(.tags())
                    .and().value(CLDConditionExpression.width().greaterOrEqual(to: 200))
                    .and().value(CLDConditionExpression.height().equal(to: "$foo"))
                    .and().value(CLDConditionExpression.width().notEqual(to: "$foo").multiple(by: 2))
                    .and().value(CLDConditionExpression.height().less(then: "$foo"))
                    .or().value(CLDConditionExpression.width().lessOrEqual(to: 500))
                    .and().value(CLDConditionExpression.illustrationScore().less(then: 0))
                    .and().value(CLDConditionExpression.currentPageIndex().equal(to: 10))
                    .and().value(CLDConditionExpression.pageXOffset().less(then: 300))
                    .and().value(CLDConditionExpression.pageYOffset().less(then: 300))
                    .and().value(CLDConditionExpression.pageYOffset().notEqual(to: 400))
                    .and().value(CLDConditionExpression.aspectRatio().greater(then: "3:4"))
                    .and().value(CLDConditionExpression.initialAspectRatio().greater(then: "3:4"))
                    .and().value(CLDConditionExpression.height().less(CLDConditionExpression.initialWidth().divide(by: 2).add(by: 1)))
                    .and().value(CLDConditionExpression.width().less(CLDConditionExpression.initialHeight().subtract(by: "$foo")))
                    .and().value(CLDConditionExpression.duration().equal(to: "$foo"))
                    .and().value(CLDConditionExpression.duration().notEqual(to: "$foo"))
                    .and().value(CLDConditionExpression.duration().less(then: 30))
                    .and().value(CLDConditionExpression.duration().lessOrEqual(to: "$foo"))
                    .and().value(CLDConditionExpression.duration().greater(then: 30))
                    .and().value(CLDConditionExpression.duration().greaterOrEqual(to: "$foo"))
                    .and().value(CLDConditionExpression.initialDuration().equal(to: "$foo"))
                    .and().value(CLDConditionExpression.initialDuration().notEqual(to: "$foo"))
                    .and().value(CLDConditionExpression.initialDuration().less(then: 30))
                    .and().value(CLDConditionExpression.initialDuration().lessOrEqual(to: "$foo"))
                    .and().value(CLDConditionExpression.initialDuration().greater(then: 30))
                    .and().value(CLDConditionExpression.initialDuration().greaterOrEqual(to: "$foo"))
        )
            .setCrop("scale")
            // .Width(new Condition("$foo * 200 / faceCount"))
            .setOverlay("$foostr")
            .endIf()
        
        XCTAssertEqual(transformationStr, transformation.asString()!)
    }
    
    func test_TestExpressionOperatorsWithValues()
    {
        let transformationStr = "$foo_10,$foostr_!my:str:ing!/if_fc_gt_2_and" +
            "_pc_lt_300_or" +
            "_!myTag1!_in_tags_and" +
            "_!myTag2!_nin_tags_and" +
            "_w_gte_200_and" +
            "_h_eq_$foo_and" +
            "_w_ne_$foo_mul_2_and" +
            "_h_lt_$foo_or" +
            "_w_lte_500_and" +
            "_ils_lt_0_and" +
            "_cp_eq_10_and" +
            "_px_lt_300_and" +
            "_py_lt_300_and" +
            "_py_ne_400_and" +
            "_ar_gt_3:4_and" +
            "_iar_gt_3:4_and" +
            "_h_lt_iw_div_2_add_1_and" +
            "_w_lt_ih_sub_$foo" +
            "/c_scale," +
            "l_$foostr" + // "," +
            // "w_$foo_mul_200_div_fc" +
        "/if_end";
        
        let transformation = CLDTransformation()
            .setVariable(CLDVariable(name: "$foo", value: 10))
            .setVariable(CLDVariable(name: "$foostr", values: ["my", "str", "ing"]))
            .chain()
            .ifCondition(
                CLDConditionExpression.faceCount().greater(then: 2)
                    .and(CLDConditionExpression.pageCount().less(then: 300))
                    .or(string: "!myTag1!").inside(.tags())
                    .and(string: "!myTag2!").notInside(.tags())
                    .and(CLDConditionExpression.width().greaterOrEqual(to: 200))
                    .and(CLDConditionExpression.height().equal(to: "$foo"))
                    .and(CLDConditionExpression.width().notEqual(to: "$foo").multiple(by: 2))
                    .and(CLDConditionExpression.height().less(then: "$foo"))
                    .or(CLDConditionExpression.width().lessOrEqual(to: 500))
                    .and(CLDConditionExpression.illustrationScore().less(then: 0))
                    .and(CLDConditionExpression.currentPageIndex().equal(to: 10))
                    .and(CLDConditionExpression.pageXOffset().less(then: 300))
                    .and(CLDConditionExpression.pageYOffset().less(then: 300))
                    .and(CLDConditionExpression.pageYOffset().notEqual(to: 400))
                    .and(CLDConditionExpression.aspectRatio().greater(then: "3:4"))
                    .and(CLDConditionExpression.initialAspectRatio().greater(then: "3:4"))
                    .and(CLDConditionExpression.height().less(CLDConditionExpression.initialWidth().divide(by: 2).add(by: 1)))
                    .and(CLDConditionExpression.width().less(CLDConditionExpression.initialHeight().subtract(by: "$foo"))))
            .setCrop("scale")
            /* .Width(new Condition("$foo * 200 / faceCount")) */
            .setOverlay("$foostr")
            .endIf()
        
        XCTAssertEqual(transformationStr, transformation.asString()!)
    }

    func test_TestExpressionsClone()
    {
        let transformationStr = "if_pc_lt_300/c_scale/if_end";
        let expression = CLDConditionExpression.pageCount().less(then: 300)
        
        let transformation = CLDTransformation()
            .ifCondition(expression)
            .setCrop("scale")
            .endIf()
        
        let clone = transformation
        expression.greater(then: 2)
        
        XCTAssertEqual(transformationStr, clone.asString()!)
    }
    
    func test_TestShouldNotChangeVariableNamesWhenTheyNamedAfterKeyword()
    {
        let transformation = CLDTransformation()
            .setVariable(CLDVariable(name: "$width", value: 10))
            .chain()
            .setWidth("$width + 10 + width")
        let sTransform = transformation.asString()!
        
        XCTAssertEqual("$width_10/w_$width_add_10_add_w", sTransform)
    }
    
    func test_TestShouldSupportPowOperator()
    {
        let transformation = CLDTransformation().setVariables([
            CLDVariable(name: "$small", value: 150),
            CLDVariable(name: "$big"  , value: "$small ^ 1.5"),
        ])
        let sTransform = transformation.asString()!
        
        XCTAssertEqual("$small_150,$big_$small_pow_1.5", sTransform)
    }
}
