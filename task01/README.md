# BLIS DGEMM Matrix Multiplication Performance Benchmark

This repository contains the architecture-specific performance benchmarking analysis for dense matrix-matrix multiplication (`DGEMM`) using the BLIS framework. 

* **Active Calculation Tracker Spreadsheet:** [Google Sheets Performance Data Notebook](https://docs.google.com/spreadsheets/d/1ow5p6p6nENC_or6UWG4Ea7x0Sc_5yE_Gzeiz-vaCWXE/edit?usp=sharing)

---

i started by understanding the fundamentals of my benchmarking , learned what are flops why are they important , how to calculate them for any algorithm , in this case specifically for the matrix multiplication algorithm.

Than i learned how to use bli_dgemm for matrix to matrix multiplication , what and how to pass the parameters to that function .

After this i wrote the generic code in c which takes the matrix size on run time and allocates the three matrix , A B and C and i allocated the values to A and B using two different rand() so that they dont get the same values intentionally so that we can avoid bias in our analytical data , than i added the script whose sole purpose was to pass the matrix size as parameter and run for each of it 10 times using all available threads of my machine(12 in my case ) and i recorded the time time only for calculation not for allocation and deallocation


Got  the .csv after the execution , i monitered the ram , cpu and threads on my ubuntu machine on system moniter and for recording the temperature i setuped the psensor and analyzed the temperature for each thread of my machine and along with their peak / minimum and avg for individual and collective threads 
and after this all execution i formatted the .csv into an excel file with proper graphs and hurdles and crashes that i had over all those updated iterations and analysis 

That's all about my task 01 
