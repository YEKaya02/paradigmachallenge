# OPDRACHT FUNCTIONEEL PARADIGMA
### Michel Koolwaaij
### Yunus Kaya 2145900
### 13 maart 2026

## Inhoudsopgave

## Inleiding

Het doel van deze opdracht is meer inzicht te krijgen in het functionele programmeerparadigma. Dit doe ik door een algoritme te implementeren in een functionele programmeertaal en daarbij bewust gebruik te maken van functionele concepten zoals pure functies, immutability, pattern matching en recursie. Zo kan ik leren hoe functioneel programmeren verschilt van imperatief en objectgeoriënteerd programmeren. 

Voor deze opdracht heb ik gekozen voor de programmeertaal Elixir. Elixir is een functionele programmeertaal die draait op de Erlang Virtual Machine (BEAM) en veel gebruikmaakt van immutability, pattern matching en recursie (The Elixir Programming Language, z.d.).

## 1 Onderzoek

In dit hoofdstuk wordt functioneel programmeren en concepten die hierbij horen onderzocht. Dit wordt specifiek gedaan voor de taal Elixir. De bronnen in dit hoofdstuk gaan niet allemaal specifiek over Elixir maar zijn wel allemaal relevant in Elixir.

### 1.1 Functioneel programmeren
Functioneel programmeren is een programmeerparadigma waarin programma’s worden uitgevoerd door expressies te evalueren (Functional Programming - HaskellWiki, z.d.). Functionele code kan dus in tegenstelling tot imperatieve code geen globale state aanpassen of side effects veroorzaken. Dit leidt tot voorspelbare en beter testbare code. Functies zijn in dit paradigma first class, dit houdt in dat functies als data behandelt kunnen worden. Functies kunnen dus bijvoorbeeld meegegeven worden aan andere functies als parameters of door een functie als return waarde worden gegeven. De nadruk bij functioneel programmeren ligt dus op wat er moet worden berekend in plaats van wat er stap voor stap moet gebeuren. 

### 1.2 Pure functies

Een pure functie is een functie die met dezelfde input altijd dezelfde output teruggeeft en geen bijwerkingen heeft (Pure - HaskellWiki, z.d.). Je kunt bijvoorbeeld een functie hebben `add(x, y) {return x + y}`, deze functie geeft bij dezelfde input waarde altijd dezelfde output zonder bijwerkingen en is dus puur.

### 1.3 Immutability

In Elixir zijn datastructuren zoals lijsten, tuples en maps standaard immutable. Dit betekent dat waarden niet aangepast kunnen worden nadat ze zijn aangemaakt. In plaats daarvan wordt er bij een wijziging een nieuwe waarde aangemaakt, waardoor onverwachte bijwerkingen worden voorkomen (Why Functional Programming? | Practical Elixir, z.d.).

### 1.4 Pattern matching

Pattern matching is een belangrijk onderdeel van Elixir. In veel programmeertalen wordt het `=` teken gebruikt voor toewijzing. In Elixir werkt dit anders het `=` teken probeert twee waarden met elkaar te matchen. (Pattern Matching — Elixir v1.18.1, z.d.)

Met pattern matching kunnen waarden uit datastructuren worden gehaald en kan het programma verschillende paden volgen afhankelijk van de structuur van de data. Pattern matching wordt vaak gebruikt in functie definities, case statements en bij het verwerken van lijsten.

### 1.5 Recursie

Recursie is een techniek waarbij een functie zichzelf stapsgewijs aanroept om een probleem op te lossen, totdat een eindconditie is bereikt (Recursion — Elixir v1.19.5, z.d.). In Elixir wordt recursie gebruikt als alternatief voor loops vanwege immutability.

### 1.6 Higher-order functies

Een higher-order functie is een functie die functies neemt als parameters of een functie als return waarde geeft (Higher Order Function - HaskellWiki, z.d.). Het belangrijkste van higher-order functies is dat je veelgebruikt gedrag op een plek kunt zetten en dit gemakkelijk kunt hergebruiken in je code.

### 1.7 Anonymous functies

Anonymous functies (lambdas) zijn functies zonder naam die opgeslagen kunnen worden in variabelen en doorgegeven kunnen worden aan andere functies, net zoals andere waarden zoals getallen of strings (Anonymous Functions — Elixir v1.19.5, z.d.). Dit is heel handig omdat je niet vooraf een functie hoeft te definieren maar deze gewoon inline mee kunt geven aan een higher-order functie.

## 2 Challenge
Voor deze opdracht heb ik gekozen voor Run-Length-Encoding compressie (RLE-compressie). Dit algoritme comprimeert en decomprimeert herhalende data. RLE is geschikt om functionele concepten zoals pattern matching en recursie toe te passen. 

Bij deze opdracht moet er worden nagedacht over hoe recursie en pattern matching gebruikt kan worden om opeenvolgende dezelfde tekens te tellen en hoe immutable datastructuren gebruikt kunnen om het gecomprimeerde resultaat op te bouwen. Eerder zou ik dit probleem aanpakken met loops en veranderlijke variabelen. Omdat ik vooral ervaring heb met imperatieve en objectgeoriënteerde talen, is het denken in pure functies en immutable data een nieuwe manier van programmeren. Dit maakt de opdracht leerzaam en uitdagend voor mij.

## 3 Implementatie

Voor de RLE-compressie en -decompressie heb ik modules in Elixir gemaakt die volledig functioneel werken. Bij compressie gebruik ik recursie om door de lijst met tekens te lopen. Met pattern matching check ik telkens of een teken hetzelfde is als het vorige en verhoog ik een teller. Omdat alle datastructuren immutable zijn, bouw ik het gecomprimeerde resultaat stap voor stap op zonder iets aan te passen wat er al is. De functies zijn puur omdat dezelfde input altijd dezelfde output geeft zonder bijwerkingen.

Bij decompressie doe ik iets soortgelijks, de gecomprimeerde lijst wordt recursief verwerkt. Met pattern matching haal ik telkens het teken en het aantal eruit. Daarna gebruik ik `List.duplicate` om de herhaalde tekens te maken en voeg ik die toe aan de accumulator. Zo herstel ik de originele tekst volledig functioneel, zonder loops of veranderlijke variabelen. Ook hier zijn de functies puur.

Voor het omzetten van de gecomprimeerde data naar een string gebruik ik een lambda samen met een higher-order functie: `Enum.map(fn {char, count} -> "#{char}#{count}" end)`. De lambda wordt inline gedefinieerd en zet de tuples om naar strings, zonder dat ik een aparte functie hoef te schrijven. Dit laat zien hoe gedrag hergebruikt kan worden en hoe higher-order functies en lambdas samenwerken.

Bij het inlezen en wegschrijven van bestanden gebruik ik ook pattern matching. Afhankelijk van wat `File.read` of `File.write` teruggeeft, kan ik direct bepalen of alles goed ging of dat er een foutmelding moet worden weergegeven. Zo hoef ik geen ingewikkelde if-structuren te maken.

## 4 Reflectie

Tijdens deze opdracht heb ik verschillende functionele concepten toegepast, namelijk pure functies, pattern matching, recursie, immutability, higher-order functies en lambdas. Pattern matching maakte het makkelijk om de verschillende gevallen in de input te onderscheiden, bijvoorbeeld bij het controleren of een teken hetzelfde is als het vorige of bij het afhandelen van foutmeldingen bij het inlezen en wegschrijven van bestanden. Lambdas en higher-order functions gebruikte ik om kleine functies inline mee te geven aan `Enum.map`, waardoor de code compact en leesbaar bleef. Pure functies en immutability zorgden ervoor dat het gedrag consistent bleef en dat ik zeker wist dat het resultaat van een functie altijd hetzelfde zou zijn voor dezelfde input.

Recursie vond ik het lastigst om toe te passen. Het is lastiger om na te gaan hoe de functie stap voor stap werkt, vooral omdat er geen loops zijn om eenvoudig te volgen hoe de teller en accumulator veranderen. Dit maakt het soms moeilijk om de flow van de functie in je hoofd te houden, vooral bij complexere logica. Pattern matching en lambdas vind ik juist heel makkelijk, omdat pattern matching het duidelijk maakt welke gevallen er zijn en lambdas kleine stukjes gedrag overzichtelijk inline houden. Pure functies en immutability maakten de code betrouwbaarder en voorspelbaar, omdat er geen onverwachte bijwerkingen zijn.

Een groot voordeel van de functionele aanpak is dat de code makkelijk te testen is. Doordat functies puur zijn en immutable data gebruiken, kan ik elke functie afzonderlijk aanroepen met dezelfde input en altijd dezelfde output verwachten. Zo kon ik de compressie- en decompressiefuncties eenvoudig testen met verschillende voorbeelden. Ook maakt pattern matching de foutafhandeling overzichtelijker en minder foutgevoelig dan ingewikkelde if statements.

Uit deze opdracht heb ik geleerd dat je voor functioneel programmeren op een hele andere manier moet denken, maar dat het veel voordelen heeft. De code is voorspelbaar, consistent en overzichtelijk, en kleine stukjes gedrag kun je makkelijk hergebruiken. In toekomstige projecten zou ik functioneel programmeren vaker gebruiken, vooral voor taken waar voorspelbaarheid en testbaarheid belangrijk zijn, zoals het verwerken van data of het schrijven van algoritmes die geen bijwerkingen mogen hebben.

## 5 Conclusie

In deze opdracht heb ik geleerd hoe functioneel programmeren werkt en hoe het anders is dan imperatieve of objectgeoriënteerde talen. Door het implementeren van het RLE-algoritme in Elixir heb ik geoefend met pure functies, immutability, pattern matching, recursie, higher-order functions en lambdas.  

Pattern matching en lambdas maakten de code duidelijk en overzichtelijk. Pure functies en immutability zorgen ervoor dat de resultaten voorspelbaar zijn en dat functies geen onverwachte bijwerkingen hebben. Recursie vond ik soms lastig, vooral als de logica wat ingewikkelder wordt, omdat je goed moet bijhouden hoe de waarden en accumulators veranderen. Higher-order functions helpen om stukjes gedrag op een plek te zetten en herbruikbaar te maken.  

Deze opdracht heeft me laten zien dat functioneel programmeren veel voordelen heeft. Het is makkelijker te testen, fouten zijn duidelijker, en kleine stukjes code zijn makkelijker te hergebruiken. Deze manier van programmeren kan ik in toekomstige projecten goed gebruiken, bijvoorbeeld bij het verwerken van data of bij algoritmes waarbij consistent gedrag belangrijk is.

## Bronnenlijst
The Elixir programming language. (z.d.). The Elixir Programming Language. https://elixir-lang.org/

Functional programming - HaskellWiki. (z.d.). https://wiki.haskell.org/index.php?title=Functional_programming

pure - HaskellWiki. (z.d.). https://wiki.haskell.org/Pure

Pattern matching — Elixir v1.18.1. (z.d.). https://hexdocs.pm/elixir/1.18.1/pattern-matching.html

Recursion — Elixir v1.19.5. (z.d.). https://hexdocs.pm/elixir/recursion.html

Higher order function - HaskellWiki. (z.d.). https://wiki.haskell.org/index.php?title=Higher_order_function

Why functional programming? | Practical Elixir. (z.d.). Practical Elixir. https://practical-elixir.woojiahao.com/why-functional-programming#referential-transparency

Anonymous functions — Elixir v1.19.5. (z.d.). https://hexdocs.pm/elixir/anonymous-functions.html