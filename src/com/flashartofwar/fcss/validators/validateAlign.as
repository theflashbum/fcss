package com.flashartofwar.fcss.validators
{
    import com.flashartofwar.fcss.enum.CSSProperties;

    /**
     *
     * @param value

     *
     */
    public function validateAlign(value:String):String {
        if (value == CSSProperties.LEFT || value == CSSProperties.CENTER || value == CSSProperties.RIGHT) {
            return value;
        } else {
            return null;
        }
    }
}