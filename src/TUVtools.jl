"""
# TUV Developer Tools

This package includes useful tools for TUV developers. The package is designed
for the MCM/GECKO-A TUV version. Options will be made available to work with
the original TUV versions as well.

# Functions

- `setrxns`: Auto-generate TUV input files from data in the rxn files and the
  files with the subroutine calls. Options to set all flags to T/F, set flags
  used in the MCMv3.3.1 or MCM/GECKO-A to T other reactions to false, or leave
  flags untouched.
"""
module TUVtools

# Load packages
using filehandling
using Printf

export setrxns

# Include private functions
include("setrxns.jl")

"""
    setrxns(tuvdir::String; inputfiles::Union{String,Vector{String}}="", setflags::Int64=-1)

Auto-generate input files for TUV (found in folder `tuvdir`).

By default all input files in the `INPUTS` folder are generated, but you can
specify to generate only certain inputs files using the keyword argument `inputfiles`
and giving a `Vector` of `String`s with the file names, you want to generate.
Files already have to exist, and only the reaction section is auto-generated.

You have options to reset flags (by default, flags are used as defined in the original input file):
- `0`: Set all flags to `F`
- `1`: Set all flags to `T`
- `2`: Set reactions used in MCM/GECKO-A to `T`, all other to `F`
- `3`: Set reactions used in MCMv3.3.1 `T`, all other to `F`
"""
function setrxns(tuvdir::String; inputfiles::Union{String,Vector{String}}="",
  setflags::Int64=-1)

  # Save current directory
  currdir = pwd()
  # Find files related to photolysis mechanism
  rxnfiles, callfiles = getfiles(tuvdir)
  # get list of reactions in order for input files
  rxnlist = generate_rxns(rxnfiles, callfiles)

  # Auto-generate input files with optional settings of flags
  write_rxns(inputfiles, tuvdir, rxnlist, setflags)
  # Go back to original directory
  cd(currdir)
end #function setrxns



end # module TUVtools
