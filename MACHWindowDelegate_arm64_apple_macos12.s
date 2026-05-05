	.build_version macos, 12, 0
	.section	__TEXT,__text,regular,pure_instructions
	.private_extern	"-[MACHWindowDelegate setBlock_windowDidResize:]"
	.globl	"-[MACHWindowDelegate setBlock_windowDidResize:]"
	.p2align	2
"-[MACHWindowDelegate setBlock_windowDidResize:]":
	.cfi_startproc
	cbz	x0, LBB0_2
	stp	x20, x19, [sp, #-32]!
	.cfi_def_cfa_offset 32
	stp	x29, x30, [sp, #16]
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	mov	x19, x0
	mov	x0, x1
	bl	_objc_retainBlock
	ldr	x8, [x19, #8]
	str	x0, [x19, #8]
	mov	x0, x8
	ldp	x29, x30, [sp, #16]
	ldp	x20, x19, [sp], #32
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	.cfi_restore w19
	.cfi_restore w20
	b	_objc_release
LBB0_2:
	ret
	.cfi_endproc

	.private_extern	"-[MACHWindowDelegate setBlock_windowShouldClose:]"
	.globl	"-[MACHWindowDelegate setBlock_windowShouldClose:]"
	.p2align	2
"-[MACHWindowDelegate setBlock_windowShouldClose:]":
	.cfi_startproc
	cbz	x0, LBB1_2
	stp	x20, x19, [sp, #-32]!
	.cfi_def_cfa_offset 32
	stp	x29, x30, [sp, #16]
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	mov	x19, x0
	mov	x0, x1
	bl	_objc_retainBlock
	ldr	x8, [x19, #16]
	str	x0, [x19, #16]
	mov	x0, x8
	ldp	x29, x30, [sp, #16]
	ldp	x20, x19, [sp], #32
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	.cfi_restore w19
	.cfi_restore w20
	b	_objc_release
LBB1_2:
	ret
	.cfi_endproc

	.private_extern	"-[MACHWindowDelegate setBlock_windowDidChangeBackingProperties:]"
	.globl	"-[MACHWindowDelegate setBlock_windowDidChangeBackingProperties:]"
	.p2align	2
"-[MACHWindowDelegate setBlock_windowDidChangeBackingProperties:]":
	.cfi_startproc
	cbz	x0, LBB2_2
	stp	x20, x19, [sp, #-32]!
	.cfi_def_cfa_offset 32
	stp	x29, x30, [sp, #16]
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	mov	x19, x0
	mov	x0, x1
	bl	_objc_retainBlock
	ldr	x8, [x19, #24]
	str	x0, [x19, #24]
	mov	x0, x8
	ldp	x29, x30, [sp, #16]
	ldp	x20, x19, [sp], #32
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	.cfi_restore w19
	.cfi_restore w20
	b	_objc_release
LBB2_2:
	ret
	.cfi_endproc

	.private_extern	"-[MACHWindowDelegate setBlock_windowDidBecomeKey:]"
	.globl	"-[MACHWindowDelegate setBlock_windowDidBecomeKey:]"
	.p2align	2
"-[MACHWindowDelegate setBlock_windowDidBecomeKey:]":
	.cfi_startproc
	cbz	x0, LBB3_2
	stp	x20, x19, [sp, #-32]!
	.cfi_def_cfa_offset 32
	stp	x29, x30, [sp, #16]
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	mov	x19, x0
	mov	x0, x1
	bl	_objc_retainBlock
	ldr	x8, [x19, #32]
	str	x0, [x19, #32]
	mov	x0, x8
	ldp	x29, x30, [sp, #16]
	ldp	x20, x19, [sp], #32
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	.cfi_restore w19
	.cfi_restore w20
	b	_objc_release
LBB3_2:
	ret
	.cfi_endproc

	.private_extern	"-[MACHWindowDelegate setBlock_windowDidResignKey:]"
	.globl	"-[MACHWindowDelegate setBlock_windowDidResignKey:]"
	.p2align	2
"-[MACHWindowDelegate setBlock_windowDidResignKey:]":
	.cfi_startproc
	cbz	x0, LBB4_2
	stp	x20, x19, [sp, #-32]!
	.cfi_def_cfa_offset 32
	stp	x29, x30, [sp, #16]
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	mov	x19, x0
	mov	x0, x1
	bl	_objc_retainBlock
	ldr	x8, [x19, #40]
	str	x0, [x19, #40]
	mov	x0, x8
	ldp	x29, x30, [sp, #16]
	ldp	x20, x19, [sp], #32
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	.cfi_restore w19
	.cfi_restore w20
	b	_objc_release
LBB4_2:
	ret
	.cfi_endproc

	.p2align	2
"-[MACHWindowDelegate windowDidResize:]":
	.cfi_startproc
	ldr	x0, [x0, #8]
	cbz	x0, LBB5_2
	ldr	x1, [x0, #16]
	br	x1
LBB5_2:
	ret
	.cfi_endproc

	.p2align	2
"-[MACHWindowDelegate windowShouldClose:]":
	.cfi_startproc
	ldr	x0, [x0, #16]
	cbz	x0, LBB6_2
	stp	x29, x30, [sp, #-16]!
	.cfi_def_cfa_offset 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	ldr	x8, [x0, #16]
	blr	x8
	ldp	x29, x30, [sp], #16
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
LBB6_2:
	mov	w0, #0
	ret
	.cfi_endproc

	.p2align	2
"-[MACHWindowDelegate windowDidChangeBackingProperties:]":
	.cfi_startproc
	ldr	x0, [x0, #24]
	cbz	x0, LBB7_2
	ldr	x1, [x0, #16]
	br	x1
LBB7_2:
	ret
	.cfi_endproc

	.p2align	2
"-[MACHWindowDelegate windowDidBecomeKey:]":
	.cfi_startproc
	ldr	x0, [x0, #32]
	cbz	x0, LBB8_2
	ldr	x1, [x0, #16]
	br	x1
LBB8_2:
	ret
	.cfi_endproc

	.p2align	2
"-[MACHWindowDelegate windowDidResignKey:]":
	.cfi_startproc
	ldr	x0, [x0, #40]
	cbz	x0, LBB9_2
	ldr	x1, [x0, #16]
	br	x1
LBB9_2:
	ret
	.cfi_endproc

	.p2align	2
"-[MACHWindowDelegate windowWillClose:]":
	.cfi_startproc
	ret
	.cfi_endproc

	.p2align	2
"-[MACHWindowDelegate .cxx_destruct]":
	.cfi_startproc
	stp	x20, x19, [sp, #-32]!
	.cfi_def_cfa_offset 32
	stp	x29, x30, [sp, #16]
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	mov	x19, x0
	add	x0, x0, #40
	mov	x1, #0
	bl	_objc_storeStrong
	add	x0, x19, #32
	mov	x1, #0
	bl	_objc_storeStrong
	add	x0, x19, #24
	mov	x1, #0
	bl	_objc_storeStrong
	add	x0, x19, #16
	mov	x1, #0
	bl	_objc_storeStrong
	add	x0, x19, #8
	mov	x1, #0
	ldp	x29, x30, [sp, #16]
	ldp	x20, x19, [sp], #32
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	.cfi_restore w19
	.cfi_restore w20
	b	_objc_storeStrong
	.cfi_endproc

	.section	__TEXT,__objc_classname,cstring_literals
l_OBJC_CLASS_NAME_:
	.asciz	"MACHWindowDelegate"

	.section	__DATA,__objc_const
	.p2align	3, 0x0
__OBJC_METACLASS_RO_$_MACHWindowDelegate:
	.long	389
	.long	40
	.long	40
	.space	4
	.quad	0
	.quad	l_OBJC_CLASS_NAME_
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0

	.section	__DATA,__objc_data
	.globl	_OBJC_METACLASS_$_MACHWindowDelegate
	.p2align	3, 0x0
_OBJC_METACLASS_$_MACHWindowDelegate:
	.quad	_OBJC_METACLASS_$_NSObject
	.quad	_OBJC_METACLASS_$_NSObject
	.quad	__objc_empty_cache
	.quad	0
	.quad	__OBJC_METACLASS_RO_$_MACHWindowDelegate

	.section	__TEXT,__objc_classname,cstring_literals
l_OBJC_CLASS_NAME_.1:
	.asciz	"\005"

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_:
	.asciz	"windowDidResize:"

	.section	__TEXT,__objc_methtype,cstring_literals
l_OBJC_METH_VAR_TYPE_:
	.asciz	"v24@0:8@16"

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.2:
	.asciz	"windowShouldClose:"

	.section	__TEXT,__objc_methtype,cstring_literals
l_OBJC_METH_VAR_TYPE_.3:
	.asciz	"B24@0:8@16"

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.4:
	.asciz	"windowDidChangeBackingProperties:"

l_OBJC_METH_VAR_NAME_.5:
	.asciz	"windowDidBecomeKey:"

l_OBJC_METH_VAR_NAME_.6:
	.asciz	"windowDidResignKey:"

l_OBJC_METH_VAR_NAME_.7:
	.asciz	"windowWillClose:"

l_OBJC_METH_VAR_NAME_.8:
	.asciz	".cxx_destruct"

	.section	__TEXT,__objc_methtype,cstring_literals
l_OBJC_METH_VAR_TYPE_.9:
	.asciz	"v16@0:8"

	.section	__DATA,__objc_const
	.p2align	3, 0x0
__OBJC_$_INSTANCE_METHODS_MACHWindowDelegate:
	.long	24
	.long	7
	.quad	l_OBJC_METH_VAR_NAME_
	.quad	l_OBJC_METH_VAR_TYPE_
	.quad	"-[MACHWindowDelegate windowDidResize:]"
	.quad	l_OBJC_METH_VAR_NAME_.2
	.quad	l_OBJC_METH_VAR_TYPE_.3
	.quad	"-[MACHWindowDelegate windowShouldClose:]"
	.quad	l_OBJC_METH_VAR_NAME_.4
	.quad	l_OBJC_METH_VAR_TYPE_
	.quad	"-[MACHWindowDelegate windowDidChangeBackingProperties:]"
	.quad	l_OBJC_METH_VAR_NAME_.5
	.quad	l_OBJC_METH_VAR_TYPE_
	.quad	"-[MACHWindowDelegate windowDidBecomeKey:]"
	.quad	l_OBJC_METH_VAR_NAME_.6
	.quad	l_OBJC_METH_VAR_TYPE_
	.quad	"-[MACHWindowDelegate windowDidResignKey:]"
	.quad	l_OBJC_METH_VAR_NAME_.7
	.quad	l_OBJC_METH_VAR_TYPE_
	.quad	"-[MACHWindowDelegate windowWillClose:]"
	.quad	l_OBJC_METH_VAR_NAME_.8
	.quad	l_OBJC_METH_VAR_TYPE_.9
	.quad	"-[MACHWindowDelegate .cxx_destruct]"

	.private_extern	_OBJC_IVAR_$_MACHWindowDelegate._windowDidResize_block
	.section	__DATA,__objc_ivar
	.globl	_OBJC_IVAR_$_MACHWindowDelegate._windowDidResize_block
	.p2align	2, 0x0
_OBJC_IVAR_$_MACHWindowDelegate._windowDidResize_block:
	.long	8

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.10:
	.asciz	"_windowDidResize_block"

	.section	__TEXT,__objc_methtype,cstring_literals
l_OBJC_METH_VAR_TYPE_.11:
	.asciz	"@?"

	.private_extern	_OBJC_IVAR_$_MACHWindowDelegate._windowShouldClose_block
	.section	__DATA,__objc_ivar
	.globl	_OBJC_IVAR_$_MACHWindowDelegate._windowShouldClose_block
	.p2align	2, 0x0
_OBJC_IVAR_$_MACHWindowDelegate._windowShouldClose_block:
	.long	16

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.12:
	.asciz	"_windowShouldClose_block"

	.private_extern	_OBJC_IVAR_$_MACHWindowDelegate._windowDidChangeBackingProperties_block
	.section	__DATA,__objc_ivar
	.globl	_OBJC_IVAR_$_MACHWindowDelegate._windowDidChangeBackingProperties_block
	.p2align	2, 0x0
_OBJC_IVAR_$_MACHWindowDelegate._windowDidChangeBackingProperties_block:
	.long	24

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.13:
	.asciz	"_windowDidChangeBackingProperties_block"

	.private_extern	_OBJC_IVAR_$_MACHWindowDelegate._windowDidBecomeKey_block
	.section	__DATA,__objc_ivar
	.globl	_OBJC_IVAR_$_MACHWindowDelegate._windowDidBecomeKey_block
	.p2align	2, 0x0
_OBJC_IVAR_$_MACHWindowDelegate._windowDidBecomeKey_block:
	.long	32

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.14:
	.asciz	"_windowDidBecomeKey_block"

	.private_extern	_OBJC_IVAR_$_MACHWindowDelegate._windowDidResignKey_block
	.section	__DATA,__objc_ivar
	.globl	_OBJC_IVAR_$_MACHWindowDelegate._windowDidResignKey_block
	.p2align	2, 0x0
_OBJC_IVAR_$_MACHWindowDelegate._windowDidResignKey_block:
	.long	40

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.15:
	.asciz	"_windowDidResignKey_block"

	.section	__DATA,__objc_const
	.p2align	3, 0x0
__OBJC_$_INSTANCE_VARIABLES_MACHWindowDelegate:
	.long	32
	.long	5
	.quad	_OBJC_IVAR_$_MACHWindowDelegate._windowDidResize_block
	.quad	l_OBJC_METH_VAR_NAME_.10
	.quad	l_OBJC_METH_VAR_TYPE_.11
	.long	3
	.long	8
	.quad	_OBJC_IVAR_$_MACHWindowDelegate._windowShouldClose_block
	.quad	l_OBJC_METH_VAR_NAME_.12
	.quad	l_OBJC_METH_VAR_TYPE_.11
	.long	3
	.long	8
	.quad	_OBJC_IVAR_$_MACHWindowDelegate._windowDidChangeBackingProperties_block
	.quad	l_OBJC_METH_VAR_NAME_.13
	.quad	l_OBJC_METH_VAR_TYPE_.11
	.long	3
	.long	8
	.quad	_OBJC_IVAR_$_MACHWindowDelegate._windowDidBecomeKey_block
	.quad	l_OBJC_METH_VAR_NAME_.14
	.quad	l_OBJC_METH_VAR_TYPE_.11
	.long	3
	.long	8
	.quad	_OBJC_IVAR_$_MACHWindowDelegate._windowDidResignKey_block
	.quad	l_OBJC_METH_VAR_NAME_.15
	.quad	l_OBJC_METH_VAR_TYPE_.11
	.long	3
	.long	8

	.p2align	3, 0x0
__OBJC_CLASS_RO_$_MACHWindowDelegate:
	.long	388
	.long	8
	.long	48
	.space	4
	.quad	l_OBJC_CLASS_NAME_.1
	.quad	l_OBJC_CLASS_NAME_
	.quad	__OBJC_$_INSTANCE_METHODS_MACHWindowDelegate
	.quad	0
	.quad	__OBJC_$_INSTANCE_VARIABLES_MACHWindowDelegate
	.quad	0
	.quad	0

	.section	__DATA,__objc_data
	.globl	_OBJC_CLASS_$_MACHWindowDelegate
	.p2align	3, 0x0
_OBJC_CLASS_$_MACHWindowDelegate:
	.quad	_OBJC_METACLASS_$_MACHWindowDelegate
	.quad	_OBJC_CLASS_$_NSObject
	.quad	__objc_empty_cache
	.quad	0
	.quad	__OBJC_CLASS_RO_$_MACHWindowDelegate

	.section	__DATA,__objc_classlist,regular,no_dead_strip
	.p2align	3, 0x0
l_OBJC_LABEL_CLASS_$:
	.quad	_OBJC_CLASS_$_MACHWindowDelegate

	.section	__DATA,__objc_imageinfo,regular,no_dead_strip
L_OBJC_IMAGE_INFO:
	.long	0
	.long	64

.subsections_via_symbols
