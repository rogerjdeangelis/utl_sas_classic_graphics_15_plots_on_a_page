SAS classic graphics 15 plots on a page

For SAS progranmmers.

see graph
https://tinyurl.com/yawolrwy
https://github.com/rogerjdeangelis/utl_sas_classic_graphics_15_plots_on_a_page/blob/master/sas_classic_graphics_15_plots_on_a_page.pdf


github
https://tinyurl.com/y846qluk
https://github.com/rogerjdeangelis/utl_sas_classic_graphics_15_plots_on_a_page

INPUT
=====

15 groups with 11 (x,y) pairs per group


Variable      Levels
--------------------
ROW                5
COL                3


Up to 40 obs from have total obs=165

Obs    ROW    COL    DAY      HGB

  1     0      0       0     9.9057
  2     0      0       1     7.3348
  3     0      0       2     8.1488
  4     0      0       3     8.3650
  5     0      0       4    13.4846
...

EXAMPLE OUTPUT

/*  Here is what the output should look like. All we need to do is define horigin and vorigin
          *---------*           *---------*           *---------*
          *         *           *         *           *         *
          *         *           *         *           *         *
          *         *           *         *           *         *
          *---------*           *---------*           *---------*
  horigin=0 vorigin=8   horigin=3 vorigin=8   horigin=6 vorigin=8


          *---------*           *---------*           *---------*
          *         *           *         *           *         *
          *         *           *         *           *         *
          *         *           *         *           *         *
          *---------*           *---------*           *---------*
  horigin=0 vorigin=6   horigin=3 vorigin=6   horigin=6 vorigin=6


          *---------*           *---------*           *---------*
          *         *           *         *           *         *
          *         *           *         *           *         *
          *         *           *         *           *         *
          *---------*           *---------*           *---------*
  horigin=0 vorigin=4   horigin=3 vorigin=4   horigin=6 vorigin=4


          *---------*           *---------*           *---------*
          *         *           *         *           *         *
          *         *           *         *           *         *
          *         *           *         *           *         *
          *---------*           *---------*           *---------*
  horigin=0 vorigin=2   horigin=3 vorigin=2   horigin=6 vorigin=2


          *---------*           *---------*           *---------*
          *         *           *         *           *         *
          *         *           *         *           *         *
          *         *           *         *           *         *
          *---------*           *---------*           *---------*
  horigin=0 vorigin=0   horigin=3 vorigin=0   horigin=6 vorigin=0

*/


PROCESS
=======

options orientation=portrait;
ods pdf file="d:/pdf/&pgm..pdf" startpage=never;
*ods proclabel "15 plots";
goptions
   reset=global
   device=pdf
   rotate=portrait
   vsize=1.8in
   hsize=2.in
   htext=1
;

title move=(3,10)in h=5 "15 Plots";run;
%Macro PltDzn;
  %Do Row=0 %to 8 %by 2;     /* 5 rows same code as datastep above */
    %Do Col=0 %to 6 %by 3;   /* 3 cols */
     symbol1 i=join v=none;
     Proc Gplot data=have(Where=(Row=&Row. and Col=&Col.));
     goptions vorigin=&Row.in horigin=&Col.in;  /* position plots on the page */
     Plot Hgb*Day / noframe;
     Run;
     quit;
     title;run;
   %End;
  %End ;

%mend PltDzn;

%PltDzn;

ods pdf close;


OUTPUT
======

see graph
https://tinyurl.com/yawolrwy
https://github.com/rogerjdeangelis/utl_sas_classic_graphics_15_plots_on_a_page/blob/master/sas_classic_graphics_15_plots_on_a_page.pdf


*                _               _       _
 _ __ ___   __ _| | _____     __| | __ _| |_ __ _
| '_ ` _ \ / _` | |/ / _ \   / _` |/ _` | __/ _` |
| | | | | | (_| |   <  __/  | (_| | (_| | || (_| |
|_| |_| |_|\__,_|_|\_\___|   \__,_|\__,_|\__\__,_|

;

/* Create The Data */
Data have;
   /* Number the rows and columns for easy plotting */
   /* Row and column provide the position for the profile plots */
   Do Row=0 to 8 by 2;     /* 5 rows */
     Do Col=0 to 6 by 3;   /* 3 cols */
       /* Create the time profiles */
       Do Day=0 to 10;
        Hgb=6+10*uniform(-1);
        Output;
       End;
     End;
   End;
Run;


*          _       _   _
 ___  ___ | |_   _| |_(_) ___  _ __
/ __|/ _ \| | | | | __| |/ _ \| '_ \
\__ \ (_) | | |_| | |_| | (_) | | | |
|___/\___/|_|\__,_|\__|_|\___/|_| |_|

;

see process



