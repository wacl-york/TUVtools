# MCM photolysis parameterisations

The table below lists improved MCM/GECKO-A photolysis parameterisations,
which include a dependence on the overlying ozone column.
At 350DU they are identical the original MCM photolysis parameterisation:

    j(χ) = l·cosᵐ(χ)·exp(-n·sec(χ))

where j is in s<sup>-1</sup>. For other ozone columns `l` is redefined to:

    l([O3]) = l_a0 + l_b0·exp(l_b1/[O3]) + l_c0·exp(l_c1/[O3])

where l, l<sub>a0</sub>, l<sub>b0</sub>, l<sub>c0</sub> are in
s<sup>-1</sup> and l<sub>b1</sub>, l<sub>c1</sub> are in DU.

Download the parameters as [formatted text file](https://github.com/pb866/TUV5.2.x/wiki/data/parameters.dat) or
[csv file](https://github.com/pb866/TUV5.2.x/wiki/data/parameters.csv).


MCM/GECKO-A | TUV |        l<sub>a0</sub>         |        l<sub>b0</sub>         | l<sub>b1</sub> |        l<sub>c0</sub>         | l<sub>c1</sub> |        l(350DU)        |      m      |      n      | TUV label
-----------:|----:|:-----------------------------:|:-----------------------------:|:--------------:|:-----------------------------:|:--------------:|:----------------------:|:-----------:|:-----------:|:---------
