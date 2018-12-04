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

export setrxns,
       generate_incfiles,
       generate_wiki

# Include private functions
include("setrxns.jl")
include("generate_wiki.jl")

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
  rxnfiles, callfiles, tuvdir = getfiles(tuvdir)
  # get list of reactions in order for input files
  rxnlist = generate_rxns(rxnfiles, callfiles)

  # Auto-generate input files with optional settings of flags
  write_rxns(inputfiles, tuvdir, rxnlist, setflags)
  # Go back to original directory
  cd(currdir)
end #function setrxns


"""
    generate_incfiles(tuvdir::String)

Generate include files to link TUV in directory `tuvdir` to the box model DSMACC.
"""
function generate_incfiles(tuvdir::String)

  # Save current directory
  currdir = pwd()
  # Find files related to photolysis mechanism
  rxnfiles, callfiles, tuvdir = getfiles(tuvdir)
  # get list of reactions in order for input files
  rxnlist = generate_rxns(rxnfiles, callfiles)

  # Auto-generate inc files for TUV_DSMACC
  write_incfiles(rxnlist, tuvdir)
  # Go back to original directory
  cd(currdir)
end


"""
    generate_wiki(tuvdir::String, kwargs)

Generate markdown files from templates specified kwarg `wikitemplates`, where
reactions numbers from TUV in `tuvdir` and in MCM/GECKO-A are listed for every
reaction listed at the beginning of each template line and written to files specified
by kwarg `wikioutput`. The table `collength` can be specifief with a kwarg, for nicer
md file formatting. The `MCMversion` needs to be specified for every wiki template.
"""
function generate_wiki(tuvdir::String; wikitemplates::Union{String, Vector{String}}="",
  wikioutput::Union{String, Vector{String}}="WIKI.md", collength::Union{Int64,Vector{Int64}}=10,
  MCMversion::Union{Int64,Vector{Int64}}=4)
  # Save current directory
  currdir = pwd()
  # Find files related to photolysis mechanism
  rxnfiles, callfiles, tuvdir = getfiles(tuvdir)
  # get list of reactions in order for input files
  rxnlist = generate_rxns(rxnfiles, callfiles)

  # Auto-generate inc files for TUV_DSMACC
  write_wiki(rxnlist, tuvdir, wikitemplates, wikioutput, collength, MCMversion, currdir)
  # Go back to original directory
  cd(currdir)
end #function generate_wiki

end # module TUVtools
