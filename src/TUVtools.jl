module TUVtools

using filehandling

export setrxns

function setrxns(tuvdir::String; inputfile::Union{String,Vector{String}}="usrinp",
  setflags::Union{String, Int64}="")
  currdir = pwd()
  tuvdir = abspath(tuvdir)
  cd(joinpath(tuvdir, "SRC/RXN"))
  tuvfiles = readdir()
  deleteat!(tuvfiles,findall(endswith.(tuvfiles, ".o")))
  callfiles = deepcopy(tuvfiles)
  deleteat!(callfiles,findall(startswith.(callfiles, "rxn")))
  rxnfiles = setdiff(tuvfiles, callfiles)

  rxns = findrxnlabel(rxnfiles)
  callorder = getorder(callfiles)

  cd(joinpath(tuvdir, "INPUTS"))
  write_rxns(inputfile, rxns, callorder, setflags)
  cd(currdir)

end #function setrxns

function findrxnlabel(filelist)
  # Initialise dictionary with subroutines and their associated reactions
  labels = Dict{String, Vector{SubString{String}}}()

  # Loop over rxn files
  for file in filelist
    # Read file
    lines = readfile(file)
    # Find lines with subroutine names and reaction lables
    isubs = findall([occursin(r"^[ \t]*subroutine"i, line) for line in lines])
    irxns = findall([occursin(r"^[ \t]*jlabel"i, line) for line in lines])

    # Save subroutine names
    subs = [replace(line, r"^.*subroutine"i => "") for line in lines[isubs]]
    subs = [strip(replace(line, r"\(.*"i => "")) for line in subs]

    # Save reaction labels
    rxns = [replace(rxn, r"^(.*?)(\'|\")" => "") for rxn in lines[irxns]]
    rxns = [strip(replace(rxn, r"(\'|\").*" => "")) for rxn in rxns]

    # Add index for end of file
    push!(isubs, length(lines))

    # Attribute reactions to their subroutines and save in a dictionary
    for i = 1:length(subs)
      ilab = findall(isubs[i] .< irxns .< isubs[i+1])
      labels[subs[i]] = rxns[ilab]
    end
  end

  return labels
end #function findrxnlabel

function getorder(filelist)
  # Initialise array with order of calls
  callorder = String[]
  # Loop over input files in reverse alphabetical order (as they are called in TUV)
  for file in reverse(sort(filelist))
    # Read files
    lines = readfile(file)
    # Find subroutine names in order
    isubs = findall([occursin(r"^[ \t]*call"i, line) for line in lines])
    subs = [replace(line, r"^.*call"i => "") for line in lines[isubs]]
    subs = [strip(replace(line, r"\(.*"i => "")) for line in subs]
    # Save order
    callorder = vcat(callorder, subs)
  end

  return callorder
end


end # module TUVtools
