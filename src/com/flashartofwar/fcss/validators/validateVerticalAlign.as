package com.flashartofwar.fcss.validators
{
    import com.flashartofwar.fcss.enum.CSSProperties;

    /**
     * @private
     * @param value

     *
     */
    public function validateVerticalAlign(value:String):String {
        if (value == CSSProperties.TOP || value == CSSProperties.MIDDLE || value == CSSProperties.BOTTOM) {
            return value;
        } else {
            return null;
        }
    }
}