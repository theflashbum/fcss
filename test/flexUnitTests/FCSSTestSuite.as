package flexUnitTests
{
	import flexunit.framework.TestSuite;

	public class FCSSTestSuite extends TestSuite
	{
		public function FCSSTestSuite(param:Object=null)
		{
			super(param);
		}

		/**
		 *
		 * @return
		 *
		 */
		public static function suite():TestSuite
		{
			var newTestSuite:TestSuite = new TestSuite();
			newTestSuite.addTestSuite(flexUnitTests.StyleSheetTest);
			newTestSuite.addTestSuite(flexUnitTests.CSSTidyUtilTest);
			newTestSuite.addTestSuite(flexUnitTests.TypeHelperUtilTest);
			newTestSuite.addTestSuite(flexUnitTests.StyleTest);
			newTestSuite.addTestSuite(flexUnitTests.PropertyMapObjectTest);
			newTestSuite.addTestSuite(flexUnitTests.StyleSheetCollectionTest);
			newTestSuite.addTestSuite(flexUnitTests.StyleApplierUtilTest);
			newTestSuite.addTestSuite(flexUnitTests.TextFieldUtilTest);
			return newTestSuite;
		}
	}
}

