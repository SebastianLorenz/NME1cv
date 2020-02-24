#include <iostream>

using namespace std;

int main() {

    // Deklarace promennych - a, b jsou vstupy, do c ulozime jejich soucet
    short a, b, c; // Zmente typ na int, vyzkousejte i unsigned variantu
    
    cout << "Celociselne preteceni a+b" << endl;
    a = 32000; // zadejte prvni cislo (treba 32000)
    b = 11000; // zadejte druhe cislo (treba 11000)

    c = a + b;  // Nesmyslny vysledek pro typ short
    
    cout << "a + b = " << c << endl;
    
    return 0;
    
}
