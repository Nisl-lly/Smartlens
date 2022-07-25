PSO_HFSS
===

An Implementation of Antenna Optimization Using PSO Algorithm Combined with Matlab and HFSS



## Description

- result folder: Store the Z11 data after running the parameter values that meet 						the conditions 
- array: Store the HFSS model after population initialization
- script: Store the script file that runs HFSS
- parameter: Store the parameter values that meet the conditions

## Requirements

1. Make sure the following folders are empty before each run
   - result
   - array
   - script
2. Make sure you have an HFSS model

## Run

run `pso.m`

`pso.m`: main program

`calfit.m`:  Calculate the fitness function

`copyArray.m`: Copy the model, initialize the population

`getData.m`: Get the parameter value that satisfies the condition

`hfssExecute.m`: Invoke HFSS to execute

`makeScript.m`: Writing HFSS execution scripts

`islegal.m`: Determine whether the parameter is legal






## DISCLAIMER

Feel free to use the code as you see fit; I accept no responsibility
for any damage/catastrophy that might occur as a result :)
