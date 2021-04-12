# Řešení nelineárních rovnic
Teorie viz. [přednáška](http://kfe.fjfi.cvut.cz/~limpouch/numet/nr.pdf)
* Metoda půlení intervalu - [skript](pulintervalu.m)
* Metoda sečen - [skript](secny.m)
* Metoda tečen - [skript](tecny.m)
* Müllerova metoda - [vysvětlení](teorie_Mullerova_metoda.pdf), [skript](muller.m)

DÚ do 22.4.2021: Vidíte, že hledání kořene je založeno na celkem jednoduchých principech. Zkuste si vymyslet nějkou vlastní originální metodu hledání kořene u funkcí s jednou proměnnou. Napište pro tuto metodu skript v Matlabu a sledujte její chování  (vykreslete vývoj řešení, vývoj chyby a spočítejte řád metody podobně jako u skriptů výše) alespoň na 3 různých příkladech funkcí. Krátce vaši metodu popište, zhodnotťe její výhody a nevýhody, porovnejte s výše zmíněnými metodami.
Nápady: Zkuste například použít dělení intervalu v jiném poměru než 1:1 / průměrování více metod / interpolaci a na ní hledat kořen / nějaký relaxační faktor / atd.... Myslím, že vás určitě napadne něco originálního ;-)

# Hledání extrémů funkcí
* Funkce jedné proměnné
  * Metoda zlatého řezu - [skript](zlatyrez.m)
  * Parabolická interpolace - [skript](parabolickaint.m)
* Funkce více proměnných
  * Simplexová metoda - [článek](https://en.wikipedia.org/wiki/Nelder%E2%80%93Mead_method) na Wiki s animacemi, [skript](simplexm.m)
  * Bonus pro masochisty: [teorie](poznamky_konjug_smery_a_gradienty.pdf) k metodě konjugovaných gradientů
