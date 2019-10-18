# Tuning paramteters of Task 2

We started by finding paramters that worked for each of the two models separately.
We then tried these parameters using the full IMM-PDAF before tuning them some more using trial and error.
The values were chosen so that both posRMSE and velRMSE where as low as possible while at the same time keeping the NEES'es inside the confidence bounds.
The PI matrix was chosen to convince the filter to switch between models at appropriate times.
