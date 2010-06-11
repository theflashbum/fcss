package com.flashartofwar
{
    import com.flashartofwar.fcss.applicators.TextFieldApplicatorTest;
    import com.flashartofwar.fcss.behaviors.ApplyStyleBehaviorTest;
    import com.flashartofwar.fcss.factories.TextFieldFactoryTest;
    import com.flashartofwar.fcss.objects.PropertyMapObjectTest;
    import com.flashartofwar.fcss.styles.StyleTest;
    import com.flashartofwar.fcss.stylesheets.StyleSheetCollectionMultipleStyleSheetMergeTest;
    import com.flashartofwar.fcss.stylesheets.StyleSheetCollectionTest;
    import com.flashartofwar.fcss.stylesheets.StyleSheetEmptySelectorTest;
    import com.flashartofwar.fcss.stylesheets.StyleSheetTest;
    import com.flashartofwar.fcss.utils.CSSTidyUtilTest;
    import com.flashartofwar.fcss.utils.PropertyMapUtilTest;
    import com.flashartofwar.fcss.utils.TypeHelperUtilTest;

    [Suite]
    [RunWith("org.flexunit.runners.Suite")]
    public class FCSSTestSuite
    {
        public var test1:ApplyStyleBehaviorTest;
        public var test2:TextFieldFactoryTest;
        public var test3:PropertyMapObjectTest;
        public var test4:StyleTest;
        public var test5:StyleSheetCollectionTest;
        public var test6:StyleSheetCollectionMultipleStyleSheetMergeTest;
        public var test7:StyleSheetTest;
        public var test8:CSSTidyUtilTest;
        public var test9:TextFieldFactoryTest;
        public var test10:TypeHelperUtilTest;
        public var test11:StyleSheetEmptySelectorTest;
        public var test12:PropertyMapUtilTest;
        public var test13:TextFieldApplicatorTest;
    }
}