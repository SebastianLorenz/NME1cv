#include <iostream>
#include <limits>

using namespace std;


int main(){
    long double cislo, eps;    // Zmente typ na double, pripadne long double
    cislo = 1;           // Absolutni hodnota epsilon je ruzna pro ruzna cisla
    eps   = 0.1 * cislo; // Pocatecni odhad epsilon

    // Zmensujeme eps, dokud po jeho pricteni ke vstupnimu cislu dostavame vetsi cislo
    // Odhad bude presny v ramci jednoho radu (ve dvojkove soustave, tj. muze se 2x lisit)
    while ( cislo+eps > cislo ){
        eps = eps / 2;  // Pro nasledujici iteraci vyzkousime polovicni eps
    }

    // Posledni iterace jiz hodnotu nezmenila, potrebujeme hodnotu z predposledni
    // iterace - ta je rovna dvojnasobku aktualni hodnoty eps.
    eps = 2 * eps;

    cout << "Odhad strojoveho epsilon je:       " << eps << endl;

    // Standardni knihovna ma definovane skutecne hodnoty strojoveho epsilon.
    // Nachazeji se v sablonove tride std::numeric_limits. Sablonovym parametrem je typ
    // u ktereho chceme epsilon urcit - napr.  std::numeric_limits<float>::epsilon()
    cout << "Strojove epsilon dle C++ knihovny: "
         << numeric_limits<decltype(cislo)>::epsilon() << endl;

    return 0;
}
