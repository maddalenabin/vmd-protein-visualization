# -- Water here
# Parameters for CPK style
set sphere_scale      1.6   ;# Scale factor for atom spheres (default 1.0)
set sphere_resolution 64.    ;# Sphere quality (default 12)
set bond_radius       0.6   ;# Radius of bond cylinders (default 0.2)
set bond_resolution   64.    ;# Cylinder quality (default 12)

# Select water molecules within 3 Å of the protein
set near_waters [atomselect top "water and within 4 of protein"]

# Create a new representation for these water molecules
mol addrep top

# Get the index of the newly added representation
set num_reps   [molinfo top get numreps]
set rep_index  [expr $num_reps - 1]

# Apply the selection to the new representation
mol modselect $rep_index top "water and within 4 of protein"

# Set the drawing method to CPK with specified parameters
mol modstyle $rep_index top CPK $sphere_scale $bond_radius $sphere_resolution  $bond_resolution

# Set the coloring method to 'Name' to color atoms based on their names
mol modcolor $rep_index top Name

# Define colors: Oxygen as red, Hydrogen as white
color Name O red
color Name H white

# Set material for water to Opaque (non-transparent)
mol modmaterial $rep_index top Edgy



# -- bulk water
# -- Water between 5 Å and 10 Å from the protein
# Select water molecules between 6 and 10 Å from the protein
set distant_waters [atomselect top "water and (within 15 of protein) and not (within 5 of protein)"]

# Create a new representation for these water molecules
mol addrep top

# Get the index of the newly added representation for distant waters
set num_reps   [molinfo top get numreps]
set rep_index2  [expr $num_reps - 1]

# Apply the selection to the new representation
mol modselect $rep_index2 top "water and (within 15 of protein) and not (within 6 of protein)"

# Set the drawing method to CPK for distant water
mol modstyle $rep_index2 top CPK $sphere_scale $bond_radius $sphere_resolution $bond_resolution

# Set the coloring method to 'Name' to color oxygen red and hydrogen white
mol modcolor $rep_index2 top Name

# Define colors: Oxygen as red, Hydrogen as white
color Name O red
color Name H white

# Set material for these distant water molecules to Opaque (no transparency)
mol modmaterial $rep_index2 top Edgy