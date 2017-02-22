From: http://personal.psu.edu/jcc8/software/latexmk-jcc/versions.html

Latexmk: current and previous versions

    V. 4.52c dated 19 January 2017.
        When the -pdflua or -pdfxe option is used, the -jobname option now works.
    This version is on CTAN at http://www.ctan.org/pkg/latexmk/.
    V. 4.52b dated 17 January 2017.
        For xelatex, detection that graphics file is missing and can be made by a custom dependency now works just it does for other latex engines.
        Optimize number of calls to kpsewhich. This often gives a considerable savings of run time when a document includes many graphics files that are in a texmf tree.
        Fix bug that if an .aux file is deleted and latexmk is run, the wrong number of runs of (pdf)latex is made.
        Fix related problem that latexmk sometimes does too few runs of (pdf)latex because of the incorrect detection that a file is only read after being written.
        Implement direct support for xelatex and lualatex. Previously these programs were used by configuring the $pdflatex so that the desired program is run instead of pdflatex. There are now configuration variables $xelatex and $lualatex to specify the commands used, and extra command line options -pdfxe and -pdflua.
        In the case of xelatex, considerable improvement in run time is given for documents containing large graphics files. This is because compilation is made first to an xdv file instead of direct to a pdf file. Only when this file is finalized is a single conversion to a pdf file made. (This last step can be especially time-consuming for documents that bring in large graphics files.)
        Update documentation.
        Work around LuaTeX line-wrapping bug.
        Minor improvements in code and diagnostics.
        (Fix bug introduced in initial release, as 4.52, that use of bibtex wasn't always detected when recorder mode is on. The detection now appears to be correct.)
    V. 4.48 dated 5 September 2016.
        Correct creation of output and aux directories to correctly handle relative paths when -cd is used.
        Add routines rdb_list_source, rdb_set_source for manipulating dependency lists of a rule. Add these to the documentated interface, in addition to the already documented rdb_ensure_file, rdb_remove_files.
        Correct documention: default value of $recorder is 1.
        Update webpages in documentation.
    V. 4.45 dated 22 April 2016.
        Fix problem of -C not always working correctly when compilation was with -pdf and clear was default.
        Fix bug in limiting number of passes when $max_repeat >= 10
        Fix bug in finding id of viewer process id under OS-X
    V. 4.44 dated 24 February 2016.
        Correct error handling when biber finds a malformed bcf file. (Previously latexmk didn't automatically recover from error situation after the source files had been corrected.)
        Correct bug in use of %hash_calc_ignore_pattern (Previously it only had its documented effect when a targetted file hadn't changed in size.)
    V. 4.43a dated 5 February 2015.
        On cleanup, synctex.gz files are deleted only by -C, not by -c.
    V. 4.43 dated 26 January 2015.
        Fix problem that source files are not correctly detected under MiKTeX when name of current working directory contains non-ASCII characters.
    V. 4.42 dated 10 January 2015.
        Fix bugs associated with the -cd option
        Add missfont.log and the generated synctex.gz to standard cleaned-up files
    V. 4.41 dated 1 January 2015.
        -c also deletes $deps_file if it is used.
        When -jobname option is used, quote it on command line.
        Change maintainer's preferred e-mail.
        Attempt to improve handling of errors from (pdf)latex.
        Fix up for the making of -eps-converted-to.pdf
        Improve listing of warning lines from log file.
        Fix failure when using both -cd and -output-directory
        If user's home directory can't be determined, then don't read ~/.latexmkrc
        Introduce configuration variable $silence_logfile_warnings
        In setting $pscmd, allow for non-existent environment variable USER
        System initialization files: allow them to be named latexmkrc as well as LatexMk, for more consistency with user directory names.
        Miscellaneous corrections.
    V. 4.40 dated 15 January 2014.
        Fix failure to clean up correctly when root filename contains certain special characters in it (notably '['). [Technical issue: these characters had special meaning when previously interpreted as metacharacters in a glob operation.]
    V. 4.39 dated 10 November 2013, with documentation update on 3 December 2013.
        Automatic creation of necessary subdirectories of auxdir when needed for writing aux files.
        Add error diagnostics to if_source
        Allow $print_type = 'auto', and make this the default, so that when the -p option to latexmk is used to print the file, the default is to determine the type of file to be printed, rather than always requiring postscript.
        Fix the failures when dealing with directories whose names contained certain special characters in them (notably '[', ']' and space). [Technical issue: these characters had special meaning when previously interpreted as metacharacters in a glob operation.] This gives dependency on Perl's File::Glob module, which is a standard module in normal installations of Perl.
        When an output directory is a subdirectory of a directory, ensure that it is correctly created, if it has to be created. Previously, the creation of the output directory when it does not exist only worked for one level. This gives dependency on Perl's File::Path module with v. >= 2.08, which is a standard module in normal installations of Perl.
        In output of dependencies, include pathname of target file(s) in the rule.
        In -pvc mode, writing of deps file (caused by the -M and related options) is per make not per overall run.
    V. 4.37 dated 2 July 2013.
        Correct failure that happens when name of current directory contains characters with special meaning in regular expression.
        -rules option now works with -pvc
        Add -lualatex option, like -xelatex.
        File specifications in $clean_ext and $clean_full_ext are allowed to contain wildcards.
        Warning is given when rc file is a directory instead of a file.
        Correct bug that if revtex4-1.cls is used, footnotes are set to be in the bibliography, and latexmk's aux_dir or out_dir is set, then latexmk fails to run bibtex when needed, because the relevant bib file is not found.
        Other minor corrections and code improvements.
        Documentation updates and corrections.
    V. 4.35 dated 11 November 2012.
        Corrects bug that fls file is incorrectly parsed when using a combination of cygwin and a native MS-Windows TeX program.
        Corrects bug that old dependency information was retained when using the --gg option.
    V. 4.34 dated 1 October 2012.
        Corrects non-optimality that latexmk may do extra runs of (pdf)latex when a file is read and written during a run of (pdf)latex, but the file is only read after being written.
    V. 4.33c dated 19 August 2012.
        Corrects infinite loop in error messages when the maximum number of passes through latex/pdflatex is exceeded.
    V. 4.33b dated 12 August 2012.
        Documentation improvements, including documentation of the many options for the (pdf)latex programs that are supported by latexmk.
    V. 4.33a dated 8 August 2012.
        Fix slowness of v. 4.33 under Cygwin.
    V. 4.33 dated 6 August 2012.
        Improve operation under MSWindows: substitute "\" for "/" for directory separator in command lines, deal consistently with directory separator, which can be both "\" and "/".
        Correct some bugs that interfered with use of auxiliary directory and output directory for files generated by (pdf)latex, especially with MiKTeX.
        Fix problems caused because in the log and fls files MiKTeX writes absolute path for many filenames at and below current directory, and is inconsistent in its use of "/" vs. "\" as directory separator.
        Add $dvipdf_silent_switch configuration variable.
        Improve handling of errors in (pdf)latex; previously latexmk would give up processing in some situations continuing is correct.
        Documentation corrections/improvements.
        Reduce number of warnings in silent operation.
    V. 4.31 dated 30 March 2012.
        Implement most options allowed by latex and pdflatex.
        Add -M -MP and -MF options, like gcc.
        Recorder option is now on by default.
        Add -latexoption=... option to latexmk.
        Add -xelatex option for use of xelatex.
        Change OS-X default for pdf previewer command to open.
        Command specification string can start with "include routine" to invoke a Perl subroutine instead of an external cmd.
        Viewers are detached by default. (The start keyword is now normally superfluous in command specifications.)
        Keyword nostart added in command specification.
        Add configuration variables $compiling_cmd, $success_cmd, $failure_cmd. These specify external commands (if any) to be executed during latexmk's continuous preview mode at the following points: $compiling_cmd at the start of compilation, $success_cmd at the end of a successful compilation, and $failure_cmd at the end of an unsuccessful compilation. They can be used, for example, to show the progress of compilation by setting the titles of editor and/or previewer windows.
        If aux and/or output directories are specified but don't exist, make them.
        Remove excessive repetition of tests for changes of source files (improves performance of latexmk in some situations).
        Documentation improvements.
        Minor bug corrections.
    V. 4.30a dated 9 December 2011.
        Fix use of bibtex so that it works correctly when $aux_dir and/or $out_dir are set.
        Use OS-dependent search path separator when when manipulating TEXINPUTS, etc. Then use of -output-directory and -aux-directory options should work correctly on MSWin systems.
        Documentation of $search_path_separator variable.
        Correct some bugs in v. 4.30 that manifested themselves under MSWin especially with Cygwin.
    V. 4.29a dated 7 December 2011.
        Latexmk now works with the feynmp package and mpost, provided a suitable custom dependency is defined. (See the example latexmkrc fragment mpost_latexmkrc in the example_rcfiles directory in the latexmk distribution.)
        If output directory is set, arrange that dvips can find files there.
        In searching for cus-deps that can make a missing file, look in $out_dir.
    V. 4.28c dated 1 December 2011.
        When biber doesn't find the bib file, latexmk treats this as a warning rather than a fatal error, so further processing can continue normally.
        Latexmk now parses correctly error messages from biber v. 0.9.7.
    V. 4.28a dated 28 November 2011.
        Correct handling of situations where some file(s) needed by bibtex (or biber) don't exist. Previously latexmk incorrectly stopped with an error message instead of continuing.
        Correct duplicate invocations of dvipdf, ps2pdf
    V. 4.27a dated 10 October 2011.
        Deal with problem that making of ps or pdf file via a temporary file fails if the command making it has no %D placeholder
        Add png to list of graphics extensions for pdflatex
        Add -norc option that prevents auto reading of rc files.
        Options -aux-directory -output-directory like those of (pdf)latex, to set the output directories of (pdf)latex. (-aux-directory is MiKTeX only). Corresponding configuration variables, and placeholders for command specification.
    V. 4.26 dated 9 August 2011.
        Make compatible with biber 0.9.4.
        Fix some bugs in error reporting.
    V. 4.25 dated 7 July 2011.
        Fix to evade apparent cygwin bug that prevented system rc-file from being read.
        Diagnostic for unreadable rc-file.
        Add deps output file to target part of dependency information.
    V. 4.24 dated 7 May 2011.
        When running biber, find locations of source files when they aren't in the current directory (by use of kpsewhich). This was previously done for bibtex but not biber.
    V. 4.23a dated 24 March 2011.
        Correct bug in detection of source files listed in .fls file
    V. 4.23 dated 21 March 2011.
        Correctly parse blg files of biber 0.8.
        Deal with problem that if maximum number of runs of (pdf)latex is exceeded, -pvc mode infinitely repeats (pdf)latex.
        Fix problem that changes in generated files during run of (pdf)latex may not be detected if the run is shorter than the granularity of file times.
        Corrections of comments and messages.
        Documentation improvement.
        Correct handling of errors given by rc files.
        Enhancements for convenient use of latexmk with Makefiles (options -deps, -deps-out, -use-make).
        -recorder option for improved detection of input and output files.
    V. 4.22e dated 3 February 2011.
        Fix incorrect error handling in reading initialization files. (Sometimes an error was incorrectly detected, after which latexmk stopped.)
    V. 4.22d dated 26 January 2011.
        Fix compatibility problem MiKTeX v. 2.8, that latexmk didn't always detect use of makeindex.
    V. 4.22c dated 23 January 2011.
        Make detection of use of biber compatible with MikTeX
    V. 4.22b dated 9 January 2011.
        Make compatible with biber 0.7.2. (Latexmk previously failed to detect .bib files used by biber 0.7.2.)
    V. 4.22 dated 1 January 2011.
        Support the use of biber (with the biblatex package) as an alternative to bibtex for generating bibliographies, with automatic determination of whether to use bibtex or biber.
    V. 4.21 dated 28 December 2010.
        Fixed some problems with parsing quoted filenames in log file. These prevented latexmk working correctly with latest version of asymptote.sty.
        Corrected potential bug in locating graphics files.
    V. 4.20 dated 12 November 2010.
        Fix problem that when bibtex finds no citations, this is treated by bibtex as an error. Previously latexmk respected this and did not continue processing. Now if the only bibtex error is the finding of no citations, then latexmk now treats it as only a warning and continues processing (by latex/pdflatex) as appropriate.
        Get .bst file in source file list for bibtex. (So an update to the bst file provokes a rerun of the relevant programs.)
        Allow clean-up to delete destination files of custom-dependencies Configuration variable $cleanup_includes_cusdep_generated to configure whether this is done. (Default is off, for backward compatibility.)
        Remove use of --width option on $pscmd on linux. It's no longer needed.
        Remove double quotes (if any) surrounding output filename read from .log file, to avoid wrong diagnostic message.
        Allow a more general pattern for files to clean up (when the -c, or -C option is used). For details, see the explanation of the $clean_ext variable in the latexmk documentation.
        Options to set commands used for latex and pdflatex, as in

                    -latex=special_latex_replacement_command
                    -pdflatex=special_pdflatex_replacement_command


        (This is not yet documented.)
    V. 4.18 dated 27 July 2010.
        Only produce "Removing no-longer-needed dependent" messages when diagnostics are on.
        In analysis of log file, add test for natbib's citation-undefined warning
        Correct misprint in documentation.
    V. 4.17 dated 9 June 2010.
        Deal with bug about misparsing log file with non-space-containing filename that is followed by a space and a message on same line. Previously, the filename would not be detected as a dependent.
        With force_mode on, do a better job of completing processing.
        Remove obsolete options -F and -F-, which have been unused for a long time.
    V. 4.16a dated 18 May 2010.
        Sanity check on $sleep_time. (Negative times and times between 0 and 1 are replaced by 1.)
        Corrected problem under preview-continuous mode that some previewers would not see the changed file on an NFS file system.
    V. 4.16 dated 10 May 2010.
        Solved a problem with misparsed log files. Some versions of pdflatex fail to preceed some warning messages by a new line. Thus these warning messages sometimes appear to be part of a filename.
        Updated documentation to mention previously undocumented feature about the use of temporary files in making ps and pdf files.
    V. 4.15c dated 19 April 2010.
        Solved problem that occasionally latexmk failed to detect a dependent file when it analyzed a .log file. (It incorrectly treated some lines of length 79 as being wrapped.)
    V. 4.15b dated 12 April 2010.
        Change in use of Digest module to make latexmk compatible with the perl system (tlperl) installed by TeX Live.
        Under cygwin, additions to locations searched for system rc file, to give more UNIX compatibility.
    V. 4.15 dated 7 April 2010.
        Changes of default settings for running latex and pdflatex with latexmk's -quiet option; they are now TeX-Live compatible for all OSs.
        Small improvements in diagnostics and error handling.
    V. 4.13a dated 16 January 2010.
        This corrects a bug in v. 4.13 that when using the option -C to delete generated files, certain files were not actually deleted.
    V. 4.13 dated 13 January 2010.
        Corrections (to dealing with clean-up of generated files).
        Default for running bibtex: Only run bibtex when .bib file exists.
    V. 4.12 dated 15 December 2009.
        Added an option not to run bibtex (to deal with situations where a bbl file is available but not the bib file from which it was made).
        Corrected misprints in documentation.
        (Dec. 24, 2009) Corrected more misprints in documentation.
    V. 4.11 dated 27 November 2009.
        Corrects a long-standing bug that when the main file uses bibtex, and uses \include for subdocuments and the set of included files changes, latexmk did not update the list of source files for bibtex. Then changes in bibliography citations did not always trigger a rerun of bibtex.
        Fixed a problem that latexmk did not detect changed aux files and the like on a small document when the run of (pdf)latex was within the 1-second granularity of filetimes.
        Improved start-up times on some large documents by avoiding unnecessary recalculations of md5 checksums.
    V. 4.10d dated 10 September 2009.
    Attempt to deal better with conversions reported by epstopdf, when the converted file appears not to exist. (Do a kpsewhich search.)
    When view files are make via a temporary file (not-yet-documented feature), delete old view file before moving the temporary file. (To avoid reported bug in kpdf and okular.)
    V. 4.10b dated 4 September 2009. The -silent option now causes certain non-existent-file messages to be suppressed.
    V. 4.10a dated 1 September 2009. Corrects a problem that with an error introduced at v. 4.08 that on finding an error in processing one file latexmk exits rather than continuing processing other requested files. The exit code returned by latexmk was also incorrect in this situation.
    V. 4.10 dated 21 August 2009.
    V. 4.09a dated 19 August 2009. Small update to v. 4.09a, which should not affect anything.
    V. 4.09 dated 18 August 2009. Appropriate treatment of graphics files converted by current version of epstopdf package. Plus minor bug fixes. This version has not been tested thoroughly.
    V. 4.08 dated 23 June 2009. Corrects problem caused by MikTeX 2.7 writing log files containing binary characters, including ctrl/Z. When latexmk reads the log file to get dependency information, a ctrl/Z causes a premature end-of-file condition. On MS-Win, latexmk now reads the log file in binary mode.
    V. 4.07 dated 27 May 2009. Corrects problem that ctrl/C used to exit from preview-continuous mode always killed any script used to call latexmk. Deals better with situation that a run of (pdf)latex does not produce the expected dvi or pdf file.
    V. 4.05 dated 10 April 2009.
    V. 4.04 dated 25 February 2009. Corrects problems when latexmk is used to run both latex and pdflatex on the same source file. The problems were particularly noticeable when different choices were used on different runs.
    V. 4.03 dated 22 December 2008. Corrects issue in parsing the log file. Sometimes lines were treated as wrapped when they shouldn't have been; this occasionally resulted in latexmk not detecting source files.
    V. 4.02b dated 1 December 2008. Corrects issue with clean-up options -c and -C. They now delete the database file of source file information.
    V. 4.02a dated 26 November 2008. Corrects problem with using start command under MSWin in default commands for viewing files: MSWin took quoted filenames to mean window title instead of filename.
    V. 4.02 dated 15 November 2008. Corrects problem with misreading of log files generated by current MikTeX (v. 2.7) that puts double quotes around space-containing filenames.
    V. 4.01b dated 10 November 2008.
    V. 3.20 dated 17 August 2007.
    V. 3.08n dated 26 February 2007.
    V. 3.07a dated 2 June 2004.
    V. 3.07 dated 14 May 2004.
    V. 3.06d dated 2 Mar. 2004.
    V. 3.06c dated 17 Jun. 2003.
    V. 3.06 dated 22 Oct. 2002.
    V. 3.04 dated 24 Nov. 2001.
    V. 2
    Current main release is also on CTAN at http://www.ctan.org/pkg/latexmk/

Latexmk home page.
This page is maintained by John Collins, jcc8@psu.edu 31 January 2017
