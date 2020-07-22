**Muxi** project is an endeavor to prototype preprocessor's API of the open-source full-featured domain-specific CAE system for electron beam optics design in 2D.
 
In its current stage muxi provides basic preprocessing capabilities, such as defining electron gun outlines as structures, containing outline key points with attributes for point adjacency tracking and electrostatic potential definition.

main.m &mdash; contains basic electron gun (EGun) model definition and color presets. This is an entry point of the program. 

aliases.m &mdash; contains function handles definitions, which serve as API shortcuts and can be used interactively in Matlab's session.

**ux/** directory contains files, which implement muxi's API.

## Getting start
**Start MUXI** To run **muxi** you must call main script by typing in Matlab command window:

`>> main`

Hitting **Return** runs the main process. You should see a figure with sample electron gun (EGun) outline. If something goes wrong, check your current working directory with *pwd*, you must be in the root directory of the project (containing main.m and aliases.m scripts). If you cannot succeed, don't hesitate to contact me and report a problem.

## Examples

**Example 1** 

To pick points 4 and 5 you have to type command:

`>> pp([4 5])`

It calls *pickPoints(Ids)* function and adds provided indices of  to the Cart, so you can interact with corresponding points.

**Example 2** 

To move picked points to the new position (e.g. rise picked points position by 0.5 mm) you need to call *movePointsRelative(dz, dr)* function. You can do this by typing:

`>> mvr(0, 0.5)`

**Example 3** 

To drop previously picked points call *dropPoints(Ids)* function with:

`>> dp([4 5])`

It will clear the Cart, so you could pick others.

**Example 4.** 

To drop all previously picked points call *clearCart()* function with:

`>> cc()`

It will clear the Cart, so you could pick others.