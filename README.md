**Muxi** project is an endeavor to prototype API for the open-source full-featured domain-specific CAE system for electron beam optics design in 2D.
 
In its current stage muxi provides basic preprocessing capabilities, such as defining electron gun outlines as structures, containing outline key points with attributes for point adjacency tracking and electrostatic potential definition.

main.m -- contains basic electron gun (EGun) model definition and color presets. This is an entry point of the program. You must call this script typing in Matlab command window:  
`>> main`

aliases.m -- contains function handles definitions, which serve as API shortcuts and can be used interactively in Matlab's session.

ux/ directory contains files, which implement muxi's API.


## Examples

**Example 1** To pick points 4 and 5 you have to type command:
`>> pp([4 5])`
It calls pickPoints(Ids) function and adds provided indices of  to the Cart, so you can interact with corresponding points.

**Example 2** To move picked points to the new position (e.g. rise picked points position by 0.5 mm) you need to call movePoints(dz, dr) function. You can do this by typing:

`>> mv(0, 0.5)`

**Example 3** To drop previously picked points call *dropPoints(Ids)* function with:

`>> dp([4 5])`

It will clear the Cart, so you could pick others.