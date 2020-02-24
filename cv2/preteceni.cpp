#include <iostream>

using namespace std;

int main() {

    // Deklarace promennych - a, b jsou vstupy, do c ulozime jejich soucet
    short a, b, c; // Zmente typ na int, vyzkousejte i unsigned variantu
    
    cout << "Celociselne preteceni a+b" << endl;
    cout << "Zadejte cislo a: ";        // Zadejte treba 32000
    cin >> a;   // Cteni z konzole do promenne 'a'
    cout << "Zadejte cislo b: ";        // Zadejte treba 10000
    cin >> b;   // Cteni z konzole do promenne 'b'

    c = a + b;  // Nesmyslny vysledek pro typ short
    
    cout << "a + b = " << c << endl;
    
    return 0;
    
}
