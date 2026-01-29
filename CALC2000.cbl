       identification division.

       program-id. calc2000.
      *  Programmer.: Clay Rasmussen
      *  Date.......: 01.27.2026
      *  Github URL.:
      *  https://github.com/Clay-Rasmussen/COBOLCALC2000
      *  Description: This program calculates future values for an
      *  investment and doubles the investment amount twice.

       environment division.

       input-output section.

       data division.

       file section.

       working-storage section.

       01  input-values.
           05  investment-amount           pic 99999    value 1000.
           05  number-of-years             pic 99       value 10.
           05  yearly-interest-rate        pic 99v9     value 5.5.

       01  work-fields.
           05  future-value                pic 9(7)v99.
           05  year-counter                pic 999.

           05 edited-whole-value           pic zz,zzz,zz9.
           05 edited-decimal-value         pic zzz,zzz.99.
           05 edited-interest-rate         pic zzz,zzz9.9.
           05 edited-number-of-years       pic zzz,zzz,zz.

       procedure division.

      *  In this paragraph we do the heavy lifting of the calculations.
      *  We display the opening to the program, add some space,
      *  and perform the future calculation value. Then the investment
      *  amount doubles and the process happens two more times. The 
      *  paragraph ends after the 3 value calculations displays the 
      *  end of the report, then stops running.
       000-calculate-future-values.
           display "Calculating Future Values".
           display space.
           perform 100-calculate-future-value.
           compute investment-amount =
              investment-amount * 2
           perform 100-calculate-future-value
           compute investment-amount =
               investment-amount * 2
            perform 100-calculate-future-value
           display "End of Calculations".
           stop run.

      *  In this paragraph we start by moving the investment-amount to
      *  the future value and moving 1 into the year-counter. Next,
      *  the program performs the 120 paragraph until the year-counter
      *  is greater than the number of years we desire. Finally, the 
      *  paragraph ends by perfoming the 140 paragraph to display
      *  the values.
       100-calculate-future-value.
           move investment-amount to future-value
           move 1 to year-counter
           perform 120-calculate-next-fv
               until year-counter > number-of-years
           perform 140-display-values.

      *  In this paragraph we compute the next-fv in a rounded value,
      *  and we do the math to multiply the future-value and the 
      *  yearly interest rate then divide them by one hundred. This 
      *  paragraph finishes by adding 1 to the year counter.
       120-calculate-next-fv.
           compute future-value rounded =
               future-value +
                   (future-value * yearly-interest-rate / 100).
           add 1 to year-counter.

      *  This paragraph does the heavy lifting of the output. We start
      *  by moving all of out working values to edited working values
      *  so we can display them neatly. The paragraph then displays all
      *  of the information needed for the outputs of the three 
      *  different computations.
       140-display-values.
           move future-value to edited-decimal-value.
           move investment-amount to edited-whole-value.
           move yearly-interest-rate to edited-interest-rate.
           move number-of-years  to edited-number-of-years.
           display "Investment Amount : " edited-whole-value
           display "Number of Years   : " edited-number-of-years
           display "Yearly Interest   : " edited-interest-rate
           display "Future Value      : " edited-decimal-value
           display "-------------------------------".
           display space.