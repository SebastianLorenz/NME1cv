# Čísla v počítači
* Celá čísla
  * C++:
    * short: 2 bajty = 16 bitů => <-32768, 32767>
    * int: 4 bajty = 32 bitů => <-2^(31), 2^(31)-1>
  * Přetečení: [prográmek](https://github.com/SebastianLorenz/NME1cv/blob/master/cv2/preteceni.cpp)

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
    * [Prográmek](https://github.com/SebastianLorenz/NME1cv/blob/master/cv2/strojove_epsilon.cpp)

Online překladač C++ [zde.](https://www.tutorialspoint.com/compile_cpp11_online.php)

# Chyby v numerice

* Chyba vstupních dat - pozor na špatně podmíněné úlohy!
* Chyba metody
* Zaokrouhlovací chyba

![alt text](https://github.com/SebastianLorenz/NME1cv/blob/master/cv2/chyba.gif)

Dokument pro zopakování: https://github.com/SebastianLorenz/NME1cv/blob/master/cv2/teorie_chyby.pdf




# Oprava příkladů z domácího cvičení

