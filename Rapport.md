# OPDRACHT FUNCTIONEEL PARADIGMA
### Michel Koolwaaij
### Yunus Kaya 2145900
### 13 maart 2026

## Inhoudsopgave

## Inleiding

## 1 Onderzoek
In dit hoofdstuk wordt functioneel programmeren en concepten die hierbij horen onderzocht. Dit wordt specifiek gedaan voor de taal Elixir.

### 1.1	Functioneel programmeren
Functioneel programmeren is een programmeerparadigma waarin programma’s worden uitgevoerd door expressies te evalueren (Functional Programming, n.d.). Functionele code kan dus in tegenstelling tot imperatieve code geen globale state aanpassen of side effects veroorzaken. Dit leidt tot voorspelbare en beter testbare code. Functies zijn in dit paradigma first class, dit houdt in dat functies als data behandelt kunnen worden. Functies kunnen dus bijvoorbeeld meegegeven worden aan andere functies als parameters of door een functie als return waarde worden gegeven. De nadruk bij functioneel programmeren ligt dus op wat er moet worden berekend in plaats van wat er stap voor stap moet gebeuren. 

### 1.2	Functionele concepten
In dit hoofdstuk worden een aantal functionele concepten onderzocht die relevant zijn voor Elixir en de implementatie van RLE-algoritme. Niet alle theoretische definities komen rechtstreeks vanuit Elixir documentatie. Dit zijn algemene functionele concepten die ook van toepassing zijn op Elixir. Het doel is om deze concepten te onderzoeken zodat deze toegepast kunnen worden.

### 1.2.1	Pure functies
Pure functies zijn functies die met dezelfde input altijd dezelfde output teruggeven (Pure, n.d.). Je kunt bijvoorbeeld een functie hebben add(x, y) die x en y optelt, deze functie geeft bij dezelfde input waarde altijd dezelfde output en is dus puur.

### 1.2.2	Higher-order functies
Een higher-order functie is een functie die functies neemt als parameters of een functie als return waarde geeft (Higher order function, n.d.). 

### 1.2.3	Immutability
### 1.2.4	Recursie
Recursie is een techniek waarbij een functie zichzelf stapsgewijs aanroept om een probleem op te lossen, totdat een eindconditie is bereikt (Recursion, n.d.). In Elixir wordt recursie gebruikt als alternatief voor loops vanwege immutability.

### 1.2.5	Pattern matching
Pattern matching is een techniek waarbij datastructuren worden vergeleken op basis van hun vorm, in plaats van conditionele logica (Pattern matching, n.d.). Stel je hebt de variabele x die gebonden is aan de waarde 1, kun je pattern matching als volgt gebruiken 1 = x. In een imperatieve taal zou je hier bijvoorbeeld x == 1 moeten doen.

## 2 Challenge
Voor deze opdracht heb ik gekozen voor Run-Length-Encoding compressie (RLE-compressie). Dit algorithem comprimeert en decomprimeert herhalende data. RLE is geschikt om functionele concepten zoals patternmatching en recursion op toe te passen. 

De challenge is uitdagend omdat ik naast het inlezen en het schrijven naar bestanden ook de data verwerk op een functionele manier. Eerder zou ik dit aangepakt hebben op een imperatieve manier met loops. Omdat ik vooral met imperatieve en object georienteerde talen heb gewerkt is het denken in pure functies en immutable data een nieuwe manier van programmeren. Dit maakt de opdracht leerzaam en uitdagen voor mij.


## 3 Implementatie

## 4 Reflectie

## 5 Conclusie

## Verwijzingen
