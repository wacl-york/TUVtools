# Photolysis reaction numbers in MCMv3.x and TUV 5.2.2

The tables below list reaction numbers used in MCM/GECKO-A
and in TUV 5.2.x for the following compound classes:

- [Inorganics](#inorganic-species)
- [Carbonyl compounds](#carbonyl-compounds)
- [Organic hydroperoxides](#organic-hydroperoxides)
- [Organic nitrates](#organic-nitrates)
- [Halogen extension](#edwards-et-al-mcm-extensions)

Please ensure that `vers` is set to `2` in the `params` file in TUV.
This should set all cross section and quantum yield options correctly to
the preferred values in the MCM/GECKO-A protocol. You can double check that
options are correct for a given species by checking the 2. parameter
in xsvers or qyvers, respectively. The index compared to the log message
should yield in the option detailed in the MCM/GECKO-A protocol.


## Inorganic species

MCM     | TUV | TUV reaction label
-------:|----:|:------------------
O3 -> O2 + O(1D)
O3 -> O2 + O(3P)
H2O2 -> 2 OH
NO2 -> NO + O(3P)
NO3 -> NO + O2
NO3 -> NO2 + O(3P)
HNO2 -> OH + NO
HNO3 -> OH + NO2

[Back to the top](#photolysis-reaction-numbers-in-mcmv3x-and-tuv-522)


## Carbonyl compounds

MCM     | TUV | TUV reaction label
-------:|----:|:------------------
CH2O -> H + HCO
CH2O -> H2 + CO
CH3CHO -> CH3 + HCO
C2H5CHO -> C2H5 + HCO
n-C3H7CHO -> n-C3H7 + CHO
n-C3H7CHO -> C2H4 + CH2CHOH
i-C3H7CHO -> i-C3H7 + CHO
CH2=C(CH3)CHO -> CH2=CCH3 + CHO
CH2=C(CH3)CHO -> CH2=C(CH3)CO + H
HPALD -> Products
CH3COCH3 -> CH3CO + CH3
CH3COCH2CH3 -> CH3CO + CH2CH3
CH3COCH=CH2 -> C3H6 + CO
CH3COCH=CH2 -> C2H3 + CH3CO
CHOCHO -> H2 + 2 CO
CHOCHO -> CH2O + CO
CHOCHO -> 2 HO2 + 2 CO
CH3COCHO -> CH3CO + HCO
CH3COCOCH3 -> Products

[Back to the top](#photolysis-reaction-numbers-in-mcmv3x-and-tuv-522)


## Organic hydroperoxides

MCM     | TUV | TUV reaction label
-------:|----:|:------------------
CH3OOH -> CH3O + OH

[Back to the top](#photolysis-reaction-numbers-in-mcmv3x-and-tuv-522)


## Organic nitrates

MCM     | TUV | TUV reaction label
-------:|----:|:------------------
CH3ONO2 -> CH3O + NO2
C2H5ONO2 -> C2H5O + NO2
n-C3H7ONO2 -> C3H7O + NO2
CH3CHONO2CH3 -> CH3CHOCH3 + NO2
C(CH3)3(ONO2) -> C(CH3)3(O.) + NO2
CH3COCH2(ONO2) -> CH3COCH2(O.) + NO2[<sup>(1)</sup>](#additional-explanations)

[Back to the top](#photolysis-reaction-numbers-in-mcmv3x-and-tuv-522)


## Edwards et al. MCM extensions

MCM     | TUV | TUV reaction label
-------:|----:|:------------------
HNO4 -> HO2 + NO2
HOBr -> OH + Br
BrO -> Br + O
Br2 -> Br + Br
BrONO2 -> Br + NO3
BrONO2 -> BrO + NO2
ClONO2 -> Cl + NO3
ClONO2 -> ClO + NO2
Cl2 -> Cl + Cl
ClNO2 -> Cl + NO2
ClO -> Cl + O(1D)
ClO -> Cl + O(3P)
HCl -> H + Cl
BrNO2 -> Br + NO2
IO -> I + O
HOI -> I + OH
OIO -> I + O2


[Back to the top](#photolysis-reaction-numbers-in-mcmv3x-and-tuv-522)


## Additional explanations

<sup>(1)</sup> J(56): NOA photolyses to CH<sub>3</sub>COCH<sub>2</sub>O<sup>•</sup>
and NO<sub>2</sub> as only products in the MCMv3.3.1 with a quantum yield of 0.9.
In the MCMv3.2 an additional channel J(57) is assumed leading to
CH<sub>3</sub>CO<sup>•</sup>, HCHO, and NO<sub>2</sub> with a branching of
0.75:0.25 between J(56) and J(57), respectively.
