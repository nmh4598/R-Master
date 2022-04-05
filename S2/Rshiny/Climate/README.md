## Liens des applications
-   [**Climate Dashboard**](https://nmh4598.shinyapps.io/Climate2/)
## Présentation
Il est important que nous comprenions comment le climat change. Les gaz à effet de serre (GES) sont responsables du réchauffement climatique, qui affecte déjà notre monde aujourd'hui, un certain nombre d'espèces de plantes et d'animaux ont disparu et de plus en plus de personnes souffrent de climats extrêmes et de catastrophes naturelles.
Conscients que ce problème est très urgent et important, nous avons construit l'application R Shiny pour visualiser les émissions causées par l'Homme, permettant ainsi d'évaluer le processus de limitation des gaz à effet de serre de chaque nation.
## Les données
Nous utilisons les données de Our World In Data et de Climate Watch Data. Dans ce qui suit, nous présenterons les trois tables de données nettoyées:

- Table co2data : [(fichier : “owid-co2-data.csv”)](https://github.com/nmh4598/R-Master/blob/main/S2/Rshiny/Climate/Data/owid-co2-data.csv).
Cette table représente les données annuelles par pays et par habitant du CO2 émis avec aussi l’origine de ces émissions (par exemple la combustion d’énergie fossile), couvrant 205 pays, de 1949 à 2020. Il est aussi noté l’émission des autres gaz à effet de serre tels que le méthane et l'azote en millions de tonnes.

- Table ghgdata : [(fichier : “ghg-emissions-by-sector.csv”)](https://github.com/nmh4598/R-Master/blob/main/S2/Rshiny/Climate/Data/ghg-emissions-by-sector.csv).
Cette table représente les données annuelles des émissions de gaz à effet de serre par secteur, couvrant 200 pays, de 1990 à 2018.

- Table ghg_capdata : [(fichier : “(fichier : “per-capita-ghg-sector.csv”)”)](https://github.com/nmh4598/R-Master/blob/main/S2/Rshiny/Climate/Data/ghg-emissions-by-sector.csv).
Cette table représente les données annuelles des émissions de gaz à effet de serre par secteur et par habitant, couvrant 200 pays, de 1990 à 2018.

## Présentation des onglets de l’application R Shiny :
