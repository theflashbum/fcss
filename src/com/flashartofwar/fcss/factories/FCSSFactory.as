package com.flashartofwar.fcss.factories
{
    import com.flashartofwar.fcss.applicators.IApplicator;
    import com.flashartofwar.fcss.stylesheets.IStyleSheet;

    public class FCSSFactory
    {
        private var styleSheet:IStyleSheet;
        private var applicator:IApplicator;

        public function FCSSFactory(styleSheet:IStyleSheet, applicator:IApplicator)
        {
            this.styleSheet = styleSheet;
            this.applicator = applicator;
        }

        public function create(classReference:Class, styleID:String, styleClass:String):*
        {
            return new classReference();
        }
    }
}