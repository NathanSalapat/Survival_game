This is a fork of desire path mod by Casimir (https://forum.minetest.net/viewtopic.php?id=3390).
Trail mod 0.2.1 by paramat.
For latest stable Minetest and back to 0.4.4.
Depends default.
Licenses: Code CC BY-SA. Textures CC BY-SA. Textures are edited default Minetest textures.
The water sounds are from the ambience mod by Neuromancer (https://forum.minetest.net/viewtopic.php?id=2807),
and are by Robinhood76 (http://www.freesound.org/people/Robinhood76/sounds/79657/) license CC BY-NC.

Version 0.1.0
-------------
Creates a trail of footprints in grass, dirt, sand, desert sand, gravel and the snow and snow block of snow biomes mod.
Repeated walking of grass will wear it to dirt.
Temporary trail of bubbles on water surface with a bubbly swimming / underwater sound.
Trail creation can be disabled (while retaining footprint nodes) by editing parameter: FOO = false.
Lightweight mod that runs the footprint function on average every 1 in 2 globalsteps, this is still enough to detect almost every node walked.
Additionally parameter FOOCHA can be reduced for less per-node chance of a footprint, this works by randomly skipping the processing of certain players,
therefore making the mod even more lightweight, useful for multiplayer situations.
Pre 0.4.7 sand and desert sand footprint textures are also supplied in the texture folder but renamed.

Version 0.1.1
-------------
Improved textures.
Parameter FUNCHA to optimise per globalstep chance of running function, currently 0.3 seems optimum.
Added license.txt.
Abm to erode footprints back to default nodes. Walked dirt heals to grass.
Remove footprints in gravel, now 2 dirts, 2 sands, 2 snows.

Version 0.1.2
-------------
Water sounds played positionally not globally duh.
Water sounds are now mono, edited, improved and correct format (ogg mono 44.1khz 96kbps).

Version 0.2.0
-------------
Repeated walking of grass will now wear it to a path of compacted dirt (trail:trail).
Trail nodes regrow to default grass at a much slower rate than default:dirt, so creating long lived paths through normal biomes.
Repeated walking of snow:snow or snow:snow_block will compact it to snow:ice, creating permanent ice paths through the snow biomes of snow mod.
The nodes farming:wheat_5 to wheat_8 is now flattened to a 'crop circle' trail:flatwheat 1/8th height nodebox with random lay direction (to make messy crop circles).
To create a path of trail nodes quickly increase parameter TRACHA to 0.5+ and retrace your footprints.
The first pass over grass will leave medium-life footprints only, the second pass has a chance of wearing it to trail:trail nodes,
this applies to snow and ice paths also.

Version 0.2.1
-------------
Compatibility with farming mod bugfix: walked grass and walked dirt are now in the soil group to enable hoeing.