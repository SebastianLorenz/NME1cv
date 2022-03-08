Omlouvám se za zpoždění...

# Iterační metody řešení soustavy lineárních rovnic

Podmíněnost matice - často se objevuje u zkoušky.
* Projděte si [odvození](https://github.com/SebastianLorenz/NME1cv/edit/master/cv4/podminenost_matice.pdf).

Projdětě si krátké [opakování](https://github.com/SebastianLorenz/NME1cv/edit/master/cv4/teorie_iteracni_metody.pdf) k iteračním metodám.

Na přednášce se probírají a je potřeba znát následující 4 metody:
* Metoda prosté iterace
* Jacobiho metoda - skript s implementací [zde](jacobi.m)
* Gauss-Seidelova metoda - skript s implementací [zde](gausseidel.m)
* Superrelaxační metoda
* Skript pro porovnání rychlosti těchto 4 metod [zde](porovnani.m)

Skripty si projděte. Kdyby jste něčemu nerozuměli, tak se ptejte.

Úkol do 18.3.2021:
* Popište mi (do mailu) vlastními slovy: Co zobrazuje vykreslený graf ve [skriptu](porovnani.m) porovnávající metody? Jaký z toho usuzujete závěr? Proč Superrelaxační metoda bez ideální volby omega dopadla hůře než obyčejný Gauss-Seidel?
* Představte si, že neznáte předpis pro ideální volbu relaxačního faktoru *omega*. Napište skript (nebo stačí upravit [tento](porovnani.m)), který bude řešit soustavu Gauss-Seidelem + relaxační faktor. Ručně zvolte 6 různých hodnot omega a vykreslete prodobný graf jako ve skriptu porovnani.m, terý bude porovnávat výsledky pro různé *omega*.
