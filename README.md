SmartLens
===

SmartLens is a passive, batteryless, and non-operative eye movement monitoring system by using RFID technology. 

PSO is an auxiliary algorithm in our antenna design process, which is used to select the designated antenna structure parameters. It effectively reduces the time and computational power consumption, when facing multiple structure parameters adjustment.

## Prepare

Before running, check the following conditions :

1. The parameters of material  

   a. For example, SmartLens uses PDMS as the substrate, its relative permittivity is 2.75, and its dielectric loss tangent is 0.05.

2.  Make sure the result, script, and array folders, which are under the current path, are empty or do not exist

3. Make sure there is a High Frequency Structure Simulator (HFSS) model in the current folder
   that can be simulated correctly  

   ​    The simulation model is designed for dedicated situation. For example, in Smartlens, there
   are two models, one is the Smartlens without eye model, and the other is the Smartlens
   with eye model. The two models are mainly composed of seven parameters D1-D7. The
   meanings of the parameters are listed below :  

   - D1：The width of the first ring from the outside to the inside
   - D2: The width of the second ring from the outside to the inside
   - D3: The width of the third ring from the outside to the inside
   - D4: The opening size of the first circle from the outside to the inside
   - D5: The width of the connecting part between adjacent circles
   - D6: The distance between the first circle and the second circle from outside to inside
   - D7: The distance between the second circle and the third circle from the outside to the inside

## Software

Smartlens runs on the following softwares :

1. Matlab 2019
2. Ansys Electronics Suite 2021 R1

We did not check the compatibility between the different versions, changing the
version may cause errors.  

## Guide

1. Meaning of the file :

   - result folder: Store the real and imaginary parts of impedance data exported from the optimized antenna structure  

   - array: Store the HFSS model after population initialization

   - script: Store the script file used to run HFSS  

   - parameter: Store the structure parameters that fit the conditions

2. Function introduction :

   - `pso.m`: Main program. Calculates new iteration parameters based on the returned fitness 

   - `calfit.m`:  Calculate the fitness function

   - `copyArray.m`: Copy the model and initialize the population

   - `getData.m`: Get the  structure parameters that meet the condition

   - `hfssExecute.m`: Invoke HFSS to execute
   - `makeScript.m`: Generate the HFSS execution scripts
   - `islegal.m`: Determine whether the parameters are under the restriction  

3. eye.sab : eyeball model





## Use Flow

Before you start this process, make sure all the preparations are complete :

- Step1 : Modify the path of the Ansys Electronics Suite application software
- Step2 : Modify the model name in `copyArray.m`
- Step3 : Run `pso.m`



## <span id='Notes'>Notes</span>

Some issues may arise when running SmartLens, including but not limited to :

- When the HFSS model reports the error 'port non-planar', you may need to fine-tune the port structure parameters;
- When matlab import data error, you need to add a 30 sec break after export the parameters.  

