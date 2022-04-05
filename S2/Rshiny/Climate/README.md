## Liens des applications
-   [**Climate Dashboard**](https://nmh4598.shinyapps.io/Climate2/)
## Présentation
<div align="center">
<img src="https://youmatter.world/app/uploads/sites/2/2019/05/greenhouse-co2-climate.jpg" width="45%" style="min-height:'250px'"/>
</div>
Il est important que nous comprenions comment le climat change. Les gaz à effet de serre (GES) sont responsables du réchauffement climatique, qui affecte déjà notre monde aujourd'hui, un certain nombre d'espèces de plantes et d'animaux ont disparu et de plus en plus de personnes souffrent de climats extrêmes et de catastrophes naturelles.
Conscients que ce problème est très urgent et important, nous avons construit l'application R Shiny pour visualiser les émissions causées par l'Homme, permettant ainsi d'évaluer le processus de limitation des gaz à effet de serre de chaque nation.

## Les onglets de l’application R Shiny :
Notre application R Shiny se compose de quatre sections principales, une introduction aux sujets et au contenu de l'application, une carte du monde, des statistiques (ayant deux sous-sections : une section avec les graphiques de CO2 et de GES par secteurs, et une autre section avec les comparaisons par pays), et pour finir des tableaux de données.

## La carte
Apparaît dans cette section une carte des pays du monde entier, ici apparaissent deux options, sélectionnez l'année et sélectionnez les émissions à observer.
La couleur des pays changera selon ces deux options, représentant le niveau d'émissions de chaque pays.
Nous nous concentrons sur les trois principaux gaz à effet de serre, CO2, N2O et méthane de chaque pays, ainsi que le total de ces trois gaz.
<div align="center">
<img src="https://github.com/nmh4598/R-Master/blob/main/S2/Rshiny/Climate/Image/Map.png" style="min-height:'250px'"/>
</div>
- Interprétation sur un exemple: 
Lorsque les choix pour la carte sont : Année = 2018 et type de gaz à effet de serre = Co2

Sur la base de ce résultat, nous pouvons voir que par exemple, la Chine et les Etats-Unis ont émis plus de CO2 en millions de tonnes que les autres pays du monde en 2018. Pour avoir le détail de ces émissions, il suffit de cliquer sur un pays et cela affichera son taux d’émissions émis pour le gaz choisi cette année-là.

## Statistiques
### CO2 and GHG
<div align="center">
<img src="https://github.com/nmh4598/R-Master/blob/main/S2/Rshiny/Climate/Image/Statistiques.png" style="min-height:'250px'"/>
</div>
- Choose CO2 Origin

Lors de la sélection des catégories de CO2, l'application fournit des changements sur les deux graphiques sur la gauche des observations. Le line-graph nous permet de suivre les émissions du pays d'une année à l'autre des catégories sélectionnées. Le graphique à barres permet d’observer les émissions de CO2, mais par habitant de l'année sélectionnée.

- Choose GHG cause

Lors de la sélection des secteurs des émissions de gaz à effet de serre (GES), l'application fournit des changements sur les deux graphiques à droite représentant les gaz à effet de serre totaux par secteur, avec une fonctionnalité similaire à celle du CO2.

- Countries

Lors de la sélection du pays, les quatre graphiques seront mis à jour en fonction des données du pays (origines de ses émissions de CO2, ses émissions de gaz à effet de serre par secteur, ainsi que par habitant pour l’année prédéfinie).

- Year

Lors de la sélection de l’année, seuls les graphiques en barres changeront, car ces données sont fournies à l’année sélectionnée.
Pour les deux autres graphiques en haut, représentant les émissions de CO2 et de gaz à effet de serre par secteur, le choix de la période à observer se fait à l’aide du menu glissant de ce graphique directement (au niveau des flèches vertes sur l’image) afin d’observer les émissions sur toute une période.
### Comparaison

Cette section nous permet de comparer deux ou plusieurs pays, ce qui permet de comparer les progrès en matière de réduction des émissions. Nous fournissons de nombreuses comparaisons telles que les types de CO2 et les sources de GES.

<div align="center">
<img src="https://github.com/nmh4598/R-Master/blob/main/S2/Rshiny/Climate/Image/Comparaison.png" style="min-height:'250px'"/>
</div>

On observe que la quantité de gaz émise par la Chine est très importante, il y a une énorme différence par rapport aux autres pays, exemple des pays développés en Europe comme la France et l'Allemagne, même, sa tenance (de Chine) a fortement augmenté sur la période 2000-2010.
En termes d'émissions de gaz à effet de serre, une tendance similaire est observée, notamment que l'Inde a la plus grande quantité de gaz à effet de serre provenant de l'agriculture, bien que le total soit encore inférieur à celui de la Chine.
On peut dire que des pays comme la France, l'Allemagne, l'Italie font un excellent travail pour réduire les émissions.

## Les données
<div align="center">
<img src="https://github.com/nmh4598/R-Master/blob/main/S2/Rshiny/Climate/Image/Dataset.png" style="min-height:'250px'"/>
</div>

Nous utilisons les données de Our World In Data et de Climate Watch Data. Dans ce qui suit, nous présenterons les trois tables de données nettoyées:

- Table co2data : [Our World In Data](https://github.com/owid/co2-data).
Cette table représente les données annuelles par pays et par habitant du CO2 émis avec aussi l’origine de ces émissions (par exemple la combustion d’énergie fossile), couvrant 205 pays, de 1949 à 2020. Il est aussi noté l’émission des autres gaz à effet de serre tels que le méthane et l'azote en millions de tonnes.

- Table ghgdata : [ICOS](https://www.icos-cp.eu/science-and-impact/global-carbon-budget/2021).
Cette table représente les données annuelles des émissions de gaz à effet de serre par secteur, couvrant 200 pays, de 1990 à 2018.

- Table ghg_capdata : [The Climate Watch Data](https://www.climatewatchdata.org/data-explorer/historical-emissions?historical-emissions-data-sources=cait&historical-emissions-gases=all-ghg&historical-emissions-regions=All%20Selected&historical-emissions-sectors=total-including-lucf%2Ctotal-including-lucf&page=1).
Cette table représente les données annuelles des émissions de gaz à effet de serre par secteur et par habitant, couvrant 200 pays, de 1990 à 2018.

## Conclusion

L'application fournit une vue complète des origines des gaz, pour la comparaison et le suivi de phase. Tous les gaz provenant du comportement humain sont enregistrés, par exemple la combustion du charbon, du ciment, la combustion des terres ou des forêts, le gaz industriel, etc.
Nous nous rendons compte que, même si nous nous rappelons toujours le réchauffement climatique, nos efforts n'ont pas vraiment été efficaces. La tendance des émissions est toujours à la hausse depuis les années 1990 (du monde), il y a un point positif que depuis 2010 environ, la croissance n'est pas aussi forte qu'avant, le graphique à ce stade ressemble presque à une ligne horizontale stable.
Plus en détail, alors que quelques pays émettent encore de plus en plus de gaz, il y a certains pays qui ont fait un excellent travail en matière de protection de l'environnement comme la France, l'Allemagne, l'Italie, le Japon, etc dont les mesures pour limiter les émissions ont eu des résultats évidents.
<hr>
<center>

[NGUYEN Manh Hung](https://github.com/nmh4598) \| [DHENNIN Nolwenn](https://github.com/ndhennin) \| [PHAM Thi Minh Ngoc]()

</center>
