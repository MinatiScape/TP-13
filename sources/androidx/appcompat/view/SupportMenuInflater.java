package androidx.appcompat.view;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.res.ColorStateList;
import android.content.res.TypedArray;
import android.content.res.XmlResourceParser;
import android.graphics.PorterDuff;
import android.util.AttributeSet;
import android.util.Log;
import android.util.Xml;
import android.view.InflateException;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.SubMenu;
import android.view.View;
import androidx.appcompat.R$styleable;
import androidx.appcompat.view.menu.MenuItemImpl;
import androidx.appcompat.view.menu.MenuItemWrapperICS;
import androidx.appcompat.widget.DrawableUtils;
import androidx.appcompat.widget.TintTypedArray;
import androidx.core.internal.view.SupportMenu;
import androidx.core.internal.view.SupportMenuItem;
import androidx.core.view.ActionProvider;
import com.android.systemui.shared.system.QuickStepContract;
import java.io.IOException;
import java.lang.reflect.Constructor;
import java.lang.reflect.Method;
import org.xmlpull.v1.XmlPullParserException;
/* loaded from: classes.dex */
public final class SupportMenuInflater extends MenuInflater {
    public static final Class<?>[] ACTION_PROVIDER_CONSTRUCTOR_SIGNATURE;
    public static final Class<?>[] ACTION_VIEW_CONSTRUCTOR_SIGNATURE;
    public final Object[] mActionProviderConstructorArguments;
    public final Object[] mActionViewConstructorArguments;
    public Context mContext;
    public Object mRealOwner;

    /* loaded from: classes.dex */
    public static class InflatedOnMenuItemClickListener implements MenuItem.OnMenuItemClickListener {
        public static final Class<?>[] PARAM_TYPES = {MenuItem.class};
        public Method mMethod;
        public Object mRealOwner;

        @Override // android.view.MenuItem.OnMenuItemClickListener
        public final boolean onMenuItemClick(MenuItem menuItem) {
            try {
                if (this.mMethod.getReturnType() == Boolean.TYPE) {
                    return ((Boolean) this.mMethod.invoke(this.mRealOwner, menuItem)).booleanValue();
                }
                this.mMethod.invoke(this.mRealOwner, menuItem);
                return true;
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        }

        public InflatedOnMenuItemClickListener(Object obj, String str) {
            this.mRealOwner = obj;
            Class<?> cls = obj.getClass();
            try {
                this.mMethod = cls.getMethod(str, PARAM_TYPES);
            } catch (Exception e) {
                InflateException inflateException = new InflateException("Couldn't resolve menu item onClick handler " + str + " in class " + cls.getName());
                inflateException.initCause(e);
                throw inflateException;
            }
        }
    }

    /* loaded from: classes.dex */
    public class MenuState {
        public ActionProvider itemActionProvider;
        public String itemActionViewClassName;
        public int itemActionViewLayout;
        public boolean itemAdded;
        public int itemAlphabeticModifiers;
        public char itemAlphabeticShortcut;
        public int itemCategoryOrder;
        public int itemCheckable;
        public boolean itemChecked;
        public CharSequence itemContentDescription;
        public boolean itemEnabled;
        public int itemIconResId;
        public int itemId;
        public String itemListenerMethodName;
        public int itemNumericModifiers;
        public char itemNumericShortcut;
        public int itemShowAsAction;
        public CharSequence itemTitle;
        public CharSequence itemTitleCondensed;
        public CharSequence itemTooltipText;
        public boolean itemVisible;
        public Menu menu;
        public ColorStateList itemIconTintList = null;
        public PorterDuff.Mode itemIconTintMode = null;
        public int groupId = 0;
        public int groupCategory = 0;
        public int groupOrder = 0;
        public int groupCheckable = 0;
        public boolean groupVisible = true;
        public boolean groupEnabled = true;

        public MenuState(Menu menu) {
            this.menu = menu;
        }

        public final <T> T newInstance(String str, Class<?>[] clsArr, Object[] objArr) {
            try {
                Constructor<?> constructor = Class.forName(str, false, SupportMenuInflater.this.mContext.getClassLoader()).getConstructor(clsArr);
                constructor.setAccessible(true);
                return (T) constructor.newInstance(objArr);
            } catch (Exception e) {
                Log.w("SupportMenuInflater", "Cannot instantiate class: " + str, e);
                return null;
            }
        }

        public final void setItem(MenuItem menuItem) {
            boolean z;
            MenuItem enabled = menuItem.setChecked(this.itemChecked).setVisible(this.itemVisible).setEnabled(this.itemEnabled);
            boolean z2 = false;
            if (this.itemCheckable >= 1) {
                z = true;
            } else {
                z = false;
            }
            enabled.setCheckable(z).setTitleCondensed(this.itemTitleCondensed).setIcon(this.itemIconResId);
            int i = this.itemShowAsAction;
            if (i >= 0) {
                menuItem.setShowAsAction(i);
            }
            if (this.itemListenerMethodName != null) {
                if (!SupportMenuInflater.this.mContext.isRestricted()) {
                    SupportMenuInflater supportMenuInflater = SupportMenuInflater.this;
                    if (supportMenuInflater.mRealOwner == null) {
                        supportMenuInflater.mRealOwner = SupportMenuInflater.findRealOwner(supportMenuInflater.mContext);
                    }
                    menuItem.setOnMenuItemClickListener(new InflatedOnMenuItemClickListener(supportMenuInflater.mRealOwner, this.itemListenerMethodName));
                } else {
                    throw new IllegalStateException("The android:onClick attribute cannot be used within a restricted context");
                }
            }
            if (this.itemCheckable >= 2) {
                if (menuItem instanceof MenuItemImpl) {
                    MenuItemImpl menuItemImpl = (MenuItemImpl) menuItem;
                    menuItemImpl.mFlags = (menuItemImpl.mFlags & (-5)) | 4;
                } else if (menuItem instanceof MenuItemWrapperICS) {
                    MenuItemWrapperICS menuItemWrapperICS = (MenuItemWrapperICS) menuItem;
                    try {
                        if (menuItemWrapperICS.mSetExclusiveCheckableMethod == null) {
                            menuItemWrapperICS.mSetExclusiveCheckableMethod = menuItemWrapperICS.mWrappedObject.getClass().getDeclaredMethod("setExclusiveCheckable", Boolean.TYPE);
                        }
                        menuItemWrapperICS.mSetExclusiveCheckableMethod.invoke(menuItemWrapperICS.mWrappedObject, Boolean.TRUE);
                    } catch (Exception e) {
                        Log.w("MenuItemWrapper", "Error while calling setExclusiveCheckable", e);
                    }
                }
            }
            String str = this.itemActionViewClassName;
            if (str != null) {
                menuItem.setActionView((View) newInstance(str, SupportMenuInflater.ACTION_VIEW_CONSTRUCTOR_SIGNATURE, SupportMenuInflater.this.mActionViewConstructorArguments));
                z2 = true;
            }
            int i2 = this.itemActionViewLayout;
            if (i2 > 0) {
                if (!z2) {
                    menuItem.setActionView(i2);
                } else {
                    Log.w("SupportMenuInflater", "Ignoring attribute 'itemActionViewLayout'. Action view already specified.");
                }
            }
            ActionProvider actionProvider = this.itemActionProvider;
            if (actionProvider != null) {
                if (menuItem instanceof SupportMenuItem) {
                    ((SupportMenuItem) menuItem).setSupportActionProvider(actionProvider);
                } else {
                    Log.w("MenuItemCompat", "setActionProvider: item does not implement SupportMenuItem; ignoring");
                }
            }
            CharSequence charSequence = this.itemContentDescription;
            boolean z3 = menuItem instanceof SupportMenuItem;
            if (z3) {
                ((SupportMenuItem) menuItem).mo0setContentDescription(charSequence);
            } else {
                menuItem.setContentDescription(charSequence);
            }
            CharSequence charSequence2 = this.itemTooltipText;
            if (z3) {
                ((SupportMenuItem) menuItem).mo1setTooltipText(charSequence2);
            } else {
                menuItem.setTooltipText(charSequence2);
            }
            char c = this.itemAlphabeticShortcut;
            int i3 = this.itemAlphabeticModifiers;
            if (z3) {
                ((SupportMenuItem) menuItem).setAlphabeticShortcut(c, i3);
            } else {
                menuItem.setAlphabeticShortcut(c, i3);
            }
            char c2 = this.itemNumericShortcut;
            int i4 = this.itemNumericModifiers;
            if (z3) {
                ((SupportMenuItem) menuItem).setNumericShortcut(c2, i4);
            } else {
                menuItem.setNumericShortcut(c2, i4);
            }
            PorterDuff.Mode mode = this.itemIconTintMode;
            if (mode != null) {
                if (z3) {
                    ((SupportMenuItem) menuItem).setIconTintMode(mode);
                } else {
                    menuItem.setIconTintMode(mode);
                }
            }
            ColorStateList colorStateList = this.itemIconTintList;
            if (colorStateList == null) {
                return;
            }
            if (z3) {
                ((SupportMenuItem) menuItem).setIconTintList(colorStateList);
            } else {
                menuItem.setIconTintList(colorStateList);
            }
        }
    }

    static {
        Class<?>[] clsArr = {Context.class};
        ACTION_VIEW_CONSTRUCTOR_SIGNATURE = clsArr;
        ACTION_PROVIDER_CONSTRUCTOR_SIGNATURE = clsArr;
    }

    public static Object findRealOwner(Context context) {
        if (context instanceof Activity) {
            return context;
        }
        if (context instanceof ContextWrapper) {
            return findRealOwner(((ContextWrapper) context).getBaseContext());
        }
        return context;
    }

    @Override // android.view.MenuInflater
    public final void inflate(int i, Menu menu) {
        if (!(menu instanceof SupportMenu)) {
            super.inflate(i, menu);
            return;
        }
        XmlResourceParser xmlResourceParser = null;
        try {
            try {
                try {
                    xmlResourceParser = this.mContext.getResources().getLayout(i);
                    parseMenu(xmlResourceParser, Xml.asAttributeSet(xmlResourceParser), menu);
                    xmlResourceParser.close();
                } catch (XmlPullParserException e) {
                    throw new InflateException("Error inflating menu XML", e);
                }
            } catch (IOException e2) {
                throw new InflateException("Error inflating menu XML", e2);
            }
        } catch (Throwable th) {
            if (xmlResourceParser != null) {
                xmlResourceParser.close();
            }
            throw th;
        }
    }

    public final void parseMenu(XmlResourceParser xmlResourceParser, AttributeSet attributeSet, Menu menu) throws XmlPullParserException, IOException {
        char c;
        char c2;
        boolean z;
        ColorStateList colorStateList;
        MenuState menuState = new MenuState(menu);
        int eventType = xmlResourceParser.getEventType();
        while (true) {
            if (eventType == 2) {
                String name = xmlResourceParser.getName();
                if (name.equals("menu")) {
                    eventType = xmlResourceParser.next();
                } else {
                    throw new RuntimeException(SupportMenuInflater$$ExternalSyntheticOutline0.m("Expecting menu, got ", name));
                }
            } else {
                eventType = xmlResourceParser.next();
                if (eventType == 1) {
                    break;
                }
            }
        }
        String str = null;
        boolean z2 = false;
        boolean z3 = false;
        while (!z2) {
            if (eventType != 1) {
                z2 = z2;
                z2 = z2;
                if (eventType != 2) {
                    if (eventType == 3) {
                        String name2 = xmlResourceParser.getName();
                        if (z3 && name2.equals(str)) {
                            str = null;
                            z3 = false;
                            eventType = xmlResourceParser.next();
                            z2 = z2;
                            z3 = z3;
                        } else if (name2.equals("group")) {
                            menuState.groupId = 0;
                            menuState.groupCategory = 0;
                            menuState.groupOrder = 0;
                            menuState.groupCheckable = 0;
                            menuState.groupVisible = true;
                            menuState.groupEnabled = true;
                            z2 = z2;
                        } else if (name2.equals("item")) {
                            z2 = z2;
                            if (!menuState.itemAdded) {
                                ActionProvider actionProvider = menuState.itemActionProvider;
                                if (actionProvider == null || !actionProvider.hasSubMenu()) {
                                    menuState.itemAdded = true;
                                    menuState.setItem(menuState.menu.add(menuState.groupId, menuState.itemId, menuState.itemCategoryOrder, menuState.itemTitle));
                                    z2 = z2;
                                } else {
                                    menuState.itemAdded = true;
                                    menuState.setItem(menuState.menu.addSubMenu(menuState.groupId, menuState.itemId, menuState.itemCategoryOrder, menuState.itemTitle).getItem());
                                    z2 = z2;
                                }
                            }
                        } else {
                            z2 = z2;
                            if (name2.equals("menu")) {
                                z2 = true;
                            }
                        }
                    }
                    eventType = xmlResourceParser.next();
                    z2 = z2;
                    z3 = z3;
                } else {
                    if (!z3) {
                        String name3 = xmlResourceParser.getName();
                        if (name3.equals("group")) {
                            TypedArray obtainStyledAttributes = SupportMenuInflater.this.mContext.obtainStyledAttributes(attributeSet, R$styleable.MenuGroup);
                            menuState.groupId = obtainStyledAttributes.getResourceId(1, 0);
                            menuState.groupCategory = obtainStyledAttributes.getInt(3, 0);
                            menuState.groupOrder = obtainStyledAttributes.getInt(4, 0);
                            menuState.groupCheckable = obtainStyledAttributes.getInt(5, 0);
                            menuState.groupVisible = obtainStyledAttributes.getBoolean(2, true);
                            menuState.groupEnabled = obtainStyledAttributes.getBoolean(0, true);
                            obtainStyledAttributes.recycle();
                            z2 = z2;
                        } else if (name3.equals("item")) {
                            Context context = SupportMenuInflater.this.mContext;
                            TintTypedArray tintTypedArray = new TintTypedArray(context, context.obtainStyledAttributes(attributeSet, R$styleable.MenuItem));
                            menuState.itemId = tintTypedArray.getResourceId(2, 0);
                            menuState.itemCategoryOrder = (tintTypedArray.getInt(5, menuState.groupCategory) & (-65536)) | (tintTypedArray.getInt(6, menuState.groupOrder) & 65535);
                            menuState.itemTitle = tintTypedArray.getText(7);
                            menuState.itemTitleCondensed = tintTypedArray.getText(8);
                            menuState.itemIconResId = tintTypedArray.getResourceId(0, 0);
                            String string = tintTypedArray.getString(9);
                            if (string == null) {
                                c = 0;
                            } else {
                                c = string.charAt(0);
                            }
                            menuState.itemAlphabeticShortcut = c;
                            menuState.itemAlphabeticModifiers = tintTypedArray.getInt(16, QuickStepContract.SYSUI_STATE_TRACING_ENABLED);
                            String string2 = tintTypedArray.getString(10);
                            if (string2 == null) {
                                c2 = 0;
                            } else {
                                c2 = string2.charAt(0);
                            }
                            menuState.itemNumericShortcut = c2;
                            menuState.itemNumericModifiers = tintTypedArray.getInt(20, QuickStepContract.SYSUI_STATE_TRACING_ENABLED);
                            if (tintTypedArray.hasValue(11)) {
                                menuState.itemCheckable = tintTypedArray.getBoolean(11, false) ? 1 : 0;
                            } else {
                                menuState.itemCheckable = menuState.groupCheckable;
                            }
                            menuState.itemChecked = tintTypedArray.getBoolean(3, false);
                            menuState.itemVisible = tintTypedArray.getBoolean(4, menuState.groupVisible);
                            menuState.itemEnabled = tintTypedArray.getBoolean(1, menuState.groupEnabled);
                            menuState.itemShowAsAction = tintTypedArray.getInt(21, -1);
                            menuState.itemListenerMethodName = tintTypedArray.getString(12);
                            menuState.itemActionViewLayout = tintTypedArray.getResourceId(13, 0);
                            menuState.itemActionViewClassName = tintTypedArray.getString(15);
                            String string3 = tintTypedArray.getString(14);
                            if (string3 != null) {
                                z = true;
                            } else {
                                z = false;
                            }
                            if (z && menuState.itemActionViewLayout == 0 && menuState.itemActionViewClassName == null) {
                                menuState.itemActionProvider = (ActionProvider) menuState.newInstance(string3, ACTION_PROVIDER_CONSTRUCTOR_SIGNATURE, SupportMenuInflater.this.mActionProviderConstructorArguments);
                            } else {
                                if (z) {
                                    Log.w("SupportMenuInflater", "Ignoring attribute 'actionProviderClass'. Action view already specified.");
                                }
                                menuState.itemActionProvider = null;
                            }
                            menuState.itemContentDescription = tintTypedArray.getText(17);
                            menuState.itemTooltipText = tintTypedArray.getText(22);
                            if (tintTypedArray.hasValue(19)) {
                                menuState.itemIconTintMode = DrawableUtils.parseTintMode(tintTypedArray.getInt(19, -1), menuState.itemIconTintMode);
                                colorStateList = null;
                            } else {
                                colorStateList = null;
                                menuState.itemIconTintMode = null;
                            }
                            if (tintTypedArray.hasValue(18)) {
                                menuState.itemIconTintList = tintTypedArray.getColorStateList(18);
                            } else {
                                menuState.itemIconTintList = colorStateList;
                            }
                            tintTypedArray.recycle();
                            menuState.itemAdded = false;
                            z2 = z2;
                        } else {
                            if (name3.equals("menu")) {
                                menuState.itemAdded = true;
                                SubMenu addSubMenu = menuState.menu.addSubMenu(menuState.groupId, menuState.itemId, menuState.itemCategoryOrder, menuState.itemTitle);
                                menuState.setItem(addSubMenu.getItem());
                                parseMenu(xmlResourceParser, attributeSet, addSubMenu);
                            } else {
                                str = name3;
                                z3 = true;
                            }
                            eventType = xmlResourceParser.next();
                            z2 = z2;
                            z3 = z3;
                        }
                    }
                    eventType = xmlResourceParser.next();
                    z2 = z2;
                    z3 = z3;
                }
            } else {
                throw new RuntimeException("Unexpected end of document");
            }
        }
    }

    public SupportMenuInflater(Context context) {
        super(context);
        this.mContext = context;
        Object[] objArr = {context};
        this.mActionViewConstructorArguments = objArr;
        this.mActionProviderConstructorArguments = objArr;
    }
}
