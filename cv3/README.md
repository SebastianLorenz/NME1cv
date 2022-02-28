# Přímé řešení soustavy rovnic, LU dekompozice

V tomto cvičení se budeme zabývat implemetací základních algoritmů z lineární algebry.

Metody řešení soustav lineárních rovnic Ax=b se dělí na:
  * přímé - těmi se budeme zabývat dnes
  * iterační
  * gradientní

[Spouštěcí skript](cv3_worklist.m) (worklist) k dnešní hodině.

1) Implementace násobení matic A*B
* Měli by jste všichni zvládat z lineární algebry.
* Pro jistotu přikládám [kód](maticoveNasobeni.m). Nastudujte si ho. Tady je důležité jen to, aby si kód sám detekoval velikosti matic a rozhodoval zda vůbec lze matice násobit.

2) Gaussova eliminace
* Algoritmus by jste zase měli znát z lineární algebry.
* [Teorie](http://kfe.fjfi.cvut.cz/~limpouch/numet/linalg/node7.html) z přednášky.
* Ruční implementace přímého běhu [zde](gaussElim.m). Kód si projdite.

3) Zpětný běh
* Zpětný běh znamená výpočet x z horní trojůhelníkové matice (, kterou jsme dostali např. Gaussovou eliminací).
* Implementace [zde](zpetnyBeh.m). Kód si projdite.

4) LU dekompozice
* Přečtěte si [teorii](teorie_LU_dekompozice.pdf).
* Prostudujte si [implemetaci](luDekomp.m).

Úkol do 7.3.2022:
* Dnes jsme si ručně implementovali 4 algoritmy. Najděte k nim příslušné zabudované Matlabovské funkce (built-in MATLAB functions).
* Prostudujte, jaký algoritmus běží v Matlabovských funkcích.
* Najděte si, jakými příkazy lze v Matlabu měřit čas běhu funkce. (Hint: tic-toc)
* Vztvořte si nějaké velké matice (cca 1000x1000, podle výkonu vašeho počítače) s náhodnými prvky.
* Změřte rychlost našich ručně implementovaných funkcí a rychlost zabudovaných Matlabovských funkcí na těchto velkých maticích.
* Vše vepisujte do dnešního [worklistu](cv3_worklist.m) a bohatě **komentujte** přímo v kódu (%), co jste testováním zjistili!
