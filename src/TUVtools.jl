module TUVtools

using filehandling
using Printf

export setrxns

function setrxns(tuvdir::String; inputfiles::Union{String,Vector{String}}="",
  setflags::Int64=-1)

  currdir = pwd()
  rxnfiles, callfiles = getfiles(tuvdir)
  rxnlist = generate_rxns(rxnfiles, callfiles)

  write_rxns(inputfiles, tuvdir, rxnlist, setflags)
  cd(currdir)
end #function setrxns


function getfiles(tuvdir)
  tuvdir = abspath(tuvdir)
  cd(joinpath(tuvdir, "SRC/RXN"))
  tuvfiles = readdir()
  deleteat!(tuvfiles,findall(endswith.(tuvfiles, ".o")))
  callfiles = deepcopy(tuvfiles)
  deleteat!(callfiles,findall(startswith.(callfiles, "rxn")))
  rxnfiles = setdiff(tuvfiles, callfiles)
  return rxnfiles, callfiles
end #function getfiles

function generate_rxns(rxnfiles, callfiles)
  # Initialise
  rxnlist = String[]

  # Get list of subroutines and associated reactions
  rxns = findrxnlabel(rxnfiles)
  # Get order the subroutines calls = order of reactions in input files
  order = getorder(callfiles)

  # Save O2 reaction label from swchem.f
  lines = readfile("swchem.f")
  iO2 = findfirst([occursin(r"^[ \t]*jlabel"i, line) for line in lines])
  O2rxn = replace(lines[iO2], r"^(.*?)(\'|\")" => "")
  O2rxn = strip(replace(O2rxn, r"(\'|\").*" => ""))
  push!(rxnlist, O2rxn)

  # Save reaction labels from rxn files in order
  for SR in order
    rxnlist = vcat(rxnlist, rxns[SR])
  end
  # Return String vector with reaction list
  return rxnlist
end

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
    # subs = [replace(line, r"^.*subroutine"i => "") for line in lines[isubs]]
    # subs = [strip(replace(line, r"\(.*"i => "")) for line in subs]
    subs = [strip(match(r"(?<=subroutine).*?(?=\()"i, rxn).match) for rxn in lines[isubs]]

    # Save reaction labels
    rxns = [match(r"(?<=\"|\').*(?=\"|\')"i, rxn).match for rxn in lines[irxns]]

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
end #function getorder #function generate_rxns

function write_rxns(filelist, tuvdir, rxnlist, setflags)
  cd(joinpath(tuvdir, "INPUTS"))
  flags = Vector{Char}(undef, length(rxnlist))
  if setflags == 0
    flags .= 'F'
  elseif setflags == 1
    flags .= 'T'
  elseif setflags > 1
    if setflags == 2
      mcm = read_data(joinpath(@__DIR__, "data/MCM-GECKO-A.db"), sep = "|",
      headerskip = 1, colnames = ["number", "label"])
    elseif setflags == 3
      mcm = read_data(joinpath(@__DIR__, "data/MCMv331.db"), sep = "|",
      headerskip = 1, colnames = ["number", "label"])
    end
    flags = Vector{Char}(undef, length(rxnlist))
    flags .= 'F'
    fail = String[]
    for rxn in mcm[:label]
      idx = findfirst(rxnlist.==rxn)
      if idx == nothing
        push!(fail, rxn)
      else
        flags[idx] = 'T'
      end
    end
    if length(fail) > 0
      println(
        "\033[95mWarning! $counter reactions not found in MCM database:\n\33[0m",
        join(fail, "\n"))
    end
  end
  if filelist == ""
    filelist = readdir()
    deleteat!(filelist,findall(startswith.(filelist, ".")))
  elseif filelist isa String
    filelist = [filelist]
  end
  for file in filelist
    lines = readfile(file)
    istart = findfirst(occursin.("photolysis reactions", lines))
    iend   = findlast(startswith.(lines, "==="))
    inmj   = findfirst(occursin.("nmj", lines))

    if setflags < 0
      flags = [line[1]  for line in lines[istart+1:iend-1]]
      if length(flags) < length(rxnlist)
        [push!(flags, 'T') for i = 1:1+length(rxnlist) - length(flags)]
        println("\033[95mWarning! Less flags in input file defined ",
          "than needed for current mechanism.\n\33[0m",
          "Last $(1+length(rxnlist) - length(flags)) flags set to true.")
      elseif length(flags) > length(rxnlist)
        println("\033[95mWarning! More flags in input file defined ",
          "than needed for current mechanism.\n\33[0m",
          "Last $(1+length(rxnlist) - length(flags)) flags ignored.")
        deleteat!(flags, 1+length(rxnlist) - length(flags):length(rxnlist))
      end
    end

    lines[inmj] = @sprintf("%s%3d", lines[inmj][1:end-3], length(findall(flags.=='T')))
    open(file, "w+") do f
      [println(f, line) for line in lines[1:istart]]
      [@printf(f, "%s%3d %s\n", flags[i], collect(1:length(rxnlist))[i], rxnlist[i])
        for i = 1:length(rxnlist)]
      [println(f, line) for line in lines[iend:end]]
    end
  end

end #function write_rxns

end # module TUVtools
