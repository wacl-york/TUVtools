TUVtools
========

TUV developer tools to auto-generate TUV input files, include files to link
TUV to the boxmodel [DSMACC](https://github.com/pb866/DSMACC-testing.git) or
generate markdown files for the TUV wiki.


Installation
------------

Go to the package manager and add first the unregistered package
[filehandling](https://github.com/pb866/filehandling.git) and then TUVtools.
You may want to `activate` an environment as optional second step, if you
don't want the project installed in the main julia environment (where `.` can
be replaced by any path to any existing Project.toml or to a new folder
creating a new environment).

```julia
julia> ]
pkg> activate .
pkg> add https://github.com/pb866/filehandling.git
pkg> add https://github.com/pb866/TUVtools.git
pkg> instantiate
pkg> precompile
```


Usage
-----

Import package with `using` or import `import`:

```julia
using Pkg
Pkg.activate("path/to/Project.toml") #if not in main julia environment
using TUVtools
```

**_Currently all functions work only for the MCM/GECKO-A TUV version 5.2.x., where source code has been moved to a separate source folder!_**
Additional flags to use with the original TUV version may be introduced in the future.


### Function setrxns

Auto-generates the reaction part of the TUV input files from the reaction labels
defined in the rxn files/subroutines. Options exist to reset flags.



```julia
setrxns(tuvdir::String; inputfiles::Union{String,Vector{String}}="", setflags::Int64=-1)
```

Specify the location of the TUV main folder with `tuvdir`. TUV input files have to exist
already and only the mechanisims section is overwritten. By default all files in the `INPUTS`
folders are re-written. Use keyword argument `inputfiles` to select a subset.

Use kwarg `setflags` to reset flags for TUV output. By default the same flags are used as
previously. If you add/delete reactions, you will have to insert/delete flags at the
corresponding lines (you only need to provide the flag at the first character of the line,
the remaining line will be auto-filled). Other options are:

- `0`: Set all flags to false (`F`)
- `1`: Set all flags to true (`T`)
- `2`: Set output to `T` for reactions in the MCM/GECKO-A mechanism, remaining flags to `F`
- `3`: Set output to `T` for reactions in the MCMv3.3.1 (and older) mechanism, remaining flags to `F`


### Function generate_incfiles

Auto-generates include files for the boxmodel
[DSMACC](https://github.com/pb866/DSMACC-testing.git) to link TUV and DSMACC
reaction numbers in the model.

```julia
generate_incfiles(tuvdir::String)
```

Specify the main folder of the TUV version you are using
(needs to be the MCM/GECKO-A TUV version rather than original TUV), from
which the function will derive the TUV reaction numbers.
DSMACC reaction numbers are saved in `data/MCMv32.db`, `data/MCMv331.db`,
and `data/MCM-GECKO-A.db` for the respective MCM versions.

If you use additonal photolysis reactions or altered the photolysis numbers
in any way, you need to modify these number either by cloning this repository
and making sure to load the cloned version into julia or you can `develop` the
package with the help of the package manager.

Include files will be auto-generated for every MCM version and written to the
main folder of the specified TUV version.


### Function generate_wiki

This is a more advanced routine for developers of [TUV_MG](https://github.com/pb866/TUV_MG.git)
— the MCM/GECKO-A version of TUV 5.2 – to maintain the wiki pages of the
repository.

Function `generate_wiki` can auto-generate wiki pages for the reaction numbers
used in MCM/GECKO-A and TUV and the improved MCM photolysis parameterisations.

By default, no wiki files are generated unless you specify a template for the wiki page(s)
or the `parameter.csv` from [MCMphotolysis](https://github.com/pb866/MCMphotolysis.git).

```julia
generate_wiki(tuvdir::String; wikitemplates::Union{String, Vector{String}}="",
  wikioutput::Union{String, Vector{String}}="WIKI.md",
  wikidir::String=joinpath(@__DIR__, "../data"), parinput::String="",
  paroutput::String="../MCM-Photolysis-Parameters.md",
  MCMcollength::Union{Int64,Vector{Int64}}=10,
  MCMversion::Union{Int64,Vector{Int64}}=4)
```

Specify the main folder of the TUV version in `tuvdir` to get the TUV
reaction numbers. If you want to generate wiki page(s) for the reaction numbers,
make sure the DSMACC reaction numbers are correct in the database files
(see [function `generate_incfiles`](#function-generate_incfiles)).

Create templates for all wiki pages using markdown code. Type any text you like
in the page. Where you want tables with the reaction numbers, only provide the header.
Put the reaction string starting at the first character of the line for every reaction
you want in the tables at the correct positon in the template. The script will auto-fill-in
the correct MCM/GECKO-A and TUV reaction numbers in the first two columns and the
reaction label in the third. Reaction labels have to be the same as in TUV.
Examples of templates can be found in `./data`. Use these templates (select with
`wikitemplates`) or save different templates to folder `wikidir`.

Specify the templates with the kwarg `wikitemplates` as `String` for single file
or as `Vector{String}` for multiple files. Define as many output file names as
templates with `wikioutput` (in the same manor). Specify, which version of the MCM
you are using for each wiki page as `Int64` or `Vector{Int64}` using `3` for
MCMv3.3.1 or older and `4` for MCM/GECKO-A. Optionally, you can specify the column
length of the MCM/GECKO-A reaction number column for nicer formatting of the table
in the md files. TUV columns will always be for 3-digit integers.

If you want to generate the parameter list for the improved MCM/GECKO-A
photolysis parameterisations, specify the location and file name of the
`parameters.csv` from [MCMphotolysis](https://github.com/pb866/MCMphotolysis.git)
with kwarg `parinput`. To specify a location and file name for the
auto-generated markdown file use kwarg `paroutput`.


Version history
===============

Version 0.1.2
-------------
- Use `import` for filehandling (as `fh`) rather than `using`
- Add support for line breaks in j labels in the reaction files
- Move `data` folder from `src` to main folder
- New kwarg `wikidir` to specify the directory of the wiki templates
- Bug fixes

Version 0.1.1
-------------
- Fix #5 (BoundsError)
- Fix name of O(3P) in database files and wiki pages

Version 0.1.0
-------------
- New function `setrxns` to auto-generate TUV input files
- New function `generate_incfiles` to auto-generate DSMACC include files
  to link TUV to DSMACC
- New function `generate_wiki` to auto-generate wiki files for the
  MCM/GECKO-A and TUV reaction numbers and for the improved MCM/GECKO-A
  photolysis parameterisations
