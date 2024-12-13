# Load the protein structure (replace 'protein.pdb' with your actual file)
mol new /Users/maddalena/Nextcloud/01-SU/simulations/20-gromacs-lyso/2020-04-15/1AKI_solv.gro

#mol new /Users/maddalena/Nextcloud/01-SU/simulations/20-gromacs-lyso/2020-04-15/1AKI_solv.gro
#mol addfile /Users/maddalena/Nextcloud/01-SU/simulations/20-gromacs-lyso/2020-04-15/md_0_1.xtc
#mol new /Users/maddalena/Nextcloud/01-SU/simulations/20-gromacs-lyso/2020-04-15/md_0_1.xtc

#display resize 3840 2160

# Delete the default representation (which includes water)
mol delrep 0 0

# Select the first water molecule (adjust the residue name to match your file, e.g., WAT, HOH, TIP3, etc.)
# Here, HOH is used as an example for water molecules
set water [atomselect top "resname HOH and resid 1"]
#set water [atomselect top "resname SOL and resid 157"]
# set water [atomselect top "resname SOL and resid 157 and (name OW or name HW1 or name HW2)"]
#set water [atomselect top "index 2042 2043 2044"]




# Display the selected water molecule
#$water list

# You can use graphical representations if you'd like to visualize it in the VMD window
mol representation VDW
mol addrep top



# -- settings
# Set background color to white
color Display Background white

# Center and scale the view
display resetview

# Remove the axes from the display
axes location off


# render, Full HD  1920 1080, 4k 3840 2160, 8k 7680 4320, 
render TachyonInternal water-mol.tga -aasamples 64 -res 3840 2160 -ao 1 -aosamples 128 -shadows 1 -shiny 1.0 -light_samples 16

