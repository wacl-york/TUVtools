# Photolysis reaction numbers in MCM/GECKO-A and TUV 5.2.2

The tables below list reaction numbers used in MCM/GECKO-A
and in TUV 5.2.x for the following compound classes:

- [Inorganics](#inorganic-species)
- [n-Aldehydes](#linear-aldehydes)
- [Branched aldehydes](#branched-aldehydes)
- [Unsaturated aldehydes](#unsaturated-aldehydes)
- [Substituted aldehydes](#substituted-aldehydes)
- [Unbranched ketones](#unbranched-ketones)
- [Branched ketones](#branched-ketones)
- [Unsaturated ketones](#unsaturated-ketones)
- [Cyclic ketones](#cyclic-ketones)
- [Substituted ketones](#substituted-ketones)
- [Ketenes](#ketenes)
- [Dicarbonyls](#dicarbonyls)
- [Terminal n-alkyl nitrates](#terminal-linear-alkyl-nitrates)
- [Internal n-alkyl nitrates](#internal-linear-alkyl-nitrates)
- [Branched alkyl nitrates](#branched-alkyl-nitrates)
- [Substituted alkyl nitrates](#substituted-alkyl-nitrates)
- [Further nitrogen compounds](#further-nitrogen-compounds)
- [Alkyl dinitrates](#alkyl-dinitrates)
- [Alkyl hydroperoxides](#alkyl-hydroperoxides)
- [Criegee intermediates](#criegee-intermediates)
- [Polyfunctionals](#polyfunctional-chromophores)
- [Halogens](#edwards-et-al-mcm-halogen-extensions)

Please ensure that `vers` is set to `2` in the `params` file in TUV.
This should set all cross section and quantum yield options correctly to
the preferred values in the MCM/GECKO-A protocol. You can double check that
options are check correctly for a given species by checking the 2. parameter
in xsvers or qyvers, respectively. The index compared to the log message
should yield in the option detailed in the MCM/GECKO-A protocol.

See also [schematics of the new protocol](Decision%20tree) or return to [start page](Home).


## Inorganic species

MCM/GECKO-A | TUV | TUV reaction label
-----------:|----:|:------------------
O3 -> O2 + O(1D)
O3 -> O2 + O(3P)
H2O2 -> 2 OH
NO2 -> NO + O(3P)
NO3 -> NO + O2
NO3 -> NO2 + O(3P)
HNO2 -> OH + NO
HNO3 -> OH + NO2
HNO4 -> HO2 + NO2
HNO4 -> OH + NO3

[Back to the top](#photolysis-reaction-numbers-in-different-model-frameworks)


## Linear aldehydes

MCM/GECKO-A | TUV | TUV reaction label
-----------:|----:|:------------------
CH2O -> H + HCO
CH2O -> H2 + CO
CH3CHO -> CH3 + HCO
CH3CHO -> CH3CO + H
C2H5CHO -> C2H5 + HCO
n-C3H7CHO -> n-C3H7 + CHO
n-C3H7CHO -> C2H4 + CH2CHOH
n-C4H9CHO -> C4H9 + CHO
n-C5H11CHO -> C5H11 + CHO
n-C6H13CHO -> C6H13 + CHO
n-C7H15CHO -> C7H15 + CHO

[Back to the top](#photolysis-reaction-numbers-in-different-model-frameworks)


## Branched aldehydes

MCM/GECKO-A | TUV | TUV reaction label
-----------:|----:|:------------------
i-C3H7CHO -> i-C3H7 + CHO
i-C4H9CHO -> C4H9 + CHO
i-C4H9CHO -> CH3CH=CH2 + CH2=CHOH
sec-C4H9CHO -> C4H9 + CHO
sec-C4H9CHO -> CH3CH=CHOH + CH2=CH2
t-C4H9CHO -> C4H9 + CHO
C4H9CH(C2H5)CHO -> C7H15 + CHO
tALD -> products
neoC5H11CHO -> neoC5H11 + CHO

[Back to the top](#photolysis-reaction-numbers-in-different-model-frameworks)


## Unsaturated aldehydes

MCM/GECKO-A | TUV | TUV reaction label
-----------:|----:|:------------------
CH2=CHCHO -> CH2=CH + CHO
CH2=CHCHO -> CH2=CH2 + CO
CH2=CHCHO -> CH2=CHCO + H
CH3CH=CHCHO -> CH3CH=CH + CHO
CH3CH=CHCHO -> CH3CH=CH2 + CO
CH3CH=CHCHO -> CH3CH=CHCO + H
2-hexenal -> 1-pentenyl radical + CHO
2-hexenal -> 1-pentene + CO
2-hexenal -> C3H7CH=CHCO + H
hexadienal -> 1-pentenyl radical + CHO
hexadienal -> 1,3-pentadiene + CO
hexadienal -> CH3CH=CHCH=CHCO + H
CH2=C(CH3)CHO -> CH2=CCH3 + CHO
CH2=C(CH3)CHO -> CH3CH=CH2 + CO
CH2=C(CH3)CHO -> CH2=C(CH3)CO + H
CH3C(CH3)=CHCHO -> (CH3)2C=CH + CHO
CH3C(CH3)=CHCHO -> (CH3)2C=CH2 + CO
CH3C(CH3)=CHCHO -> (CH3)2C=CHCO + H
CH3CH=C(CH3)CHO -> CH3CH=CCH3 + CHO
CH3CH=C(CH3)CHO -> CH3CH=CHCH3 + CO
CH3CH=C(CH3)CHO -> CH3CH=C(CH3)CO + H
luALD -> NI products
luALD -> alkene + CO
luALD -> acyl + H

[Back to the top](#photolysis-reaction-numbers-in-different-model-frameworks)


## Substituted aldehydes

MCM/GECKO-A | TUV | TUV reaction label
-----------:|----:|:------------------
HOCH2CHO -> CH2OH + HCO
ALD3OH -> R(OH) + HCO
ALD4OH -> NI products
ALD4OH -> NII products
C5nALDOH -> NI products
C6nALDOH -> NI products
C7nALDOH -> NI products
C8nALDOH -> NI products
intAldOH -> R + CHO
Glycidaldehyde -> oxyranyl radical + CHO

[Back to the top](#photolysis-reaction-numbers-in-different-model-frameworks)


## Unbranched ketones

MCM/GECKO-A | TUV | TUV reaction label
-----------:|----:|:------------------
CH3COCH3 -> CH3CO + CH3
CH3COCH3 -> CO + 2 CH3
CH3COCH2CH3 -> CH3CO + CH2CH3
C3H7COCH3 -> CH3CO + C3H7
C3H7COCH3 -> C3H7 + CO + CH3
C3H7COCH3 -> CH3C(OH)=CH2 + CH2=CH2
C2H5COC2H5 -> C2H5CO + C2H5
C4H9COCH3 -> CH3CH=CH2 + CH2=C(OH)CH3
C3H7COC2H5 -> C2H5CO + C3H7
C3H7COC2H5 -> C3H7CO + C2H5
C3H7COC2H5 -> C3H7 + CO + C2H5
C3H7COC2H5 -> C2H5C(OH)=CH2 + CH2=CH2
lKET5 -> products
4-heptanone -> NI products
4-octanone -> NI products

[Back to the top](#photolysis-reaction-numbers-in-different-model-frameworks)


## Branched ketones

MCM/GECKO-A | TUV | TUV reaction label
-----------:|----:|:------------------
MIPK -> CH3CO + i-C3H7
MIPK -> i-C3H7CO + CH3
MIPK -> i-C3H7 + CO + CH3
MIPK -> CH2=CHOH + CH3CH=CH2
MIBK -> CH3CO + i-C4H9
5-Me-2-hexanone -> CH3CO + CH2CH2CH(CH3)2
4-Me-2-hexanone -> CH3C(OH)=CH2 + 2-butene
4-Me-2-hexanone -> CH3C(OH)=CH2 + 1-butene
CH3CH(CH3)COCH(CH3)2 -> i-C3H7CO + i-C3H7
2-Me-4-heptanone -> NI products
3-Me-4-heptanone -> NI products
2,2-Me-3-hexanone -> NI products
DIBK -> NI products
di-sec-butyl ketone -> NI products
di-t-butyl ketone -> NI products
n-C3H7COCH(CH3)2 -> NI products
n-C3H7COCH(CH3)2 -> i-C3H7COCH3 + C2H4
CH3COCH2C(CH3)3 -> NI products
di-sec-butyl ketone -> sec-C4H9COCH2CH3 + C2H4

[Back to the top](#photolysis-reaction-numbers-in-different-model-frameworks)


## Unsaturated ketones

MCM/GECKO-A | TUV | TUV reaction label
-----------:|----:|:------------------
CH3COCH=CH2 -> CH3 + C2H3CO
CH3CH2COCH=CH2 -> C2H5 + C2H3CO

[Back to the top](#photolysis-reaction-numbers-in-different-model-frameworks)


## Cyclic ketones

MCM/GECKO-A | TUV | TUV reaction label
-----------:|----:|:------------------
c-C3H4O -> C2H4 + CO
c-C3H4O -> further products
c-C4H6O -> C2H4 + CH2=C=O
c-C4H6O -> c-C3H6 + CO
c-C5H8O -> 2 C2H4 + CO
c-C5H8O -> c-C4H8 + CO
c-C5H8O -> CH2=CHCH2CH2CHO
c-C6H10O -> 5-hexenal
c-C6H10O -> 1-pentene + CO
c-C7H12O -> 6-heptenal
c-C7H12O -> 1-hexene + CO

[Back to the top](#photolysis-reaction-numbers-in-different-model-frameworks)


## Substituted ketones

MCM/GECKO-A | TUV | TUV reaction label
-----------:|----:|:------------------
CH2(OH)COCH3 -> CH3CO + CH2(OH)
CH3COC2H4OH -> CH3 + COCH2CH2OH
CH3COCH(OH)CH3 -> CH3CO + CH3CHOH
CH3COC(CH3)2OH -> CH3 + (CH3)2C(OH)CO
CH3COCOOH -> CH3CHO + CO2
CH3COCH2C(CH3)2OH -> CH3COCH2 + CH3C(OH)CH3

[Back to the top](#photolysis-reaction-numbers-in-different-model-frameworks)


## Ketenes

MCM/GECKO-A | TUV | TUV reaction label
-----------:|----:|:------------------
CH2=C=O -> CO2 + CO + H2
CH3CH=C=O -> C2H4 + CO

[Back to the top](#photolysis-reaction-numbers-in-different-model-frameworks)


## Dicarbonyls

MCM/GECKO-A | TUV | TUV reaction label
-----------:|----:|:------------------
CHOCHO -> 2 HO2 + 2 CO
CHOCHO -> CH2O + CO
Ald (mult)
CH3COCHO -> CH3CO + HCO
CH3COCOCH3 -> Products
CHOCH=CHCHO -> 3H-furan-2-one
CH3COCH=CHCHO -> 5Me-3H-2-furanone
CH3COCH=CHCHO -> CH3 + CHOCH=CHCO
CH3COCH=CHCHO -> CH3COCH=CH2 + CO
CH3COCH=CHCOCH3 -> CH3CO + CH=CHCOCH3
CHOCH=CHCH=CHCHO -> diformyl cyclobutene
pinonaldehyde -> R + CO + HO2
caronaldehyde -> R + CO + HO2

[Back to the top](#photolysis-reaction-numbers-in-different-model-frameworks)


## Terminal linear alkyl nitrates

MCM/GECKO-A | TUV | TUV reaction label
-----------:|----:|:------------------
CH3ONO2 -> CH3O + NO2
C2H5ONO2 -> C2H5O + NO2
n-C3H7ONO2 -> C3H7O + NO2
1-C4H9ONO2 -> 1-C4H9O + NO2
n-C5H11ONO2 -> n-C5H11O + NO2

[Back to the top](#photolysis-reaction-numbers-in-different-model-frameworks)


## Internal linear alkyl nitrates

MCM/GECKO-A | TUV | TUV reaction label
-----------:|----:|:------------------
CH3CHONO2CH3 -> CH3CHOCH3 + NO2
2-C4H9ONO2 -> 2-C4H9O + NO2
2-C5H11ONO2 -> 2-C5H11O + NO2
3-C5H11ONO2 -> 3-C5H11O + NO2
C5H11ONO2 -> C5H11O + NO2

[Back to the top](#photolysis-reaction-numbers-in-different-model-frameworks)


## Branched alkyl nitrates

MCM/GECKO-A | TUV | TUV reaction label
-----------:|----:|:------------------
i-C4H9ONO2 -> i-C4H9O + NO2
C(CH3)3(ONO2) -> C(CH3)3(O.) + NO2
i-C5H11ONO2 -> i-C5H11O + NO2
c-C5H11ONO2 -> c-C5H11O + NO2

[Back to the top](#photolysis-reaction-numbers-in-different-model-frameworks)


## Substituted alkyl nitrates

MCM/GECKO-A | TUV | TUV reaction label
-----------:|----:|:------------------
CH2(OH)CH2(ONO2) -> CH2(OH)CH2(O.) + NO2
C1(OH)NO3 -> C1(OH)O + NO2
R(OH)NO3 -> R(OH)O + NO2
iR(OH)NO3 -> iR(OH)O + NO2
tR(OH)NO3 -> tR(OH)O + NO2

[Back to the top](#photolysis-reaction-numbers-in-different-model-frameworks)


## Further nitrogen compounds

MCM/GECKO-A | TUV | TUV reaction label
-----------:|----:|:------------------
CH3NO2 -> CH3 + NO2
RNO2 -> alkene + HONO
C2H5NO2 -> C2H5 + NO2
C2H5NO2 -> C2H4 + HONO
CH3(OONO2) -> CH3(OO) + NO2
CH3CO(OONO2) -> CH3CO(OO) + NO2
CH3CO(OONO2) -> CH3CO(O) + NO3
CH3CH2CO(OONO2) -> CH3CH2CO(OO) + NO2
CH3CH2CO(OONO2) -> CH3CH2CO(O) + NO3
PAN -> RCO(OO) + NO2
PAN -> RCO(O) + NO3

[Back to the top](#photolysis-reaction-numbers-in-different-model-frameworks)


## Alkyl dinitrates

MCM/GECKO-A | TUV | TUV reaction label
-----------:|----:|:------------------
CH3CH(NO3)CH2NO3 -> CH3CH(NO3)CH2O + NO2
C2H5CH(NO3)CH2NO3 -> C2H5CH(NO3)CH2O + NO2
CH3CH(NO3)CH(NO3)CH3 -> RO. + NO2
CH2(NO3)CH=CHCH2NO3 -> RO. + NO2
CH2=CHCH(NO3)CH2NO3 -> CH2=CHCH(NO3)CH2O + NO2

[Back to the top](#photolysis-reaction-numbers-in-different-model-frameworks)


## Alkyl hydroperoxides

MCM/GECKO-A | TUV | TUV reaction label
-----------:|----:|:------------------
CH3OOH -> CH3O + OH
(CH3)3COOH -> (CH3)3CO + OH
HOCH2OOH -> HOCH2O. + OH
CH3CO(OOH) -> Products

[Back to the top](#photolysis-reaction-numbers-in-different-model-frameworks)


## Criegee intermediates

Below _j_ values are only recommendations and not part of the actual protocol
due to the insignificance of Criegee intermediate photolysis.

MCM/GECKO-A | TUV | TUV reaction label
-----------:|----:|:------------------
CH2OO -> HCHO + O(3P)
CH3CHOO -> CH3CHO + O(3P)
synCH3CHOO -> CH3CHO + O(3P)
antiCH3CHOO -> CH3CHO + O(3P)
C2H5CHOO -> C2H5CHO + O(3P)
(CH3)2COO -> CH3COCH3 + O(3P)

[Back to the top](#photolysis-reaction-numbers-in-different-model-frameworks)


## Polyfunctional chromophores

MCM/GECKO-A | TUV | TUV reaction label
-----------:|----:|:------------------
CH3COCH2(ONO2) -> CH3COCH2(O.) + NO2
C2H5COCH2NO3 -> C2H5COCH2O + NO2
CH3COCH(NO3)CH3 -> CH3COCH(O.)CH3 + NO2
CH3COCH2CH2CH(OOH)CH3 -> RO. + OH
oxohexyl-hydroperoxide -> RO. + OH
genCH3CHO(poly)
genC2H5CHO(poly)
C4nALDpoly
C5nALDpoly
C6nALDpoly
C7nALDpoly
nALDpoly(C>7)
genluALD(poly)
genbMeuAld(poly)
genaMeuAld(poly)
genluuALD(poly)
genC2H5CHO(OHpoly)
C4nALDOHpoly
C5nALDOHpoly
C6nALDOHpoly
C7nALDOHpoly
nALDOHpoly(C>7)
genluALD(OHpoly)
genbMeuAldOH(poly)
genaMeuAldOH(poly)
genluuALD(OHpoly)
genC3cKet
genC4cKet
genC5cKet
genC6cKet
genC7cKet
genuKet(poly)
genKete(poly)
Ald (poly)
uDICARaa(poly)
uDICARak(poly)

[Back to the top](#photolysis-reaction-numbers-in-different-model-frameworks)


## Edwards et al. MCM halogen extensions

MCM/GECKO-A | TUV | TUV reaction label
-----------:|----:|:------------------
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

[Back to the top](#photolysis-reaction-numbers-in-different-model-frameworks)
