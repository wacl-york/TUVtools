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
- `generate_incfiles`: Generate .inc files needed to link TUV photolysis reaction
  numbers to MCM photolysis reaction numbers.
- `generate_wiki`: Generate wiki files with the TUV and MCM reaction numbers based
  on the TUV input files and a database file with the TUV reaction label and the
  MCM reaction number saved in src/data.
"""
module TUVtools

# Load packages
import filehandling; const fh = filehandling
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

By default all input files in the `INPUTS` folder are regenerated with an updated
photolysis mechanism section, but you can specify to generate only certain input
files using the keyword argument `inputfiles` and giving it a `Vector` of `String`s
with the file names, you want to generate.
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

Generate markdown files from templates named `wikitemplates` in folder `wikidir`,
where reactions numbers from TUV in `tuvdir` and in MCM/GECKO-A are listed for every
reaction listed at the beginning of each template line and written to files named
`wikioutput`. In the output table, column width `MCMcollength` can be specified for nicer
md file formatting. The `MCMversion` needs to be specified for every wiki template.
If the parameters csv file `parinput` as provided by function `j_parameters` from
package `MCMphotolysis` is specified, a markdown table with the updated photolysis
parameters will be written to file `paroutput`.
"""
function generate_wiki(tuvdir::String; wikitemplates::Union{String, Vector{String}}="",
  wikioutput::Union{String, Vector{String}}="WIKI.md",
  wikidir::String=joinpath(@__DIR__, "../data"), parinput::String="",
  paroutput::String="../MCM-Photolysis-Parameters.md",
  MCMcollength::Union{Int64,Vector{Int64}}=10,
  MCMversion::Union{Int64,Vector{Int64}}=4)
  # Save current directory
  currdir = pwd()
  # Find files related to photolysis mechanism
  rxnfiles, callfiles, tuvdir = getfiles(tuvdir)
  # get list of reactions in order for input files
  rxnlist = generate_rxns(rxnfiles, callfiles)

  # Auto-generate inc files for TUV_DSMACC
  write_wiki(rxnlist, tuvdir, wikitemplates, wikidir, wikioutput,
    MCMcollength, MCMversion, currdir)
  write_params(parinput, paroutput, currdir)
  # Go back to original directory
  cd(currdir)
end #function generate_wiki

end # module TUVtools
