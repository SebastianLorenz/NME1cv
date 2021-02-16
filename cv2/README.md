# 2. cvičení NME1 - Čísla v počítači

* Nastudujte si dokument: [Opakovani_teorie_chyby](https://github.com/SebastianLorenz/NME1cv/blob/master/cv2/teorie_chyby.pdf).
* V tomto cvičení budeme výjimečně pro demonstraci používat programovací jazyk C++. Měli by jste jej znát ze základů programování. Skripty si můžete spustit například v [online překladači](https://www.tutorialspoint.com/compile_cpp11_online.php).

Projděte si následující skripty:

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
   
* Chyba vstupních dat - pozor na špatně podmíněné úlohy!
* Chyba metody - [prográmek](https://github.com/SebastianLorenz/NME1cv/blob/master/cv2/chyba_metody.m)
* Zaokrouhlovací chyba

![alt text](https://github.com/SebastianLorenz/NME1cv/blob/master/cv2/chyba.gif)

Dokument pro zopakování: https://github.com/SebastianLorenz/NME1cv/blob/master/cv2/teorie_chyby.pdf

