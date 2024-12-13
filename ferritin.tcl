# Load the protein structure (replace 'protein.pdb' with your actual file)
# mol new /Users/maddalena/Nextcloud/01-SU/projects/25-phd-thesis/05-figures/vmd/7u5l.pdb
#mol new /Users/maddalena/Nextcloud/01-SU/projects/25-phd-thesis/05-figures/vmd/1hzh.pdb
# mol new /Users/maddalena/Nextcloud/01-SU/simulations/20-gromacs-lyso/2020-04-15/1AKI_solv.gro
mol new /Users/maddalena/Nextcloud/01-SU/simulations/20-gromacs-lyso/2020-04-15/1AKI.pdb

display resize 3840 2160

# Delete the default representation (which includes water)
mol delrep 0 0

# -- protein
# Set the drawing style to NewCartoon for the protein only
mol representation NewCartoon
mol selection protein

# Define custom color for silver (RGB 192, 192, 192)
# color change rgb 30 0.545 0.000 0.000 ;# Use ColorID 31 for custom silver color
#color change rgb 31 0.000 0.500 0.000

mol color ColorID 0  ;# Apply the custom silver color
mol addrep 0

# Add a transparent blue isosurface representation of the protein
#mol representation Surf
#mol selection protein
#mol material Transparent
mol material Edgy
#mol color ColorID 0
#mol addrep 0

# Set the transparency level for the material 'Transparent'
#material change opacity Transparent 0.6


# -- settings
# Set background color to white
color Display Background white

# Center and scale the view
display resetview

# Remove the axes from the display
axes location off

rotate x by 20
rotate y by 180
#rotate x by 70
#rotate z by 230
#rotate x by 70
#rotate y by 180
#rotate z by 20
scale by 1.5

# render, Full HD  1920 1080, 4k 3840 2160, 8k 7680 4320, 
render TachyonInternal igg.tga -aasamples 128 -res 3840 2160 -ao 1 -aosamples 128 -shadows 1 -shiny 1.0 -light_samples 32

