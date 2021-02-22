# 2. cvičení NME1 - Čísla v počítači

* Nastudujte si dokument: [Opakovani_teorie_chyby](https://github.com/SebastianLorenz/NME1cv/blob/master/cv2/teorie_chyby.pdf).
* V tomto cvičení budeme výjimečně pro demonstraci používat programovací jazyk C++. Měli by jste jej znát ze základů programování. Skripty si můžete spustit například v [online překladači](https://www.tutorialspoint.com/compile_cpp11_online.php).

Projděte si následující skripty:

* Celá čísla
  * C++:
    * short: 2 bajty = 16 bitů => <-32768, 32767>
    * int: 4 bajty = 32 bitů => <-2^(31), 2^(31)-1>
  * [Prográmek](https://github.com/SebastianLorenz/NME1cv/blob/master/cv2/preteceni.cpp) demonstrující přetečení proměnné typu short.
  
* Čísla s desetinnou čárkou
  * Uložena jako: s x m x 2^(e) (dvojková soustava!)
    * s - znaménko
    * m - mantisa ... určuje přesnost čísla
    * e - exponent ... určuje rozsah čísla (i zde je znaménko na začátku exponentu)
  * C++:
    * float: 4 bajty = 32 bitů => 1 znaménko, 23 mantisa, 1+7 exponent
    * double: 8 bajtů = 64 bitů => 1 znaménko, 52 mantisa, 1+10 exponent
  * Strojové epsilon
    * Interval mezi čísly 1 a 2 je vždy rovnoměrný -> krok označíme jako strojové epsilon
  * [Prográmek](https://github.com/SebastianLorenz/NME1cv/blob/master/cv2/strojove_epsilon.cpp), který počítá odhad stojového epsilon.


* Chyba vstupních dat - pozor na špatně podmíněné úlohy!
* Chyba metody - [Prográmek](https://github.com/SebastianLorenz/NME1cv/blob/master/cv2/chyba_metody.m), který vizualizuje chybu metody při numerickém výpočtu derivace metodami 1. a 2. řádu.
* Zaokrouhlovací chyba - graf, na který se často ptají u zkoušky:

![alt text](https://github.com/SebastianLorenz/NME1cv/blob/master/cv2/chyba.gif)

Domácí úkol do 4.3.2021 (poslat na můj e-mail):
* Přepište [program](https://github.com/SebastianLorenz/NME1cv/blob/master/cv2/strojove_epsilon.cpp) odhadující strojové epsilon do MATLABu.
