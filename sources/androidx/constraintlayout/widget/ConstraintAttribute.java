package androidx.constraintlayout.widget;

import android.content.Context;
import android.content.res.TypedArray;
import android.content.res.XmlResourceParser;
import android.util.TypedValue;
import android.util.Xml;
import androidx.slice.compat.SliceProviderCompat$2;
import com.android.systemui.unfold.updates.hinge.HingeAngleProviderKt;
import java.util.HashMap;
/* loaded from: classes.dex */
public final class ConstraintAttribute {
    public boolean mBooleanValue;
    public int mColorValue;
    public float mFloatValue;
    public int mIntegerValue;
    public String mStringValue;
    public AttributeType mType;

    /* loaded from: classes.dex */
    public enum AttributeType {
        INT_TYPE,
        FLOAT_TYPE,
        COLOR_TYPE,
        COLOR_DRAWABLE_TYPE,
        STRING_TYPE,
        BOOLEAN_TYPE,
        DIMENSION_TYPE
    }

    public ConstraintAttribute(String str, AttributeType attributeType, Object obj) {
        this.mType = attributeType;
        setValue(obj);
    }

    public static void parse(Context context, XmlResourceParser xmlResourceParser, HashMap hashMap) {
        Object obj;
        AttributeType attributeType;
        AttributeType attributeType2 = AttributeType.DIMENSION_TYPE;
        TypedArray obtainStyledAttributes = context.obtainStyledAttributes(Xml.asAttributeSet(xmlResourceParser), SliceProviderCompat$2.CustomAttribute);
        int indexCount = obtainStyledAttributes.getIndexCount();
        String str = null;
        Object obj2 = null;
        AttributeType attributeType3 = null;
        for (int i = 0; i < indexCount; i++) {
            int index = obtainStyledAttributes.getIndex(i);
            if (index == 0) {
                str = obtainStyledAttributes.getString(index);
                if (str != null && str.length() > 0) {
                    str = Character.toUpperCase(str.charAt(0)) + str.substring(1);
                }
            } else if (index == 1) {
                obj2 = Boolean.valueOf(obtainStyledAttributes.getBoolean(index, false));
                attributeType3 = AttributeType.BOOLEAN_TYPE;
            } else {
                if (index == 3) {
                    attributeType = AttributeType.COLOR_TYPE;
                    obj = Integer.valueOf(obtainStyledAttributes.getColor(index, 0));
                } else if (index == 2) {
                    attributeType = AttributeType.COLOR_DRAWABLE_TYPE;
                    obj = Integer.valueOf(obtainStyledAttributes.getColor(index, 0));
                } else {
                    if (index == 7) {
                        obj2 = Float.valueOf(TypedValue.applyDimension(1, obtainStyledAttributes.getDimension(index, HingeAngleProviderKt.FULLY_CLOSED_DEGREES), context.getResources().getDisplayMetrics()));
                    } else if (index == 4) {
                        obj2 = Float.valueOf(obtainStyledAttributes.getDimension(index, HingeAngleProviderKt.FULLY_CLOSED_DEGREES));
                    } else if (index == 5) {
                        attributeType = AttributeType.FLOAT_TYPE;
                        obj = Float.valueOf(obtainStyledAttributes.getFloat(index, Float.NaN));
                    } else if (index == 6) {
                        attributeType = AttributeType.INT_TYPE;
                        obj = Integer.valueOf(obtainStyledAttributes.getInteger(index, -1));
                    } else if (index == 8) {
                        attributeType = AttributeType.STRING_TYPE;
                        obj = obtainStyledAttributes.getString(index);
                    }
                    attributeType3 = attributeType2;
                }
                Object obj3 = obj;
                attributeType3 = attributeType;
                obj2 = obj3;
            }
        }
        if (!(str == null || obj2 == null)) {
            hashMap.put(str, new ConstraintAttribute(str, attributeType3, obj2));
        }
        obtainStyledAttributes.recycle();
    }

    public final void setValue(Object obj) {
        switch (this.mType.ordinal()) {
            case 0:
                this.mIntegerValue = ((Integer) obj).intValue();
                return;
            case 1:
                this.mFloatValue = ((Float) obj).floatValue();
                return;
            case 2:
            case 3:
                this.mColorValue = ((Integer) obj).intValue();
                return;
            case 4:
                this.mStringValue = (String) obj;
                return;
            case 5:
                this.mBooleanValue = ((Boolean) obj).booleanValue();
                return;
            case 6:
                this.mFloatValue = ((Float) obj).floatValue();
                return;
            default:
                return;
        }
    }

    public ConstraintAttribute(ConstraintAttribute constraintAttribute, Object obj) {
        constraintAttribute.getClass();
        this.mType = constraintAttribute.mType;
        setValue(obj);
    }
}
