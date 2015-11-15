/* See LICENSE file for copyright and license details. */

/* appearance */
#include "colors.h"
static const char font[]        = "Source Code Pro:pixelsize=14:antialias=true";
static const char* normbgcolor  = dark0;
static const char* normfgcolor  = light1;
static const char* selbgcolor   = dark2;
static const char* selfgcolor   = light1;
static const char before[]      = "<";
static const char after[]       = ">";
static const int  tabwidth      = 200;
static const Bool foreground    = True;

/*
 * Where to place a new tab when it is opened. When npisrelative is True,
 * then the current position is changed + newposition. If npisrelative
 * is False, then newposition is an absolute position.
 */
static int  newposition   = 0;
static Bool npisrelative  = False;

#define SETPROP(p) { \
	.v = (char *[]){ "/bin/sh", "-c", \
		"prop=\"`xwininfo -children -id $1 | grep '^     0x' | sed -e's@^ *\\(0x[0-9a-f]*\\) \"\\([^\"]*\\)\".*@\\1 \\2@' | xargs -0 printf %b | dmenu -fn \"Source Code Pro:pixelsize=14:antialias=true\" -nb \"#282828\" -nf \"#EBDBB2\" -sb \"#8F2F71\" -sf \"#EBDBB2\" -l 10`\" &&" \
		"xprop -id $1 -f $0 8s -set $0 \"$prop\"", \
		p, winid, NULL \
	} \
}

#define MODKEY ControlMask
static Key keys[] = { \
	/* modifier                     key        function        argument */
	{ MODKEY|ShiftMask,             XK_Return, focusonce,      { 0 } },
	{ MODKEY|ShiftMask,             XK_Return, spawn,          { 0 } },
	{ MODKEY,                       XK_t,      spawn,          SETPROP("_TABBED_SELECT_TAB") },

	{ MODKEY|ShiftMask,             XK_l,      rotate,         { .i = +1 } },
	{ MODKEY|ShiftMask,             XK_j,      rotate,         { .i = -1 } },
	{ MODKEY|ShiftMask,             XK_h,      movetab,        { .i = -1 } },
	{ MODKEY|ShiftMask,             XK_k,      movetab,        { .i = +1 } },
	{ MODKEY,                       XK_Tab,    rotate,         { .i = 0 } },

	{ MODKEY,                       XK_1,      move,           { .i = 0 } },
	{ MODKEY,                       XK_2,      move,           { .i = 1 } },
	{ MODKEY,                       XK_3,      move,           { .i = 2 } },
	{ MODKEY,                       XK_4,      move,           { .i = 3 } },
	{ MODKEY,                       XK_5,      move,           { .i = 4 } },
	{ MODKEY,                       XK_6,      move,           { .i = 5 } },
	{ MODKEY,                       XK_7,      move,           { .i = 6 } },
	{ MODKEY,                       XK_8,      move,           { .i = 7 } },
	{ MODKEY,                       XK_9,      move,           { .i = 8 } },
	{ MODKEY,                       XK_0,      move,           { .i = 9 } },

	{ MODKEY,                       XK_q,      killclient,     { 0 } },

	{ 0,                            XK_F11,    fullscreen,     { 0 } },
};
