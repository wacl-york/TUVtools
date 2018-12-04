"""
    write_wiki(rxnlist, tuvdir, ifile, ofile, len, DB, currdir)

From the `rxnlist` of TUV reactions in the order of the output file and the directory
of the current TUV version `tuvdir`, write wiki markdown files as specified by function
generate_wiki.
"""
function write_wiki(rxnlist, tuvdir, ifile, ofile, len, DB, currdir)
  # Skip routine, if no template is provided
  if ifile == ""  return  end
  # Make sure to be in the TUV main directory
  cd(tuvdir)
  ifile, ofile, len, db = init_wikifiles(ifile, ofile, len, DB, currdir)

  for i = 1:length(ifile)
    wiki = readfile(ifile[i])
    counter = 0
    for (j, rxn) = enumerate(unique(db[i][:label]))
      n = findfirst(startswith.(wiki,rxn))
      try
        wiki[n] = @sprintf("%s | %3d | %s", rpad("J($(db[i][:number][j]))",len[i]),
          findfirst(rxnlist.==rxn), wiki[n])
        counter += 1
      catch;
      end
    end # loop over reactions
    open(ofile[i], "w") do f
      [println(f, line) for line in wiki]
    end # close file
    println("Reaction numbers for $counter reactions written to $(basename(ofile[i])).")
  end # loop over files
end #function write_wiki


"""
    init_wikifiles(ifile, ofile, len, DB, currdir)

Set up files for function write_wiki with I/O files (`ifile`/`ofile`), the column
`len`gth for markdown output, the MCM version numbers (`DB`), and the working
directory (`currdir`) to transform folder paths into absolute paths from the kwargs
of function generate_wiki.
"""
function init_wikifiles(ifile, ofile, len, DB, currdir)
  collength = Int64[]; db = []
  # Read MCM reaction numbers saved in the data files for every version
  mcm3 = read_data(joinpath(@__DIR__, "data/MCMv331.db"), sep = "|",
  headerskip = 1, colnames = ["number", "label"])
  mcm4 = read_data(joinpath(@__DIR__, "data/MCM-GECKO-A.db"), sep = "|",
  headerskip = 1, colnames = ["number", "label"])
  database = [mcm3, mcm4]
  # Make sure, all kwargs are vectors
  if ifile isa String  ifile = [ifile]  end
  if ofile isa String  ofile = [ofile]  end
  if length(ifile) ≠ length(ofile)
    println("\033[95mError! Different number of input and output files specified.")
    println("Julia stopped.\033[0m")
  end
  if len isa Number
    [push!(collength, len) for i = 1:length(ifile)]
  else
    collength = len
  end
  # Convert input paths to absolute folder paths
  for i = 1:length(ifile)
    if !isabspath(ifile[i])  ifile[i] = normpath(joinpath(currdir, ifile[i]))  end
    if !isabspath(ofile[i])  ofile[i] = normpath(joinpath(currdir, ofile[i]))  end
  end
  # Set up database with MCM/GECKO-A reaction numbers for correct MCM version
  [push!(db, database[i-2]) for i in DB]

  return ifile, ofile, collength, db
end
