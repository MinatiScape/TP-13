package com.android.wallpaper.widget;

import android.view.View;
import android.widget.CheckBox;
import com.android.wallpaper.model.WallpaperSectionController;
import com.android.wallpaper.picker.StartRotationDialogFragment;
import com.android.wallpaper.widget.BottomActionBar;
/* loaded from: classes.dex */
public final /* synthetic */ class BottomActionBar$$ExternalSyntheticLambda1 implements View.OnClickListener {
    public final /* synthetic */ int $r8$classId = 1;
    public final /* synthetic */ Object f$0;
    public final /* synthetic */ Object f$1;

    public /* synthetic */ BottomActionBar$$ExternalSyntheticLambda1(WallpaperSectionController wallpaperSectionController, View view) {
        this.f$0 = wallpaperSectionController;
        this.f$1 = view;
    }

    public /* synthetic */ BottomActionBar$$ExternalSyntheticLambda1(StartRotationDialogFragment startRotationDialogFragment, CheckBox checkBox) {
        this.f$0 = startRotationDialogFragment;
        this.f$1 = checkBox;
    }

    public /* synthetic */ BottomActionBar$$ExternalSyntheticLambda1(BottomActionBar bottomActionBar, BottomActionBar.BottomAction bottomAction) {
        this.f$0 = bottomActionBar;
        this.f$1 = bottomAction;
    }

    @Override // android.view.View.OnClickListener
    public final void onClick(View view) {
        switch (this.$r8$classId) {
            case 0:
                BottomActionBar bottomActionBar = (BottomActionBar) this.f$0;
                BottomActionBar.BottomAction bottomAction = (BottomActionBar.BottomAction) this.f$1;
                if (bottomActionBar.mBottomSheetBehavior.state == 4) {
                    bottomActionBar.mContentViewMap.forEach(new BottomActionBar$$ExternalSyntheticLambda3(bottomAction));
                }
                bottomActionBar.mBottomSheetView.setAccessibilityTraversalAfter(view.getId());
                return;
            case 1:
                final WallpaperSectionController wallpaperSectionController = (WallpaperSectionController) this.f$0;
                final View view2 = (View) this.f$1;
                wallpaperSectionController.mPermissionRequester.requestExternalStoragePermission(
                /*  JADX ERROR: Method code generation error
                    jadx.core.utils.exceptions.CodegenException: Error generate insn: 0x0015: INVOKE  
                      (wrap: com.android.wallpaper.model.PermissionRequester : 0x000e: IGET  (r0v4 com.android.wallpaper.model.PermissionRequester A[REMOVE]) = (r4v5 'wallpaperSectionController' com.android.wallpaper.model.WallpaperSectionController) com.android.wallpaper.model.WallpaperSectionController.mPermissionRequester com.android.wallpaper.model.PermissionRequester)
                      (wrap: com.android.wallpaper.picker.MyPhotosStarter$PermissionChangedListener : 0x0012: CONSTRUCTOR  (r1v3 com.android.wallpaper.picker.MyPhotosStarter$PermissionChangedListener A[REMOVE]) = 
                      (r4v5 'wallpaperSectionController' com.android.wallpaper.model.WallpaperSectionController A[DONT_INLINE])
                      (r3v8 'view2' android.view.View A[DONT_INLINE])
                     call: com.android.wallpaper.model.WallpaperSectionController.1.<init>(com.android.wallpaper.model.WallpaperSectionController, android.view.View):void type: CONSTRUCTOR)
                     type: INTERFACE call: com.android.wallpaper.model.PermissionRequester.requestExternalStoragePermission(com.android.wallpaper.picker.MyPhotosStarter$PermissionChangedListener):void in method: com.android.wallpaper.widget.BottomActionBar$$ExternalSyntheticLambda1.onClick(android.view.View):void, file: classes.dex
                    	at jadx.core.codegen.InsnGen.makeInsn(InsnGen.java:280)
                    	at jadx.core.codegen.InsnGen.makeInsn(InsnGen.java:243)
                    	at jadx.core.codegen.RegionGen.makeSimpleBlock(RegionGen.java:90)
                    	at jadx.core.dex.nodes.IBlock.generate(IBlock.java:15)
                    	at jadx.core.codegen.RegionGen.makeRegion(RegionGen.java:62)
                    	at jadx.core.dex.regions.Region.generate(Region.java:35)
                    	at jadx.core.codegen.RegionGen.makeRegion(RegionGen.java:62)
                    	at jadx.core.codegen.RegionGen.makeRegionIndent(RegionGen.java:79)
                    	at jadx.core.codegen.RegionGen.makeSwitch(RegionGen.java:266)
                    	at jadx.core.dex.regions.SwitchRegion.generate(SwitchRegion.java:79)
                    	at jadx.core.codegen.RegionGen.makeRegion(RegionGen.java:62)
                    	at jadx.core.dex.regions.Region.generate(Region.java:35)
                    	at jadx.core.codegen.RegionGen.makeRegion(RegionGen.java:62)
                    	at jadx.core.codegen.MethodGen.addRegionInsns(MethodGen.java:286)
                    	at jadx.core.codegen.MethodGen.addInstructions(MethodGen.java:265)
                    	at jadx.core.codegen.ClassGen.addMethodCode(ClassGen.java:369)
                    	at jadx.core.codegen.ClassGen.addMethod(ClassGen.java:304)
                    	at jadx.core.codegen.ClassGen.lambda$addInnerClsAndMethods$2(ClassGen.java:270)
                    	at java.base/java.util.stream.ForEachOps$ForEachOp$OfRef.accept(ForEachOps.java:183)
                    	at java.base/java.util.ArrayList.forEach(ArrayList.java:1541)
                    	at java.base/java.util.stream.SortedOps$RefSortingSink.end(SortedOps.java:395)
                    	at java.base/java.util.stream.Sink$ChainedReference.end(Sink.java:258)
                    Caused by: jadx.core.utils.exceptions.JadxRuntimeException: Expected class to be processed at this point, class: com.android.wallpaper.model.WallpaperSectionController, state: NOT_LOADED
                    	at jadx.core.dex.nodes.ClassNode.ensureProcessed(ClassNode.java:302)
                    	at jadx.core.codegen.InsnGen.makeConstructor(InsnGen.java:689)
                    	at jadx.core.codegen.InsnGen.makeInsnBody(InsnGen.java:388)
                    	at jadx.core.codegen.InsnGen.addWrappedArg(InsnGen.java:142)
                    	at jadx.core.codegen.InsnGen.addArg(InsnGen.java:118)
                    	at jadx.core.codegen.InsnGen.addArg(InsnGen.java:105)
                    	at jadx.core.codegen.InsnGen.generateMethodArguments(InsnGen.java:1017)
                    	at jadx.core.codegen.InsnGen.makeInvoke(InsnGen.java:828)
                    	at jadx.core.codegen.InsnGen.makeInsnBody(InsnGen.java:392)
                    	at jadx.core.codegen.InsnGen.makeInsn(InsnGen.java:273)
                    	... 21 more
                    */
                /*
                    this = this;
                    int r0 = r3.$r8$classId
                    switch(r0) {
                        case 0: goto L19;
                        case 1: goto L6;
                        default: goto L5;
                    }
                L5:
                    goto L3c
                L6:
                    java.lang.Object r4 = r3.f$0
                    com.android.wallpaper.model.WallpaperSectionController r4 = (com.android.wallpaper.model.WallpaperSectionController) r4
                    java.lang.Object r3 = r3.f$1
                    android.view.View r3 = (android.view.View) r3
                    com.android.wallpaper.model.PermissionRequester r0 = r4.mPermissionRequester
                    com.android.wallpaper.model.WallpaperSectionController$1 r1 = new com.android.wallpaper.model.WallpaperSectionController$1
                    r1.<init>(r4, r3)
                    r0.requestExternalStoragePermission(r1)
                    return
                L19:
                    java.lang.Object r0 = r3.f$0
                    com.android.wallpaper.widget.BottomActionBar r0 = (com.android.wallpaper.widget.BottomActionBar) r0
                    java.lang.Object r3 = r3.f$1
                    com.android.wallpaper.widget.BottomActionBar$BottomAction r3 = (com.android.wallpaper.widget.BottomActionBar.BottomAction) r3
                    com.android.wallpaper.widget.BottomActionBar$QueueStateBottomSheetBehavior<android.view.ViewGroup> r1 = r0.mBottomSheetBehavior
                    int r1 = r1.state
                    r2 = 4
                    if (r1 != r2) goto L32
                    java.util.Map<com.android.wallpaper.widget.BottomActionBar$BottomAction, com.android.wallpaper.widget.BottomActionBar$BottomSheetContent<?>> r1 = r0.mContentViewMap
                    com.android.wallpaper.widget.BottomActionBar$$ExternalSyntheticLambda3 r2 = new com.android.wallpaper.widget.BottomActionBar$$ExternalSyntheticLambda3
                    r2.<init>(r3)
                    r1.forEach(r2)
                L32:
                    android.view.ViewGroup r3 = r0.mBottomSheetView
                    int r4 = r4.getId()
                    r3.setAccessibilityTraversalAfter(r4)
                    return
                L3c:
                    java.lang.Object r4 = r3.f$0
                    com.android.wallpaper.picker.StartRotationDialogFragment r4 = (com.android.wallpaper.picker.StartRotationDialogFragment) r4
                    java.lang.Object r3 = r3.f$1
                    android.widget.CheckBox r3 = (android.widget.CheckBox) r3
                    int r0 = com.android.wallpaper.picker.StartRotationDialogFragment.$r8$clinit
                    java.util.Objects.requireNonNull(r4)
                    boolean r3 = r3.isChecked()
                    r4.mIsWifiOnlyChecked = r3
                    return
                */
                throw new UnsupportedOperationException("Method not decompiled: com.android.wallpaper.widget.BottomActionBar$$ExternalSyntheticLambda1.onClick(android.view.View):void");
            }
        }
