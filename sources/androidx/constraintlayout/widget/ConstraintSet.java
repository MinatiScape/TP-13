package androidx.constraintlayout.widget;

import android.content.Context;
import android.content.res.TypedArray;
import android.content.res.XmlResourceParser;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import android.util.AttributeSet;
import android.util.Log;
import android.util.SparseIntArray;
import android.util.Xml;
import android.view.View;
import android.view.ViewGroup;
import androidx.appcompat.R$id;
import androidx.appcompat.view.SupportMenuInflater$$ExternalSyntheticOutline0;
import androidx.constraintlayout.solver.widgets.Barrier;
import androidx.constraintlayout.widget.ConstraintLayout;
import androidx.constraintlayout.widget.Constraints;
import androidx.slice.SliceSpecs;
import androidx.slice.compat.SliceProviderCompat$2;
import com.android.systemui.flags.FlagManager;
import com.android.systemui.unfold.updates.hinge.HingeAngleProviderKt;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import org.xmlpull.v1.XmlPullParserException;
/* loaded from: classes.dex */
public final class ConstraintSet {
    public static final int[] VISIBILITY_FLAGS = {0, 4, 8};
    public static SparseIntArray mapToConstant;
    public HashMap<String, ConstraintAttribute> mSavedAttributes = new HashMap<>();
    public boolean mForceId = true;
    public HashMap<Integer, Constraint> mConstraints = new HashMap<>();

    /* loaded from: classes.dex */
    public static class Constraint {
        public int mViewId;
        public final PropertySet propertySet = new PropertySet();
        public final Motion motion = new Motion();
        public final Layout layout = new Layout();
        public final Transform transform = new Transform();
        public HashMap<String, ConstraintAttribute> mCustomConstraints = new HashMap<>();

        public final void applyTo(ConstraintLayout.LayoutParams layoutParams) {
            Layout layout = this.layout;
            layoutParams.leftToLeft = layout.leftToLeft;
            layoutParams.leftToRight = layout.leftToRight;
            layoutParams.rightToLeft = layout.rightToLeft;
            layoutParams.rightToRight = layout.rightToRight;
            layoutParams.topToTop = layout.topToTop;
            layoutParams.topToBottom = layout.topToBottom;
            layoutParams.bottomToTop = layout.bottomToTop;
            layoutParams.bottomToBottom = layout.bottomToBottom;
            layoutParams.baselineToBaseline = layout.baselineToBaseline;
            layoutParams.startToEnd = layout.startToEnd;
            layoutParams.startToStart = layout.startToStart;
            layoutParams.endToStart = layout.endToStart;
            layoutParams.endToEnd = layout.endToEnd;
            ((ViewGroup.MarginLayoutParams) layoutParams).leftMargin = layout.leftMargin;
            ((ViewGroup.MarginLayoutParams) layoutParams).rightMargin = layout.rightMargin;
            ((ViewGroup.MarginLayoutParams) layoutParams).topMargin = layout.topMargin;
            ((ViewGroup.MarginLayoutParams) layoutParams).bottomMargin = layout.bottomMargin;
            layoutParams.goneStartMargin = layout.goneStartMargin;
            layoutParams.goneEndMargin = layout.goneEndMargin;
            layoutParams.goneTopMargin = layout.goneTopMargin;
            layoutParams.goneBottomMargin = layout.goneBottomMargin;
            layoutParams.horizontalBias = layout.horizontalBias;
            layoutParams.verticalBias = layout.verticalBias;
            layoutParams.circleConstraint = layout.circleConstraint;
            layoutParams.circleRadius = layout.circleRadius;
            layoutParams.circleAngle = layout.circleAngle;
            layoutParams.dimensionRatio = layout.dimensionRatio;
            layoutParams.editorAbsoluteX = layout.editorAbsoluteX;
            layoutParams.editorAbsoluteY = layout.editorAbsoluteY;
            layoutParams.verticalWeight = layout.verticalWeight;
            layoutParams.horizontalWeight = layout.horizontalWeight;
            layoutParams.verticalChainStyle = layout.verticalChainStyle;
            layoutParams.horizontalChainStyle = layout.horizontalChainStyle;
            layoutParams.constrainedWidth = layout.constrainedWidth;
            layoutParams.constrainedHeight = layout.constrainedHeight;
            layoutParams.matchConstraintDefaultWidth = layout.widthDefault;
            layoutParams.matchConstraintDefaultHeight = layout.heightDefault;
            layoutParams.matchConstraintMaxWidth = layout.widthMax;
            layoutParams.matchConstraintMaxHeight = layout.heightMax;
            layoutParams.matchConstraintMinWidth = layout.widthMin;
            layoutParams.matchConstraintMinHeight = layout.heightMin;
            layoutParams.matchConstraintPercentWidth = layout.widthPercent;
            layoutParams.matchConstraintPercentHeight = layout.heightPercent;
            layoutParams.orientation = layout.orientation;
            layoutParams.guidePercent = layout.guidePercent;
            layoutParams.guideBegin = layout.guideBegin;
            layoutParams.guideEnd = layout.guideEnd;
            ((ViewGroup.MarginLayoutParams) layoutParams).width = layout.mWidth;
            ((ViewGroup.MarginLayoutParams) layoutParams).height = layout.mHeight;
            String str = layout.mConstraintTag;
            if (str != null) {
                layoutParams.constraintTag = str;
            }
            layoutParams.setMarginStart(layout.startMargin);
            layoutParams.setMarginEnd(this.layout.endMargin);
            layoutParams.validate();
        }

        public final Object clone() throws CloneNotSupportedException {
            Constraint constraint = new Constraint();
            Layout layout = constraint.layout;
            Layout layout2 = this.layout;
            layout.getClass();
            layout.mIsGuideline = layout2.mIsGuideline;
            layout.mWidth = layout2.mWidth;
            layout.mHeight = layout2.mHeight;
            layout.guideBegin = layout2.guideBegin;
            layout.guideEnd = layout2.guideEnd;
            layout.guidePercent = layout2.guidePercent;
            layout.leftToLeft = layout2.leftToLeft;
            layout.leftToRight = layout2.leftToRight;
            layout.rightToLeft = layout2.rightToLeft;
            layout.rightToRight = layout2.rightToRight;
            layout.topToTop = layout2.topToTop;
            layout.topToBottom = layout2.topToBottom;
            layout.bottomToTop = layout2.bottomToTop;
            layout.bottomToBottom = layout2.bottomToBottom;
            layout.baselineToBaseline = layout2.baselineToBaseline;
            layout.startToEnd = layout2.startToEnd;
            layout.startToStart = layout2.startToStart;
            layout.endToStart = layout2.endToStart;
            layout.endToEnd = layout2.endToEnd;
            layout.horizontalBias = layout2.horizontalBias;
            layout.verticalBias = layout2.verticalBias;
            layout.dimensionRatio = layout2.dimensionRatio;
            layout.circleConstraint = layout2.circleConstraint;
            layout.circleRadius = layout2.circleRadius;
            layout.circleAngle = layout2.circleAngle;
            layout.editorAbsoluteX = layout2.editorAbsoluteX;
            layout.editorAbsoluteY = layout2.editorAbsoluteY;
            layout.orientation = layout2.orientation;
            layout.leftMargin = layout2.leftMargin;
            layout.rightMargin = layout2.rightMargin;
            layout.topMargin = layout2.topMargin;
            layout.bottomMargin = layout2.bottomMargin;
            layout.endMargin = layout2.endMargin;
            layout.startMargin = layout2.startMargin;
            layout.goneLeftMargin = layout2.goneLeftMargin;
            layout.goneTopMargin = layout2.goneTopMargin;
            layout.goneRightMargin = layout2.goneRightMargin;
            layout.goneBottomMargin = layout2.goneBottomMargin;
            layout.goneEndMargin = layout2.goneEndMargin;
            layout.goneStartMargin = layout2.goneStartMargin;
            layout.verticalWeight = layout2.verticalWeight;
            layout.horizontalWeight = layout2.horizontalWeight;
            layout.horizontalChainStyle = layout2.horizontalChainStyle;
            layout.verticalChainStyle = layout2.verticalChainStyle;
            layout.widthDefault = layout2.widthDefault;
            layout.heightDefault = layout2.heightDefault;
            layout.widthMax = layout2.widthMax;
            layout.heightMax = layout2.heightMax;
            layout.widthMin = layout2.widthMin;
            layout.heightMin = layout2.heightMin;
            layout.widthPercent = layout2.widthPercent;
            layout.heightPercent = layout2.heightPercent;
            layout.mBarrierDirection = layout2.mBarrierDirection;
            layout.mBarrierMargin = layout2.mBarrierMargin;
            layout.mHelperType = layout2.mHelperType;
            layout.mConstraintTag = layout2.mConstraintTag;
            int[] iArr = layout2.mReferenceIds;
            if (iArr != null) {
                layout.mReferenceIds = Arrays.copyOf(iArr, iArr.length);
            } else {
                layout.mReferenceIds = null;
            }
            layout.mReferenceIdString = layout2.mReferenceIdString;
            layout.constrainedWidth = layout2.constrainedWidth;
            layout.constrainedHeight = layout2.constrainedHeight;
            layout.mBarrierAllowsGoneWidgets = layout2.mBarrierAllowsGoneWidgets;
            Motion motion = constraint.motion;
            Motion motion2 = this.motion;
            motion.getClass();
            motion2.getClass();
            motion.mAnimateRelativeTo = motion2.mAnimateRelativeTo;
            motion.mPathMotionArc = motion2.mPathMotionArc;
            motion.mPathRotate = motion2.mPathRotate;
            motion.mMotionStagger = motion2.mMotionStagger;
            PropertySet propertySet = constraint.propertySet;
            PropertySet propertySet2 = this.propertySet;
            propertySet.getClass();
            propertySet2.getClass();
            propertySet.visibility = propertySet2.visibility;
            propertySet.alpha = propertySet2.alpha;
            propertySet.mProgress = propertySet2.mProgress;
            propertySet.mVisibilityMode = propertySet2.mVisibilityMode;
            Transform transform = constraint.transform;
            Transform transform2 = this.transform;
            transform.getClass();
            transform2.getClass();
            transform.rotation = transform2.rotation;
            transform.rotationX = transform2.rotationX;
            transform.rotationY = transform2.rotationY;
            transform.scaleX = transform2.scaleX;
            transform.scaleY = transform2.scaleY;
            transform.transformPivotX = transform2.transformPivotX;
            transform.transformPivotY = transform2.transformPivotY;
            transform.translationX = transform2.translationX;
            transform.translationY = transform2.translationY;
            transform.translationZ = transform2.translationZ;
            transform.applyElevation = transform2.applyElevation;
            transform.elevation = transform2.elevation;
            constraint.mViewId = this.mViewId;
            return constraint;
        }

        public final void fillFrom(int i, ConstraintLayout.LayoutParams layoutParams) {
            this.mViewId = i;
            Layout layout = this.layout;
            layout.leftToLeft = layoutParams.leftToLeft;
            layout.leftToRight = layoutParams.leftToRight;
            layout.rightToLeft = layoutParams.rightToLeft;
            layout.rightToRight = layoutParams.rightToRight;
            layout.topToTop = layoutParams.topToTop;
            layout.topToBottom = layoutParams.topToBottom;
            layout.bottomToTop = layoutParams.bottomToTop;
            layout.bottomToBottom = layoutParams.bottomToBottom;
            layout.baselineToBaseline = layoutParams.baselineToBaseline;
            layout.startToEnd = layoutParams.startToEnd;
            layout.startToStart = layoutParams.startToStart;
            layout.endToStart = layoutParams.endToStart;
            layout.endToEnd = layoutParams.endToEnd;
            layout.horizontalBias = layoutParams.horizontalBias;
            layout.verticalBias = layoutParams.verticalBias;
            layout.dimensionRatio = layoutParams.dimensionRatio;
            layout.circleConstraint = layoutParams.circleConstraint;
            layout.circleRadius = layoutParams.circleRadius;
            layout.circleAngle = layoutParams.circleAngle;
            layout.editorAbsoluteX = layoutParams.editorAbsoluteX;
            layout.editorAbsoluteY = layoutParams.editorAbsoluteY;
            layout.orientation = layoutParams.orientation;
            layout.guidePercent = layoutParams.guidePercent;
            layout.guideBegin = layoutParams.guideBegin;
            layout.guideEnd = layoutParams.guideEnd;
            layout.mWidth = ((ViewGroup.MarginLayoutParams) layoutParams).width;
            layout.mHeight = ((ViewGroup.MarginLayoutParams) layoutParams).height;
            layout.leftMargin = ((ViewGroup.MarginLayoutParams) layoutParams).leftMargin;
            layout.rightMargin = ((ViewGroup.MarginLayoutParams) layoutParams).rightMargin;
            layout.topMargin = ((ViewGroup.MarginLayoutParams) layoutParams).topMargin;
            layout.bottomMargin = ((ViewGroup.MarginLayoutParams) layoutParams).bottomMargin;
            layout.verticalWeight = layoutParams.verticalWeight;
            layout.horizontalWeight = layoutParams.horizontalWeight;
            layout.verticalChainStyle = layoutParams.verticalChainStyle;
            layout.horizontalChainStyle = layoutParams.horizontalChainStyle;
            layout.constrainedWidth = layoutParams.constrainedWidth;
            layout.constrainedHeight = layoutParams.constrainedHeight;
            layout.widthDefault = layoutParams.matchConstraintDefaultWidth;
            layout.heightDefault = layoutParams.matchConstraintDefaultHeight;
            layout.widthMax = layoutParams.matchConstraintMaxWidth;
            layout.heightMax = layoutParams.matchConstraintMaxHeight;
            layout.widthMin = layoutParams.matchConstraintMinWidth;
            layout.heightMin = layoutParams.matchConstraintMinHeight;
            layout.widthPercent = layoutParams.matchConstraintPercentWidth;
            layout.heightPercent = layoutParams.matchConstraintPercentHeight;
            layout.mConstraintTag = layoutParams.constraintTag;
            layout.goneTopMargin = layoutParams.goneTopMargin;
            layout.goneBottomMargin = layoutParams.goneBottomMargin;
            layout.goneLeftMargin = layoutParams.goneLeftMargin;
            layout.goneRightMargin = layoutParams.goneRightMargin;
            layout.goneStartMargin = layoutParams.goneStartMargin;
            layout.goneEndMargin = layoutParams.goneEndMargin;
            layout.endMargin = layoutParams.getMarginEnd();
            this.layout.startMargin = layoutParams.getMarginStart();
        }

        public final void fillFromConstraints(int i, Constraints.LayoutParams layoutParams) {
            fillFrom(i, layoutParams);
            this.propertySet.alpha = layoutParams.alpha;
            Transform transform = this.transform;
            transform.rotation = layoutParams.rotation;
            transform.rotationX = layoutParams.rotationX;
            transform.rotationY = layoutParams.rotationY;
            transform.scaleX = layoutParams.scaleX;
            transform.scaleY = layoutParams.scaleY;
            transform.transformPivotX = layoutParams.transformPivotX;
            transform.transformPivotY = layoutParams.transformPivotY;
            transform.translationX = layoutParams.translationX;
            transform.translationY = layoutParams.translationY;
            transform.translationZ = layoutParams.translationZ;
            transform.elevation = layoutParams.elevation;
            transform.applyElevation = layoutParams.applyElevation;
        }
    }

    /* loaded from: classes.dex */
    public static class Layout {
        public static SparseIntArray mapToConstant;
        public String mConstraintTag;
        public int mHeight;
        public String mReferenceIdString;
        public int[] mReferenceIds;
        public int mWidth;
        public boolean mIsGuideline = false;
        public int guideBegin = -1;
        public int guideEnd = -1;
        public float guidePercent = -1.0f;
        public int leftToLeft = -1;
        public int leftToRight = -1;
        public int rightToLeft = -1;
        public int rightToRight = -1;
        public int topToTop = -1;
        public int topToBottom = -1;
        public int bottomToTop = -1;
        public int bottomToBottom = -1;
        public int baselineToBaseline = -1;
        public int startToEnd = -1;
        public int startToStart = -1;
        public int endToStart = -1;
        public int endToEnd = -1;
        public float horizontalBias = 0.5f;
        public float verticalBias = 0.5f;
        public String dimensionRatio = null;
        public int circleConstraint = -1;
        public int circleRadius = 0;
        public float circleAngle = HingeAngleProviderKt.FULLY_CLOSED_DEGREES;
        public int editorAbsoluteX = -1;
        public int editorAbsoluteY = -1;
        public int orientation = -1;
        public int leftMargin = -1;
        public int rightMargin = -1;
        public int topMargin = -1;
        public int bottomMargin = -1;
        public int endMargin = -1;
        public int startMargin = -1;
        public int goneLeftMargin = -1;
        public int goneTopMargin = -1;
        public int goneRightMargin = -1;
        public int goneBottomMargin = -1;
        public int goneEndMargin = -1;
        public int goneStartMargin = -1;
        public float verticalWeight = -1.0f;
        public float horizontalWeight = -1.0f;
        public int horizontalChainStyle = 0;
        public int verticalChainStyle = 0;
        public int widthDefault = 0;
        public int heightDefault = 0;
        public int widthMax = -1;
        public int heightMax = -1;
        public int widthMin = -1;
        public int heightMin = -1;
        public float widthPercent = 1.0f;
        public float heightPercent = 1.0f;
        public int mBarrierDirection = -1;
        public int mBarrierMargin = 0;
        public int mHelperType = -1;
        public boolean constrainedWidth = false;
        public boolean constrainedHeight = false;
        public boolean mBarrierAllowsGoneWidgets = true;

        static {
            SparseIntArray sparseIntArray = new SparseIntArray();
            mapToConstant = sparseIntArray;
            sparseIntArray.append(38, 24);
            mapToConstant.append(39, 25);
            mapToConstant.append(41, 28);
            mapToConstant.append(42, 29);
            mapToConstant.append(47, 35);
            mapToConstant.append(46, 34);
            mapToConstant.append(20, 4);
            mapToConstant.append(19, 3);
            mapToConstant.append(17, 1);
            mapToConstant.append(55, 6);
            mapToConstant.append(56, 7);
            mapToConstant.append(27, 17);
            mapToConstant.append(28, 18);
            mapToConstant.append(29, 19);
            mapToConstant.append(0, 26);
            mapToConstant.append(43, 31);
            mapToConstant.append(44, 32);
            mapToConstant.append(26, 10);
            mapToConstant.append(25, 9);
            mapToConstant.append(59, 13);
            mapToConstant.append(62, 16);
            mapToConstant.append(60, 14);
            mapToConstant.append(57, 11);
            mapToConstant.append(61, 15);
            mapToConstant.append(58, 12);
            mapToConstant.append(50, 38);
            mapToConstant.append(36, 37);
            mapToConstant.append(35, 39);
            mapToConstant.append(49, 40);
            mapToConstant.append(34, 20);
            mapToConstant.append(48, 36);
            mapToConstant.append(24, 5);
            mapToConstant.append(37, 76);
            mapToConstant.append(45, 76);
            mapToConstant.append(40, 76);
            mapToConstant.append(18, 76);
            mapToConstant.append(16, 76);
            mapToConstant.append(3, 23);
            mapToConstant.append(5, 27);
            mapToConstant.append(7, 30);
            mapToConstant.append(8, 8);
            mapToConstant.append(4, 33);
            mapToConstant.append(6, 2);
            mapToConstant.append(1, 22);
            mapToConstant.append(2, 21);
            mapToConstant.append(21, 61);
            mapToConstant.append(23, 62);
            mapToConstant.append(22, 63);
            mapToConstant.append(54, 69);
            mapToConstant.append(33, 70);
            mapToConstant.append(12, 71);
            mapToConstant.append(10, 72);
            mapToConstant.append(11, 73);
            mapToConstant.append(13, 74);
            mapToConstant.append(9, 75);
        }

        public final void fillFromAttributeList(Context context, AttributeSet attributeSet) {
            TypedArray obtainStyledAttributes = context.obtainStyledAttributes(attributeSet, SliceProviderCompat$2.Layout);
            int indexCount = obtainStyledAttributes.getIndexCount();
            for (int i = 0; i < indexCount; i++) {
                int index = obtainStyledAttributes.getIndex(i);
                int i2 = mapToConstant.get(index);
                if (i2 == 80) {
                    this.constrainedWidth = obtainStyledAttributes.getBoolean(index, this.constrainedWidth);
                } else if (i2 != 81) {
                    switch (i2) {
                        case 1:
                            this.baselineToBaseline = ConstraintSet.lookupID(obtainStyledAttributes, index, this.baselineToBaseline);
                            continue;
                        case 2:
                            this.bottomMargin = obtainStyledAttributes.getDimensionPixelSize(index, this.bottomMargin);
                            continue;
                        case 3:
                            this.bottomToBottom = ConstraintSet.lookupID(obtainStyledAttributes, index, this.bottomToBottom);
                            continue;
                        case 4:
                            this.bottomToTop = ConstraintSet.lookupID(obtainStyledAttributes, index, this.bottomToTop);
                            continue;
                        case 5:
                            this.dimensionRatio = obtainStyledAttributes.getString(index);
                            continue;
                        case 6:
                            this.editorAbsoluteX = obtainStyledAttributes.getDimensionPixelOffset(index, this.editorAbsoluteX);
                            continue;
                        case 7:
                            this.editorAbsoluteY = obtainStyledAttributes.getDimensionPixelOffset(index, this.editorAbsoluteY);
                            continue;
                        case 8:
                            this.endMargin = obtainStyledAttributes.getDimensionPixelSize(index, this.endMargin);
                            continue;
                        case 9:
                            this.endToEnd = ConstraintSet.lookupID(obtainStyledAttributes, index, this.endToEnd);
                            continue;
                        case 10:
                            this.endToStart = ConstraintSet.lookupID(obtainStyledAttributes, index, this.endToStart);
                            continue;
                        case 11:
                            this.goneBottomMargin = obtainStyledAttributes.getDimensionPixelSize(index, this.goneBottomMargin);
                            continue;
                        case 12:
                            this.goneEndMargin = obtainStyledAttributes.getDimensionPixelSize(index, this.goneEndMargin);
                            continue;
                        case 13:
                            this.goneLeftMargin = obtainStyledAttributes.getDimensionPixelSize(index, this.goneLeftMargin);
                            continue;
                        case 14:
                            this.goneRightMargin = obtainStyledAttributes.getDimensionPixelSize(index, this.goneRightMargin);
                            continue;
                        case 15:
                            this.goneStartMargin = obtainStyledAttributes.getDimensionPixelSize(index, this.goneStartMargin);
                            continue;
                        case 16:
                            this.goneTopMargin = obtainStyledAttributes.getDimensionPixelSize(index, this.goneTopMargin);
                            continue;
                        case 17:
                            this.guideBegin = obtainStyledAttributes.getDimensionPixelOffset(index, this.guideBegin);
                            continue;
                        case 18:
                            this.guideEnd = obtainStyledAttributes.getDimensionPixelOffset(index, this.guideEnd);
                            continue;
                        case 19:
                            this.guidePercent = obtainStyledAttributes.getFloat(index, this.guidePercent);
                            continue;
                        case 20:
                            this.horizontalBias = obtainStyledAttributes.getFloat(index, this.horizontalBias);
                            continue;
                        case 21:
                            this.mHeight = obtainStyledAttributes.getLayoutDimension(index, this.mHeight);
                            continue;
                        case 22:
                            this.mWidth = obtainStyledAttributes.getLayoutDimension(index, this.mWidth);
                            continue;
                        case 23:
                            this.leftMargin = obtainStyledAttributes.getDimensionPixelSize(index, this.leftMargin);
                            continue;
                        case 24:
                            this.leftToLeft = ConstraintSet.lookupID(obtainStyledAttributes, index, this.leftToLeft);
                            continue;
                        case 25:
                            this.leftToRight = ConstraintSet.lookupID(obtainStyledAttributes, index, this.leftToRight);
                            continue;
                        case 26:
                            this.orientation = obtainStyledAttributes.getInt(index, this.orientation);
                            continue;
                        case 27:
                            this.rightMargin = obtainStyledAttributes.getDimensionPixelSize(index, this.rightMargin);
                            continue;
                        case 28:
                            this.rightToLeft = ConstraintSet.lookupID(obtainStyledAttributes, index, this.rightToLeft);
                            continue;
                        case 29:
                            this.rightToRight = ConstraintSet.lookupID(obtainStyledAttributes, index, this.rightToRight);
                            continue;
                        case 30:
                            this.startMargin = obtainStyledAttributes.getDimensionPixelSize(index, this.startMargin);
                            continue;
                        case 31:
                            this.startToEnd = ConstraintSet.lookupID(obtainStyledAttributes, index, this.startToEnd);
                            continue;
                        case 32:
                            this.startToStart = ConstraintSet.lookupID(obtainStyledAttributes, index, this.startToStart);
                            continue;
                        case 33:
                            this.topMargin = obtainStyledAttributes.getDimensionPixelSize(index, this.topMargin);
                            continue;
                        case 34:
                            this.topToBottom = ConstraintSet.lookupID(obtainStyledAttributes, index, this.topToBottom);
                            continue;
                        case 35:
                            this.topToTop = ConstraintSet.lookupID(obtainStyledAttributes, index, this.topToTop);
                            continue;
                        case 36:
                            this.verticalBias = obtainStyledAttributes.getFloat(index, this.verticalBias);
                            continue;
                        case 37:
                            this.horizontalWeight = obtainStyledAttributes.getFloat(index, this.horizontalWeight);
                            continue;
                        case 38:
                            this.verticalWeight = obtainStyledAttributes.getFloat(index, this.verticalWeight);
                            continue;
                        case 39:
                            this.horizontalChainStyle = obtainStyledAttributes.getInt(index, this.horizontalChainStyle);
                            continue;
                        case 40:
                            this.verticalChainStyle = obtainStyledAttributes.getInt(index, this.verticalChainStyle);
                            continue;
                        default:
                            switch (i2) {
                                case 54:
                                    this.widthDefault = obtainStyledAttributes.getInt(index, this.widthDefault);
                                    continue;
                                case 55:
                                    this.heightDefault = obtainStyledAttributes.getInt(index, this.heightDefault);
                                    continue;
                                case 56:
                                    this.widthMax = obtainStyledAttributes.getDimensionPixelSize(index, this.widthMax);
                                    continue;
                                case 57:
                                    this.heightMax = obtainStyledAttributes.getDimensionPixelSize(index, this.heightMax);
                                    continue;
                                case 58:
                                    this.widthMin = obtainStyledAttributes.getDimensionPixelSize(index, this.widthMin);
                                    continue;
                                case 59:
                                    this.heightMin = obtainStyledAttributes.getDimensionPixelSize(index, this.heightMin);
                                    continue;
                                default:
                                    switch (i2) {
                                        case 61:
                                            this.circleConstraint = ConstraintSet.lookupID(obtainStyledAttributes, index, this.circleConstraint);
                                            continue;
                                        case 62:
                                            this.circleRadius = obtainStyledAttributes.getDimensionPixelSize(index, this.circleRadius);
                                            continue;
                                        case 63:
                                            this.circleAngle = obtainStyledAttributes.getFloat(index, this.circleAngle);
                                            continue;
                                        default:
                                            switch (i2) {
                                                case 69:
                                                    this.widthPercent = obtainStyledAttributes.getFloat(index, 1.0f);
                                                    continue;
                                                case 70:
                                                    this.heightPercent = obtainStyledAttributes.getFloat(index, 1.0f);
                                                    continue;
                                                case 71:
                                                    Log.e("ConstraintSet", "CURRENTLY UNSUPPORTED");
                                                    continue;
                                                case 72:
                                                    this.mBarrierDirection = obtainStyledAttributes.getInt(index, this.mBarrierDirection);
                                                    continue;
                                                case 73:
                                                    this.mBarrierMargin = obtainStyledAttributes.getDimensionPixelSize(index, this.mBarrierMargin);
                                                    continue;
                                                case 74:
                                                    this.mReferenceIdString = obtainStyledAttributes.getString(index);
                                                    continue;
                                                case 75:
                                                    this.mBarrierAllowsGoneWidgets = obtainStyledAttributes.getBoolean(index, this.mBarrierAllowsGoneWidgets);
                                                    continue;
                                                case 76:
                                                    StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("unused attribute 0x");
                                                    m.append(Integer.toHexString(index));
                                                    m.append("   ");
                                                    m.append(mapToConstant.get(index));
                                                    Log.w("ConstraintSet", m.toString());
                                                    continue;
                                                case 77:
                                                    this.mConstraintTag = obtainStyledAttributes.getString(index);
                                                    continue;
                                                default:
                                                    StringBuilder m2 = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Unknown attribute 0x");
                                                    m2.append(Integer.toHexString(index));
                                                    m2.append("   ");
                                                    m2.append(mapToConstant.get(index));
                                                    Log.w("ConstraintSet", m2.toString());
                                                    continue;
                                                    continue;
                                                    continue;
                                                    continue;
                                            }
                                    }
                            }
                    }
                } else {
                    this.constrainedHeight = obtainStyledAttributes.getBoolean(index, this.constrainedHeight);
                }
            }
            obtainStyledAttributes.recycle();
        }
    }

    /* loaded from: classes.dex */
    public static class Motion {
        public static SparseIntArray mapToConstant;
        public int mAnimateRelativeTo = -1;
        public int mPathMotionArc = -1;
        public float mMotionStagger = Float.NaN;
        public float mPathRotate = Float.NaN;

        static {
            SparseIntArray sparseIntArray = new SparseIntArray();
            mapToConstant = sparseIntArray;
            sparseIntArray.append(2, 1);
            mapToConstant.append(4, 2);
            mapToConstant.append(5, 3);
            mapToConstant.append(1, 4);
            mapToConstant.append(0, 5);
            mapToConstant.append(3, 6);
        }

        public final void fillFromAttributeList(Context context, AttributeSet attributeSet) {
            TypedArray obtainStyledAttributes = context.obtainStyledAttributes(attributeSet, SliceProviderCompat$2.Motion);
            int indexCount = obtainStyledAttributes.getIndexCount();
            for (int i = 0; i < indexCount; i++) {
                int index = obtainStyledAttributes.getIndex(i);
                switch (mapToConstant.get(index)) {
                    case 1:
                        this.mPathRotate = obtainStyledAttributes.getFloat(index, this.mPathRotate);
                        break;
                    case 2:
                        this.mPathMotionArc = obtainStyledAttributes.getInt(index, this.mPathMotionArc);
                        break;
                    case 3:
                        if (obtainStyledAttributes.peekValue(index).type == 3) {
                            obtainStyledAttributes.getString(index);
                            break;
                        } else {
                            String str = R$id.NAMED_EASING[obtainStyledAttributes.getInteger(index, 0)];
                            break;
                        }
                    case 4:
                        obtainStyledAttributes.getInt(index, 0);
                        break;
                    case 5:
                        this.mAnimateRelativeTo = ConstraintSet.lookupID(obtainStyledAttributes, index, this.mAnimateRelativeTo);
                        break;
                    case 6:
                        this.mMotionStagger = obtainStyledAttributes.getFloat(index, this.mMotionStagger);
                        break;
                }
            }
            obtainStyledAttributes.recycle();
        }
    }

    /* loaded from: classes.dex */
    public static class PropertySet {
        public int visibility = 0;
        public int mVisibilityMode = 0;
        public float alpha = 1.0f;
        public float mProgress = Float.NaN;

        public final void fillFromAttributeList(Context context, AttributeSet attributeSet) {
            TypedArray obtainStyledAttributes = context.obtainStyledAttributes(attributeSet, SliceProviderCompat$2.PropertySet);
            int indexCount = obtainStyledAttributes.getIndexCount();
            for (int i = 0; i < indexCount; i++) {
                int index = obtainStyledAttributes.getIndex(i);
                if (index == 1) {
                    this.alpha = obtainStyledAttributes.getFloat(index, this.alpha);
                } else if (index == 0) {
                    int i2 = obtainStyledAttributes.getInt(index, this.visibility);
                    this.visibility = i2;
                    this.visibility = ConstraintSet.VISIBILITY_FLAGS[i2];
                } else if (index == 4) {
                    this.mVisibilityMode = obtainStyledAttributes.getInt(index, this.mVisibilityMode);
                } else if (index == 3) {
                    this.mProgress = obtainStyledAttributes.getFloat(index, this.mProgress);
                }
            }
            obtainStyledAttributes.recycle();
        }
    }

    /* loaded from: classes.dex */
    public static class Transform {
        public static SparseIntArray mapToConstant;
        public float rotation = HingeAngleProviderKt.FULLY_CLOSED_DEGREES;
        public float rotationX = HingeAngleProviderKt.FULLY_CLOSED_DEGREES;
        public float rotationY = HingeAngleProviderKt.FULLY_CLOSED_DEGREES;
        public float scaleX = 1.0f;
        public float scaleY = 1.0f;
        public float transformPivotX = Float.NaN;
        public float transformPivotY = Float.NaN;
        public float translationX = HingeAngleProviderKt.FULLY_CLOSED_DEGREES;
        public float translationY = HingeAngleProviderKt.FULLY_CLOSED_DEGREES;
        public float translationZ = HingeAngleProviderKt.FULLY_CLOSED_DEGREES;
        public boolean applyElevation = false;
        public float elevation = HingeAngleProviderKt.FULLY_CLOSED_DEGREES;

        static {
            SparseIntArray sparseIntArray = new SparseIntArray();
            mapToConstant = sparseIntArray;
            sparseIntArray.append(6, 1);
            mapToConstant.append(7, 2);
            mapToConstant.append(8, 3);
            mapToConstant.append(4, 4);
            mapToConstant.append(5, 5);
            mapToConstant.append(0, 6);
            mapToConstant.append(1, 7);
            mapToConstant.append(2, 8);
            mapToConstant.append(3, 9);
            mapToConstant.append(9, 10);
            mapToConstant.append(10, 11);
        }

        public final void fillFromAttributeList(Context context, AttributeSet attributeSet) {
            TypedArray obtainStyledAttributes = context.obtainStyledAttributes(attributeSet, SliceProviderCompat$2.Transform);
            int indexCount = obtainStyledAttributes.getIndexCount();
            for (int i = 0; i < indexCount; i++) {
                int index = obtainStyledAttributes.getIndex(i);
                switch (mapToConstant.get(index)) {
                    case 1:
                        this.rotation = obtainStyledAttributes.getFloat(index, this.rotation);
                        break;
                    case 2:
                        this.rotationX = obtainStyledAttributes.getFloat(index, this.rotationX);
                        break;
                    case 3:
                        this.rotationY = obtainStyledAttributes.getFloat(index, this.rotationY);
                        break;
                    case 4:
                        this.scaleX = obtainStyledAttributes.getFloat(index, this.scaleX);
                        break;
                    case 5:
                        this.scaleY = obtainStyledAttributes.getFloat(index, this.scaleY);
                        break;
                    case 6:
                        this.transformPivotX = obtainStyledAttributes.getFloat(index, this.transformPivotX);
                        break;
                    case 7:
                        this.transformPivotY = obtainStyledAttributes.getFloat(index, this.transformPivotY);
                        break;
                    case 8:
                        this.translationX = obtainStyledAttributes.getDimension(index, this.translationX);
                        break;
                    case 9:
                        this.translationY = obtainStyledAttributes.getDimension(index, this.translationY);
                        break;
                    case 10:
                        this.translationZ = obtainStyledAttributes.getDimension(index, this.translationZ);
                        break;
                    case 11:
                        this.applyElevation = true;
                        this.elevation = obtainStyledAttributes.getDimension(index, this.elevation);
                        break;
                }
            }
            obtainStyledAttributes.recycle();
        }
    }

    static {
        SparseIntArray sparseIntArray = new SparseIntArray();
        mapToConstant = sparseIntArray;
        sparseIntArray.append(78, 25);
        mapToConstant.append(79, 26);
        mapToConstant.append(81, 29);
        mapToConstant.append(82, 30);
        mapToConstant.append(88, 36);
        mapToConstant.append(87, 35);
        mapToConstant.append(60, 4);
        mapToConstant.append(59, 3);
        mapToConstant.append(57, 1);
        mapToConstant.append(96, 6);
        mapToConstant.append(97, 7);
        mapToConstant.append(67, 17);
        mapToConstant.append(68, 18);
        mapToConstant.append(69, 19);
        mapToConstant.append(0, 27);
        mapToConstant.append(83, 32);
        mapToConstant.append(84, 33);
        mapToConstant.append(66, 10);
        mapToConstant.append(65, 9);
        mapToConstant.append(100, 13);
        mapToConstant.append(103, 16);
        mapToConstant.append(101, 14);
        mapToConstant.append(98, 11);
        mapToConstant.append(102, 15);
        mapToConstant.append(99, 12);
        mapToConstant.append(91, 40);
        mapToConstant.append(76, 39);
        mapToConstant.append(75, 41);
        mapToConstant.append(90, 42);
        mapToConstant.append(74, 20);
        mapToConstant.append(89, 37);
        mapToConstant.append(64, 5);
        mapToConstant.append(77, 82);
        mapToConstant.append(86, 82);
        mapToConstant.append(80, 82);
        mapToConstant.append(58, 82);
        mapToConstant.append(56, 82);
        mapToConstant.append(5, 24);
        mapToConstant.append(7, 28);
        mapToConstant.append(25, 31);
        mapToConstant.append(26, 8);
        mapToConstant.append(6, 34);
        mapToConstant.append(8, 2);
        mapToConstant.append(3, 23);
        mapToConstant.append(4, 21);
        mapToConstant.append(2, 22);
        mapToConstant.append(15, 43);
        mapToConstant.append(28, 44);
        mapToConstant.append(23, 45);
        mapToConstant.append(24, 46);
        mapToConstant.append(22, 60);
        mapToConstant.append(20, 47);
        mapToConstant.append(21, 48);
        mapToConstant.append(16, 49);
        mapToConstant.append(17, 50);
        mapToConstant.append(18, 51);
        mapToConstant.append(19, 52);
        mapToConstant.append(27, 53);
        mapToConstant.append(92, 54);
        mapToConstant.append(70, 55);
        mapToConstant.append(93, 56);
        mapToConstant.append(71, 57);
        mapToConstant.append(94, 58);
        mapToConstant.append(72, 59);
        mapToConstant.append(61, 61);
        mapToConstant.append(63, 62);
        mapToConstant.append(62, 63);
        mapToConstant.append(29, 64);
        mapToConstant.append(108, 65);
        mapToConstant.append(35, 66);
        mapToConstant.append(109, 67);
        mapToConstant.append(104, 79);
        mapToConstant.append(1, 38);
        mapToConstant.append(107, 68);
        mapToConstant.append(95, 69);
        mapToConstant.append(73, 70);
        mapToConstant.append(33, 71);
        mapToConstant.append(31, 72);
        mapToConstant.append(32, 73);
        mapToConstant.append(34, 74);
        mapToConstant.append(30, 75);
        mapToConstant.append(105, 76);
        mapToConstant.append(85, 77);
        mapToConstant.append(110, 78);
        mapToConstant.append(55, 80);
        mapToConstant.append(54, 81);
    }

    public static int[] convertReferenceString(Barrier barrier, String str) {
        int i;
        HashMap<String, Integer> hashMap;
        String[] split = str.split(",");
        Context context = barrier.getContext();
        int[] iArr = new int[split.length];
        int i2 = 0;
        int i3 = 0;
        while (i2 < split.length) {
            String trim = split[i2].trim();
            Integer num = null;
            try {
                i = SliceSpecs.class.getField(trim).getInt(null);
            } catch (Exception unused) {
                i = 0;
            }
            if (i == 0) {
                i = context.getResources().getIdentifier(trim, FlagManager.EXTRA_ID, context.getPackageName());
            }
            if (i == 0 && barrier.isInEditMode() && (barrier.getParent() instanceof ConstraintLayout)) {
                ConstraintLayout constraintLayout = (ConstraintLayout) barrier.getParent();
                constraintLayout.getClass();
                if ((trim instanceof String) && (hashMap = constraintLayout.mDesignIds) != null && hashMap.containsKey(trim)) {
                    num = constraintLayout.mDesignIds.get(trim);
                }
                if (num != null && (num instanceof Integer)) {
                    i = num.intValue();
                }
            }
            iArr[i3] = i;
            i2++;
            i3++;
        }
        if (i3 != split.length) {
            return Arrays.copyOf(iArr, i3);
        }
        return iArr;
    }

    public static Constraint fillFromAttributeList(Context context, AttributeSet attributeSet) {
        Constraint constraint = new Constraint();
        TypedArray obtainStyledAttributes = context.obtainStyledAttributes(attributeSet, SliceProviderCompat$2.Constraint);
        int indexCount = obtainStyledAttributes.getIndexCount();
        for (int i = 0; i < indexCount; i++) {
            int index = obtainStyledAttributes.getIndex(i);
            if (index != 1) {
                constraint.motion.getClass();
                constraint.layout.getClass();
                constraint.propertySet.getClass();
                constraint.transform.getClass();
            }
            switch (mapToConstant.get(index)) {
                case 1:
                    Layout layout = constraint.layout;
                    layout.baselineToBaseline = lookupID(obtainStyledAttributes, index, layout.baselineToBaseline);
                    break;
                case 2:
                    Layout layout2 = constraint.layout;
                    layout2.bottomMargin = obtainStyledAttributes.getDimensionPixelSize(index, layout2.bottomMargin);
                    break;
                case 3:
                    Layout layout3 = constraint.layout;
                    layout3.bottomToBottom = lookupID(obtainStyledAttributes, index, layout3.bottomToBottom);
                    break;
                case 4:
                    Layout layout4 = constraint.layout;
                    layout4.bottomToTop = lookupID(obtainStyledAttributes, index, layout4.bottomToTop);
                    break;
                case 5:
                    constraint.layout.dimensionRatio = obtainStyledAttributes.getString(index);
                    break;
                case 6:
                    Layout layout5 = constraint.layout;
                    layout5.editorAbsoluteX = obtainStyledAttributes.getDimensionPixelOffset(index, layout5.editorAbsoluteX);
                    break;
                case 7:
                    Layout layout6 = constraint.layout;
                    layout6.editorAbsoluteY = obtainStyledAttributes.getDimensionPixelOffset(index, layout6.editorAbsoluteY);
                    break;
                case 8:
                    Layout layout7 = constraint.layout;
                    layout7.endMargin = obtainStyledAttributes.getDimensionPixelSize(index, layout7.endMargin);
                    break;
                case 9:
                    Layout layout8 = constraint.layout;
                    layout8.endToEnd = lookupID(obtainStyledAttributes, index, layout8.endToEnd);
                    break;
                case 10:
                    Layout layout9 = constraint.layout;
                    layout9.endToStart = lookupID(obtainStyledAttributes, index, layout9.endToStart);
                    break;
                case 11:
                    Layout layout10 = constraint.layout;
                    layout10.goneBottomMargin = obtainStyledAttributes.getDimensionPixelSize(index, layout10.goneBottomMargin);
                    break;
                case 12:
                    Layout layout11 = constraint.layout;
                    layout11.goneEndMargin = obtainStyledAttributes.getDimensionPixelSize(index, layout11.goneEndMargin);
                    break;
                case 13:
                    Layout layout12 = constraint.layout;
                    layout12.goneLeftMargin = obtainStyledAttributes.getDimensionPixelSize(index, layout12.goneLeftMargin);
                    break;
                case 14:
                    Layout layout13 = constraint.layout;
                    layout13.goneRightMargin = obtainStyledAttributes.getDimensionPixelSize(index, layout13.goneRightMargin);
                    break;
                case 15:
                    Layout layout14 = constraint.layout;
                    layout14.goneStartMargin = obtainStyledAttributes.getDimensionPixelSize(index, layout14.goneStartMargin);
                    break;
                case 16:
                    Layout layout15 = constraint.layout;
                    layout15.goneTopMargin = obtainStyledAttributes.getDimensionPixelSize(index, layout15.goneTopMargin);
                    break;
                case 17:
                    Layout layout16 = constraint.layout;
                    layout16.guideBegin = obtainStyledAttributes.getDimensionPixelOffset(index, layout16.guideBegin);
                    break;
                case 18:
                    Layout layout17 = constraint.layout;
                    layout17.guideEnd = obtainStyledAttributes.getDimensionPixelOffset(index, layout17.guideEnd);
                    break;
                case 19:
                    Layout layout18 = constraint.layout;
                    layout18.guidePercent = obtainStyledAttributes.getFloat(index, layout18.guidePercent);
                    break;
                case 20:
                    Layout layout19 = constraint.layout;
                    layout19.horizontalBias = obtainStyledAttributes.getFloat(index, layout19.horizontalBias);
                    break;
                case 21:
                    Layout layout20 = constraint.layout;
                    layout20.mHeight = obtainStyledAttributes.getLayoutDimension(index, layout20.mHeight);
                    break;
                case 22:
                    PropertySet propertySet = constraint.propertySet;
                    propertySet.visibility = obtainStyledAttributes.getInt(index, propertySet.visibility);
                    PropertySet propertySet2 = constraint.propertySet;
                    propertySet2.visibility = VISIBILITY_FLAGS[propertySet2.visibility];
                    break;
                case 23:
                    Layout layout21 = constraint.layout;
                    layout21.mWidth = obtainStyledAttributes.getLayoutDimension(index, layout21.mWidth);
                    break;
                case 24:
                    Layout layout22 = constraint.layout;
                    layout22.leftMargin = obtainStyledAttributes.getDimensionPixelSize(index, layout22.leftMargin);
                    break;
                case 25:
                    Layout layout23 = constraint.layout;
                    layout23.leftToLeft = lookupID(obtainStyledAttributes, index, layout23.leftToLeft);
                    break;
                case 26:
                    Layout layout24 = constraint.layout;
                    layout24.leftToRight = lookupID(obtainStyledAttributes, index, layout24.leftToRight);
                    break;
                case 27:
                    Layout layout25 = constraint.layout;
                    layout25.orientation = obtainStyledAttributes.getInt(index, layout25.orientation);
                    break;
                case 28:
                    Layout layout26 = constraint.layout;
                    layout26.rightMargin = obtainStyledAttributes.getDimensionPixelSize(index, layout26.rightMargin);
                    break;
                case 29:
                    Layout layout27 = constraint.layout;
                    layout27.rightToLeft = lookupID(obtainStyledAttributes, index, layout27.rightToLeft);
                    break;
                case 30:
                    Layout layout28 = constraint.layout;
                    layout28.rightToRight = lookupID(obtainStyledAttributes, index, layout28.rightToRight);
                    break;
                case 31:
                    Layout layout29 = constraint.layout;
                    layout29.startMargin = obtainStyledAttributes.getDimensionPixelSize(index, layout29.startMargin);
                    break;
                case 32:
                    Layout layout30 = constraint.layout;
                    layout30.startToEnd = lookupID(obtainStyledAttributes, index, layout30.startToEnd);
                    break;
                case 33:
                    Layout layout31 = constraint.layout;
                    layout31.startToStart = lookupID(obtainStyledAttributes, index, layout31.startToStart);
                    break;
                case 34:
                    Layout layout32 = constraint.layout;
                    layout32.topMargin = obtainStyledAttributes.getDimensionPixelSize(index, layout32.topMargin);
                    break;
                case 35:
                    Layout layout33 = constraint.layout;
                    layout33.topToBottom = lookupID(obtainStyledAttributes, index, layout33.topToBottom);
                    break;
                case 36:
                    Layout layout34 = constraint.layout;
                    layout34.topToTop = lookupID(obtainStyledAttributes, index, layout34.topToTop);
                    break;
                case 37:
                    Layout layout35 = constraint.layout;
                    layout35.verticalBias = obtainStyledAttributes.getFloat(index, layout35.verticalBias);
                    break;
                case 38:
                    constraint.mViewId = obtainStyledAttributes.getResourceId(index, constraint.mViewId);
                    break;
                case 39:
                    Layout layout36 = constraint.layout;
                    layout36.horizontalWeight = obtainStyledAttributes.getFloat(index, layout36.horizontalWeight);
                    break;
                case 40:
                    Layout layout37 = constraint.layout;
                    layout37.verticalWeight = obtainStyledAttributes.getFloat(index, layout37.verticalWeight);
                    break;
                case 41:
                    Layout layout38 = constraint.layout;
                    layout38.horizontalChainStyle = obtainStyledAttributes.getInt(index, layout38.horizontalChainStyle);
                    break;
                case 42:
                    Layout layout39 = constraint.layout;
                    layout39.verticalChainStyle = obtainStyledAttributes.getInt(index, layout39.verticalChainStyle);
                    break;
                case 43:
                    PropertySet propertySet3 = constraint.propertySet;
                    propertySet3.alpha = obtainStyledAttributes.getFloat(index, propertySet3.alpha);
                    break;
                case 44:
                    Transform transform = constraint.transform;
                    transform.applyElevation = true;
                    transform.elevation = obtainStyledAttributes.getDimension(index, transform.elevation);
                    break;
                case 45:
                    Transform transform2 = constraint.transform;
                    transform2.rotationX = obtainStyledAttributes.getFloat(index, transform2.rotationX);
                    break;
                case 46:
                    Transform transform3 = constraint.transform;
                    transform3.rotationY = obtainStyledAttributes.getFloat(index, transform3.rotationY);
                    break;
                case 47:
                    Transform transform4 = constraint.transform;
                    transform4.scaleX = obtainStyledAttributes.getFloat(index, transform4.scaleX);
                    break;
                case 48:
                    Transform transform5 = constraint.transform;
                    transform5.scaleY = obtainStyledAttributes.getFloat(index, transform5.scaleY);
                    break;
                case 49:
                    Transform transform6 = constraint.transform;
                    transform6.transformPivotX = obtainStyledAttributes.getFloat(index, transform6.transformPivotX);
                    break;
                case 50:
                    Transform transform7 = constraint.transform;
                    transform7.transformPivotY = obtainStyledAttributes.getFloat(index, transform7.transformPivotY);
                    break;
                case 51:
                    Transform transform8 = constraint.transform;
                    transform8.translationX = obtainStyledAttributes.getDimension(index, transform8.translationX);
                    break;
                case 52:
                    Transform transform9 = constraint.transform;
                    transform9.translationY = obtainStyledAttributes.getDimension(index, transform9.translationY);
                    break;
                case 53:
                    Transform transform10 = constraint.transform;
                    transform10.translationZ = obtainStyledAttributes.getDimension(index, transform10.translationZ);
                    break;
                case 54:
                    Layout layout40 = constraint.layout;
                    layout40.widthDefault = obtainStyledAttributes.getInt(index, layout40.widthDefault);
                    break;
                case 55:
                    Layout layout41 = constraint.layout;
                    layout41.heightDefault = obtainStyledAttributes.getInt(index, layout41.heightDefault);
                    break;
                case 56:
                    Layout layout42 = constraint.layout;
                    layout42.widthMax = obtainStyledAttributes.getDimensionPixelSize(index, layout42.widthMax);
                    break;
                case 57:
                    Layout layout43 = constraint.layout;
                    layout43.heightMax = obtainStyledAttributes.getDimensionPixelSize(index, layout43.heightMax);
                    break;
                case 58:
                    Layout layout44 = constraint.layout;
                    layout44.widthMin = obtainStyledAttributes.getDimensionPixelSize(index, layout44.widthMin);
                    break;
                case 59:
                    Layout layout45 = constraint.layout;
                    layout45.heightMin = obtainStyledAttributes.getDimensionPixelSize(index, layout45.heightMin);
                    break;
                case 60:
                    Transform transform11 = constraint.transform;
                    transform11.rotation = obtainStyledAttributes.getFloat(index, transform11.rotation);
                    break;
                case 61:
                    Layout layout46 = constraint.layout;
                    layout46.circleConstraint = lookupID(obtainStyledAttributes, index, layout46.circleConstraint);
                    break;
                case 62:
                    Layout layout47 = constraint.layout;
                    layout47.circleRadius = obtainStyledAttributes.getDimensionPixelSize(index, layout47.circleRadius);
                    break;
                case 63:
                    Layout layout48 = constraint.layout;
                    layout48.circleAngle = obtainStyledAttributes.getFloat(index, layout48.circleAngle);
                    break;
                case 64:
                    Motion motion = constraint.motion;
                    motion.mAnimateRelativeTo = lookupID(obtainStyledAttributes, index, motion.mAnimateRelativeTo);
                    break;
                case 65:
                    if (obtainStyledAttributes.peekValue(index).type == 3) {
                        Motion motion2 = constraint.motion;
                        obtainStyledAttributes.getString(index);
                        motion2.getClass();
                        break;
                    } else {
                        Motion motion3 = constraint.motion;
                        String str = R$id.NAMED_EASING[obtainStyledAttributes.getInteger(index, 0)];
                        motion3.getClass();
                        break;
                    }
                case 66:
                    Motion motion4 = constraint.motion;
                    obtainStyledAttributes.getInt(index, 0);
                    motion4.getClass();
                    break;
                case 67:
                    Motion motion5 = constraint.motion;
                    motion5.mPathRotate = obtainStyledAttributes.getFloat(index, motion5.mPathRotate);
                    break;
                case 68:
                    PropertySet propertySet4 = constraint.propertySet;
                    propertySet4.mProgress = obtainStyledAttributes.getFloat(index, propertySet4.mProgress);
                    break;
                case 69:
                    constraint.layout.widthPercent = obtainStyledAttributes.getFloat(index, 1.0f);
                    break;
                case 70:
                    constraint.layout.heightPercent = obtainStyledAttributes.getFloat(index, 1.0f);
                    break;
                case 71:
                    Log.e("ConstraintSet", "CURRENTLY UNSUPPORTED");
                    break;
                case 72:
                    Layout layout49 = constraint.layout;
                    layout49.mBarrierDirection = obtainStyledAttributes.getInt(index, layout49.mBarrierDirection);
                    break;
                case 73:
                    Layout layout50 = constraint.layout;
                    layout50.mBarrierMargin = obtainStyledAttributes.getDimensionPixelSize(index, layout50.mBarrierMargin);
                    break;
                case 74:
                    constraint.layout.mReferenceIdString = obtainStyledAttributes.getString(index);
                    break;
                case 75:
                    Layout layout51 = constraint.layout;
                    layout51.mBarrierAllowsGoneWidgets = obtainStyledAttributes.getBoolean(index, layout51.mBarrierAllowsGoneWidgets);
                    break;
                case 76:
                    Motion motion6 = constraint.motion;
                    motion6.mPathMotionArc = obtainStyledAttributes.getInt(index, motion6.mPathMotionArc);
                    break;
                case 77:
                    constraint.layout.mConstraintTag = obtainStyledAttributes.getString(index);
                    break;
                case 78:
                    PropertySet propertySet5 = constraint.propertySet;
                    propertySet5.mVisibilityMode = obtainStyledAttributes.getInt(index, propertySet5.mVisibilityMode);
                    break;
                case 79:
                    Motion motion7 = constraint.motion;
                    motion7.mMotionStagger = obtainStyledAttributes.getFloat(index, motion7.mMotionStagger);
                    break;
                case 80:
                    Layout layout52 = constraint.layout;
                    layout52.constrainedWidth = obtainStyledAttributes.getBoolean(index, layout52.constrainedWidth);
                    break;
                case 81:
                    Layout layout53 = constraint.layout;
                    layout53.constrainedHeight = obtainStyledAttributes.getBoolean(index, layout53.constrainedHeight);
                    break;
                case 82:
                    StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("unused attribute 0x");
                    m.append(Integer.toHexString(index));
                    m.append("   ");
                    m.append(mapToConstant.get(index));
                    Log.w("ConstraintSet", m.toString());
                    break;
                default:
                    StringBuilder m2 = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Unknown attribute 0x");
                    m2.append(Integer.toHexString(index));
                    m2.append("   ");
                    m2.append(mapToConstant.get(index));
                    Log.w("ConstraintSet", m2.toString());
                    break;
            }
        }
        obtainStyledAttributes.recycle();
        return constraint;
    }

    public final void applyToInternal(ConstraintLayout constraintLayout) {
        int i;
        Iterator<String> it;
        NoSuchMethodException e;
        IllegalAccessException e2;
        InvocationTargetException e3;
        String str;
        int childCount = constraintLayout.getChildCount();
        HashSet hashSet = new HashSet(this.mConstraints.keySet());
        int i2 = 0;
        while (i2 < childCount) {
            View childAt = constraintLayout.getChildAt(i2);
            int id = childAt.getId();
            if (!this.mConstraints.containsKey(Integer.valueOf(id))) {
                StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("id unknown ");
                try {
                    str = childAt.getContext().getResources().getResourceEntryName(childAt.getId());
                } catch (Exception unused) {
                    str = "UNKNOWN";
                }
                m.append(str);
                Log.w("ConstraintSet", m.toString());
            } else if (this.mForceId && id == -1) {
                throw new RuntimeException("All children of ConstraintLayout must have ids to use ConstraintSet");
            } else if (id != -1) {
                if (this.mConstraints.containsKey(Integer.valueOf(id))) {
                    hashSet.remove(Integer.valueOf(id));
                    Constraint constraint = this.mConstraints.get(Integer.valueOf(id));
                    if (childAt instanceof Barrier) {
                        constraint.layout.mHelperType = 1;
                    }
                    int i3 = constraint.layout.mHelperType;
                    if (i3 != -1 && i3 == 1) {
                        Barrier barrier = (Barrier) childAt;
                        barrier.setId(id);
                        Layout layout = constraint.layout;
                        barrier.mIndicatedType = layout.mBarrierDirection;
                        int i4 = layout.mBarrierMargin;
                        Barrier barrier2 = barrier.mBarrier;
                        barrier2.mMargin = i4;
                        barrier2.mAllowsGoneWidget = layout.mBarrierAllowsGoneWidgets;
                        int[] iArr = layout.mReferenceIds;
                        if (iArr != null) {
                            barrier.setReferencedIds(iArr);
                        } else {
                            String str2 = layout.mReferenceIdString;
                            if (str2 != null) {
                                layout.mReferenceIds = convertReferenceString(barrier, str2);
                                barrier.setReferencedIds(constraint.layout.mReferenceIds);
                            }
                        }
                    }
                    ConstraintLayout.LayoutParams layoutParams = (ConstraintLayout.LayoutParams) childAt.getLayoutParams();
                    layoutParams.validate();
                    constraint.applyTo(layoutParams);
                    HashMap<String, ConstraintAttribute> hashMap = constraint.mCustomConstraints;
                    Class<?> cls = childAt.getClass();
                    Iterator<String> it2 = hashMap.keySet().iterator();
                    while (it2.hasNext()) {
                        String next = it2.next();
                        ConstraintAttribute constraintAttribute = hashMap.get(next);
                        int i5 = childCount;
                        String m2 = SupportMenuInflater$$ExternalSyntheticOutline0.m("set", next);
                        HashMap<String, ConstraintAttribute> hashMap2 = hashMap;
                        try {
                            switch (constraintAttribute.mType.ordinal()) {
                                case 0:
                                    it = it2;
                                    cls.getMethod(m2, Integer.TYPE).invoke(childAt, Integer.valueOf(constraintAttribute.mIntegerValue));
                                    break;
                                case 1:
                                    it = it2;
                                    cls.getMethod(m2, Float.TYPE).invoke(childAt, Float.valueOf(constraintAttribute.mFloatValue));
                                    break;
                                case 2:
                                    it = it2;
                                    cls.getMethod(m2, Integer.TYPE).invoke(childAt, Integer.valueOf(constraintAttribute.mColorValue));
                                    break;
                                case 3:
                                    it = it2;
                                    Method method = cls.getMethod(m2, Drawable.class);
                                    ColorDrawable colorDrawable = new ColorDrawable();
                                    colorDrawable.setColor(constraintAttribute.mColorValue);
                                    method.invoke(childAt, colorDrawable);
                                    break;
                                case 4:
                                    it = it2;
                                    cls.getMethod(m2, CharSequence.class).invoke(childAt, constraintAttribute.mStringValue);
                                    break;
                                case 5:
                                    it = it2;
                                    cls.getMethod(m2, Boolean.TYPE).invoke(childAt, Boolean.valueOf(constraintAttribute.mBooleanValue));
                                    break;
                                case 6:
                                    it = it2;
                                    try {
                                        cls.getMethod(m2, Float.TYPE).invoke(childAt, Float.valueOf(constraintAttribute.mFloatValue));
                                    } catch (IllegalAccessException e4) {
                                        e2 = e4;
                                        Log.e("TransitionLayout", " Custom Attribute \"" + next + "\" not found on " + cls.getName());
                                        e2.printStackTrace();
                                        childCount = i5;
                                        hashMap = hashMap2;
                                        it2 = it;
                                    } catch (NoSuchMethodException e5) {
                                        e = e5;
                                        Log.e("TransitionLayout", e.getMessage());
                                        Log.e("TransitionLayout", " Custom Attribute \"" + next + "\" not found on " + cls.getName());
                                        StringBuilder sb = new StringBuilder();
                                        sb.append(cls.getName());
                                        sb.append(" must have a method ");
                                        sb.append(m2);
                                        Log.e("TransitionLayout", sb.toString());
                                        childCount = i5;
                                        hashMap = hashMap2;
                                        it2 = it;
                                    } catch (InvocationTargetException e6) {
                                        e3 = e6;
                                        Log.e("TransitionLayout", " Custom Attribute \"" + next + "\" not found on " + cls.getName());
                                        e3.printStackTrace();
                                        childCount = i5;
                                        hashMap = hashMap2;
                                        it2 = it;
                                    }
                                default:
                                    it = it2;
                                    break;
                            }
                        } catch (IllegalAccessException e7) {
                            e2 = e7;
                            it = it2;
                        } catch (NoSuchMethodException e8) {
                            e = e8;
                            it = it2;
                        } catch (InvocationTargetException e9) {
                            e3 = e9;
                            it = it2;
                        }
                        childCount = i5;
                        hashMap = hashMap2;
                        it2 = it;
                    }
                    i = childCount;
                    childAt.setLayoutParams(layoutParams);
                    PropertySet propertySet = constraint.propertySet;
                    if (propertySet.mVisibilityMode == 0) {
                        childAt.setVisibility(propertySet.visibility);
                    }
                    childAt.setAlpha(constraint.propertySet.alpha);
                    childAt.setRotation(constraint.transform.rotation);
                    childAt.setRotationX(constraint.transform.rotationX);
                    childAt.setRotationY(constraint.transform.rotationY);
                    childAt.setScaleX(constraint.transform.scaleX);
                    childAt.setScaleY(constraint.transform.scaleY);
                    if (!Float.isNaN(constraint.transform.transformPivotX)) {
                        childAt.setPivotX(constraint.transform.transformPivotX);
                    }
                    if (!Float.isNaN(constraint.transform.transformPivotY)) {
                        childAt.setPivotY(constraint.transform.transformPivotY);
                    }
                    childAt.setTranslationX(constraint.transform.translationX);
                    childAt.setTranslationY(constraint.transform.translationY);
                    childAt.setTranslationZ(constraint.transform.translationZ);
                    Transform transform = constraint.transform;
                    if (transform.applyElevation) {
                        childAt.setElevation(transform.elevation);
                    }
                } else {
                    i = childCount;
                    Log.v("ConstraintSet", "WARNING NO CONSTRAINTS for view " + id);
                }
                i2++;
                childCount = i;
            }
            i = childCount;
            i2++;
            childCount = i;
        }
        Iterator it3 = hashSet.iterator();
        while (it3.hasNext()) {
            Integer num = (Integer) it3.next();
            Constraint constraint2 = this.mConstraints.get(num);
            int i6 = constraint2.layout.mHelperType;
            if (i6 != -1 && i6 == 1) {
                Barrier barrier3 = new Barrier(constraintLayout.getContext());
                barrier3.setId(num.intValue());
                Layout layout2 = constraint2.layout;
                int[] iArr2 = layout2.mReferenceIds;
                if (iArr2 != null) {
                    barrier3.setReferencedIds(iArr2);
                } else {
                    String str3 = layout2.mReferenceIdString;
                    if (str3 != null) {
                        layout2.mReferenceIds = convertReferenceString(barrier3, str3);
                        barrier3.setReferencedIds(constraint2.layout.mReferenceIds);
                    }
                }
                Layout layout3 = constraint2.layout;
                barrier3.mIndicatedType = layout3.mBarrierDirection;
                barrier3.mBarrier.mMargin = layout3.mBarrierMargin;
                int i7 = ConstraintLayout.$r8$clinit;
                ConstraintLayout.LayoutParams layoutParams2 = new ConstraintLayout.LayoutParams();
                barrier3.validateParams();
                constraint2.applyTo(layoutParams2);
                constraintLayout.addView(barrier3, layoutParams2);
            }
            if (constraint2.layout.mIsGuideline) {
                View guideline = new Guideline(constraintLayout.getContext());
                guideline.setId(num.intValue());
                int i8 = ConstraintLayout.$r8$clinit;
                ConstraintLayout.LayoutParams layoutParams3 = new ConstraintLayout.LayoutParams();
                constraint2.applyTo(layoutParams3);
                constraintLayout.addView(guideline, layoutParams3);
            }
        }
    }

    public final void clone(ConstraintLayout constraintLayout) {
        NoSuchMethodException e;
        IllegalAccessException e2;
        InvocationTargetException e3;
        ConstraintSet constraintSet = this;
        int childCount = constraintLayout.getChildCount();
        constraintSet.mConstraints.clear();
        int i = 0;
        while (i < childCount) {
            View childAt = constraintLayout.getChildAt(i);
            ConstraintLayout.LayoutParams layoutParams = (ConstraintLayout.LayoutParams) childAt.getLayoutParams();
            int id = childAt.getId();
            if (!constraintSet.mForceId || id != -1) {
                if (!constraintSet.mConstraints.containsKey(Integer.valueOf(id))) {
                    constraintSet.mConstraints.put(Integer.valueOf(id), new Constraint());
                }
                Constraint constraint = constraintSet.mConstraints.get(Integer.valueOf(id));
                HashMap<String, ConstraintAttribute> hashMap = constraintSet.mSavedAttributes;
                HashMap<String, ConstraintAttribute> hashMap2 = new HashMap<>();
                Class<?> cls = childAt.getClass();
                for (String str : hashMap.keySet()) {
                    ConstraintAttribute constraintAttribute = hashMap.get(str);
                    try {
                    } catch (IllegalAccessException e4) {
                        e2 = e4;
                    } catch (NoSuchMethodException e5) {
                        e = e5;
                    } catch (InvocationTargetException e6) {
                        e3 = e6;
                    }
                    if (str.equals("BackgroundColor")) {
                        hashMap2.put(str, new ConstraintAttribute(constraintAttribute, Integer.valueOf(((ColorDrawable) childAt.getBackground()).getColor())));
                    } else {
                        try {
                            hashMap2.put(str, new ConstraintAttribute(constraintAttribute, cls.getMethod("getMap" + str, new Class[0]).invoke(childAt, new Object[0])));
                        } catch (IllegalAccessException e7) {
                            e2 = e7;
                            e2.printStackTrace();
                        } catch (NoSuchMethodException e8) {
                            e = e8;
                            e.printStackTrace();
                        } catch (InvocationTargetException e9) {
                            e3 = e9;
                            e3.printStackTrace();
                        }
                    }
                }
                constraint.mCustomConstraints = hashMap2;
                constraint.fillFrom(id, layoutParams);
                constraint.propertySet.visibility = childAt.getVisibility();
                constraint.propertySet.alpha = childAt.getAlpha();
                constraint.transform.rotation = childAt.getRotation();
                constraint.transform.rotationX = childAt.getRotationX();
                constraint.transform.rotationY = childAt.getRotationY();
                constraint.transform.scaleX = childAt.getScaleX();
                constraint.transform.scaleY = childAt.getScaleY();
                float pivotX = childAt.getPivotX();
                float pivotY = childAt.getPivotY();
                if (!(pivotX == 0.0d && pivotY == 0.0d)) {
                    Transform transform = constraint.transform;
                    transform.transformPivotX = pivotX;
                    transform.transformPivotY = pivotY;
                }
                constraint.transform.translationX = childAt.getTranslationX();
                constraint.transform.translationY = childAt.getTranslationY();
                constraint.transform.translationZ = childAt.getTranslationZ();
                Transform transform2 = constraint.transform;
                if (transform2.applyElevation) {
                    transform2.elevation = childAt.getElevation();
                }
                if (childAt instanceof Barrier) {
                    Barrier barrier = (Barrier) childAt;
                    Layout layout = constraint.layout;
                    layout.mBarrierAllowsGoneWidgets = barrier.mBarrier.mAllowsGoneWidget;
                    layout.mReferenceIds = Arrays.copyOf(barrier.mIds, barrier.mCount);
                    Layout layout2 = constraint.layout;
                    layout2.mBarrierDirection = barrier.mIndicatedType;
                    layout2.mBarrierMargin = barrier.mBarrier.mMargin;
                }
                i++;
                constraintSet = this;
            } else {
                throw new RuntimeException("All children of ConstraintLayout must have ids to use ConstraintSet");
            }
        }
    }

    public final Constraint get(int i) {
        if (!this.mConstraints.containsKey(Integer.valueOf(i))) {
            this.mConstraints.put(Integer.valueOf(i), new Constraint());
        }
        return this.mConstraints.get(Integer.valueOf(i));
    }

    public static int lookupID(TypedArray typedArray, int i, int i2) {
        int resourceId = typedArray.getResourceId(i, i2);
        if (resourceId == -1) {
            return typedArray.getInt(i, -1);
        }
        return resourceId;
    }

    public final void applyTo(ConstraintLayout constraintLayout) {
        applyToInternal(constraintLayout);
        constraintLayout.mConstraintSet = null;
        constraintLayout.requestLayout();
    }

    public final void load(Context context, int i) {
        XmlResourceParser xml = context.getResources().getXml(i);
        try {
            for (int eventType = xml.getEventType(); eventType != 1; eventType = xml.next()) {
                if (eventType == 0) {
                    xml.getName();
                } else if (eventType == 2) {
                    String name = xml.getName();
                    Constraint fillFromAttributeList = fillFromAttributeList(context, Xml.asAttributeSet(xml));
                    if (name.equalsIgnoreCase("Guideline")) {
                        fillFromAttributeList.layout.mIsGuideline = true;
                    }
                    this.mConstraints.put(Integer.valueOf(fillFromAttributeList.mViewId), fillFromAttributeList);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        } catch (XmlPullParserException e2) {
            e2.printStackTrace();
        }
    }
}
