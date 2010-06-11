package com.flashartofwar.fcss.applicators
{
    public class AbstractApplicator implements IApplicator
    {

        public function AbstractApplicator(self:AbstractApplicator)
        {
            if (self != this)
            {
                throw new Error("AbstractApplicator can not be directly Instantiated");
            }
        }

        public function applyStyle(target:Object, style:Object):void
        {

        }

        /**
         * This allows you to convert the name of a property before
         * it is applied to the target.
         *
         * @param value
         * @return
         */
        protected function propertyFilter(value:String):String
        {
            return value;
        }

        protected function propertyNotFound(name:String):void
        {
            // Does nothing by default
        }

        protected function valueFilter(value:String, type:String):*
        {
            return null;
        }
    }
}