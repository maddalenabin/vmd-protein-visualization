# Load the protein structure (replace 'protein.pdb' with your actual file)
mol new /vmd-pdb/1AKI_solv.gro

display resize 3840 2160

# Delete the default representation (which includes water)
mol delrep 0 0

# -- protein
# Set the drawing style to NewCartoon for the protein only
mol representation NewCartoon
mol selection protein

# Define custom color for silver (RGB 192, 192, 192)
color change rgb 31 0.75 0.75 0.75  ;# Use ColorID 31 for custom silver color

mol color ColorID 31  ;# Apply the custom silver color
mol addrep 0


# Define custom color for silver (RGB 192, 192, 192)
color change rgb 32 0.7 0.7 0.7  ;# Use ColorID 31 for custom silver color

# Add a transparent blue isosurface representation of the protein
mol representation Surf
mol selection protein
mol material Transparent
#mol material Edgy
mol color ColorID 32
mol addrep 0

# Set the transparency level for the material 'Transparent'
material change opacity Transparent 0.8

# -- hydration water
# Parameters for CPK style
set sphere_scale      1.6   ;# Scale factor for atom spheres (default 1.0)
set sphere_resolution 64.    ;# Sphere quality (default 12)
set bond_radius       0.6   ;# Radius of bond cylinders (default 0.2)
set bond_resolution   64.    ;# Cylinder quality (default 12)

# Select water molecules within 3 Å of the protein
set near_waters [atomselect top "water and within 6 of protein"]

# Create a new representation for these water molecules
mol addrep top

# Get the index of the newly added representation
set num_reps   [molinfo top get numreps]
set rep_index  [expr $num_reps - 1]

# Apply the selection to the new representation
mol modselect $rep_index top "water and within 6 of protein"

# Set the drawing method to CPK with specified parameters
mol modstyle $rep_index top CPK $sphere_scale $bond_radius $sphere_resolution  $bond_resolution


# Set the coloring method to 'Name' to color atoms based on their names
mol modcolor $rep_index top Name

# Define a custom gray color for water molecules (RGB 0.7, 0.7, 0.7)
color change rgb 32 0.7 0.7 0.7  ;# Assign ColorID 32 for gray color

# Set water molecules to the gray color
mol modcolor $rep_index top ColorID 32

# Set the material for water to Transparent and make them slightly transparent
mol modmaterial $rep_index top Edgy
#material change opacity Transparent 0.8  ;# Slight transparency for water


# Set the coloring method to 'Name' to color atoms based on their names
#mol modcolor $rep_index top Name

# Define colors: Oxygen as red, Hydrogen as white
#color Name O red
#color Name H white

# Set material for water to Opaque (non-transparent)
mol modmaterial $rep_index top Edgy


# -- bulk water
# -- Water between 5 Å and 10 Å from the protein
# Select water molecules between 6 and 10 Å from the protein
set distant_waters [atomselect top "water and (within 25 of protein) and not (within 7 of protein)"]

# Create a new representation for these water molecules
mol addrep top

# Get the index of the newly added representation for distant waters
set num_reps   [molinfo top get numreps]
set rep_index2  [expr $num_reps - 1]

# Apply the selection to the new representation
mol modselect $rep_index2 top "water and (within 25 of protein) and not (within 7 of protein)"

# Set the drawing method to CPK for distant water
mol modstyle $rep_index2 top CPK $sphere_scale $bond_radius $sphere_resolution $bond_resolution

# Set the coloring method to 'Name' to color oxygen red and hydrogen white
mol modcolor $rep_index2 top Name

# Define colors: Oxygen as red, Hydrogen as white
color Name O red
color Name H white

# Set material for these distant water molecules to Opaque (no transparency)
mol modmaterial $rep_index2 top Edgy



# -- settings
# Set background color to white
color Display Background white

# Center and scale the view
display resetview

# Remove the axes from the display
axes location off


# render, Full HD  1920 1080, 4k 3840 2160, 8k 7680 4320, 
render TachyonInternal lysozyme-bulk.tga -aasamples 64 -res 3840 2160 -ao 1 -aosamples 128 -shadows 1 -shiny 1.0 -light_samples 16

