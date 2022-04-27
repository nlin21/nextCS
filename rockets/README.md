EXTENSIONS:
- "continuous mode" can be toggled with the AUTO boolean at the top of the driver file

Name: Nicky Lin
Pd: 03

Rocket Lab Design Questions:
What parts of Gene, Individual and Population can be used exactly as they already are written? Why?
  All of them will have to be adjusted to encode the properties of each rocket and their motion, but the general structure of them might remain the same.

What parts of Gene, Individual and Population will need to be modified? How will you modify them?
  Each Gene will have encoded values for the magnitudes and angles of each rocket's move. The gene lengths might change as well. The Individual class's setFitness() method will have to be adjusted.

How are you going to use Gene objects to encode the angles and magnitudes of each move?
  Each Gene can have int[] arrays containing all of the randomly generated magnitudes and angles.

How is the main driver file going to differ from the regulargon version?
  There is no need for a grid, and all of the rockets will start at the same place. The keyboard inputs will still be necessary, but they will spawn the next generation of rockets.
