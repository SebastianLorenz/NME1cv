# Numerická integrace
V [teorii](numint_skriptum.pdf) jsou probírány následující přístupy k numerickému výpočtu integrálu:

a) Převedení na ODE

b) Integrace aproximované funkce

c) Kvadraturní vzorce (možné zpřesnění pomocí Rombergovy metody)
* Odvození kvadraturních formulí pomocí Lagrangeova polynomu [zde](odvozeni_integrace_Lagrange.pdf)
* Odvození kvadraturních formulí metodou neurčitých koeficientů [zde](odvozeni_integrace_neurckoef.pdf)
* [Program](nintegral.m) na porovnání Obdélníkového, Lichoběžníkového pravidla a Simpsonovy metody - zkuste integrovat různé funkce a pohrajte si s počtem kroků
* Pro zájemce: Rombergova metoda - [text](teorie_Rombergova_metoda.pdf), [program](romberg.m)

d) Gaussovy kvadratury
* [Příklad](gaussint.m) implementace

e) Metoda Monte Carlo
* Teorie k metodě [zde](teorie_MC.pdf)
* [Skript](MC_k_doplneni.m) pro výpočet integrálu 1D funkce

DÚ: Upravte [skript](MC_k_doplneni.m) tak, aby dokázal počítat integrál z 2D funkcí a otestujte na 2 příkladech 2D funkcí (viz. komentáře ve skriptu)
