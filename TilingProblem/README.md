# Count the number of ways to tile the floor of size n x m using 1 x m size tiles

Given a floor of size n x m (up to 14) and tiles of size 1 x m. The problem is to count the number of ways to tile the given floor using 1 x m tiles. A tile can either be placed horizontally or vertically.
Both n and m are positive integers and 2 < = m.

Examples:

Input : n = 2, m = 3
Output : 1
Only one combination to place 
two tiles of size 1 x 3 horizontally
on the floor of size 2 x 3. 

Input :  n = 4, m = 4
Output : 2
1st combination:
All tiles are placed horizontally
2nd combination:
All tiles are placed vertically.
# FSMD
Basic Finite State Machine with Datapath (FSMD) example to count the number of ways to tile the given floor using 1 x m tiles.

## Install

These examples use [ModelSim&reg; and Quartus&reg; Prime from Intel FPGA](http://fpgasoftware.intel.com/?edition=lite), [GIT](https://git-scm.com/download/win), [Visual Studio Code](https://code.visualstudio.com/download), make sure they are installed locally on your computer before proceeding.

## Usage

1. Grab a copy of this repository to your computer's local folder (i.e. C:\projects):

    ```sh
    $ cd projects
    $ git clone https://github.com/Salem22/TilingProblem.git
    ```
2. Use Visual Studio Code (VSC) to edit and view the design files:

    ```sh
    $ cd TilingProblem
    $ code .
    ```
    Click on the toplevel.vhd file in the left pane to view its contents.
    
3. From the VSC View menu, choose Terminal, in the VCS Terminal, create a "work" library:

    ```sh
    $ vlib work
    ```
    
4. Compile all the design units:

    ```sh
    $ vcom *.vhd
    ```
    
5. Simulate your design. For example, if n = 7, sum = 4 then y = 5 :

    ```sh
    $ vsim work.tb
    ```
