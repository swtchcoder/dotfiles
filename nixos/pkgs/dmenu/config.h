/* See LICENSE file for copyright and license details. */
/* Default settings; can be overriden by command line. */

static int topbar                        = 1;                      /* -b  option; if 0, dmenu appears at bottom     */
/* -fn option overrides fonts[0]; default X11 font or font set */
static const char *fonts[]               = {
	"MesloLGM Nerd Font:size=13"
};
static const char *prompt                = NULL;      /* -p  option; prompt to the left of input field */
static const char col_normfg             = "#fbf1c7";
static const char col_normbg             = "#282828";
static const char col_selfg              = "#1d2021";
static const char col_selbg              = "#98971a";
static const char *colors[SchemeLast][2] = {
	/*               fg         bg */
	[SchemeNorm] = { col_normfg, col_normbg },
	[SchemeSel]  = { col_selfg,  col_selbg  },
	[SchemeOut]  = { col_normfg, col_normbg },
};
/* -l option; if nonzero, dmenu uses vertical list with given number of lines */
static unsigned int lines                = 0;

/*
 * Characters not considered part of a word while deleting words
 * for example: " /?\"&[]"
 */
static const char worddelimiters[] = " ";
