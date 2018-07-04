## PlantUML 

This is where I will create PlantUML diagrams.

If you would also like to create these diagrams, you must have java installed:

```Bash
$ sudo apt install default-jre
```
Then you must install Graphviz:

```Bash
$ sudo apt install graphviz
```
Download the [plantuml.jar](http://sourceforge.net/projects/plantuml/files/plantuml.jar/download) file from the plantuml website or go to [plantuml.com/starting](plantuml.com/starting) if the link is dead. Move the file from Downloads to your present working directory(optional):

```Bash
$ pwd
home/matt/git/plantUML
$ mv ~/Download/plantuml.jar .
```
Test plant uml in the jave runtime environment:

```Bash
$ java -jar plantuml.jar -testdot
The environment variable GRAPHVIZ_DOT has not been set
Dot executable is /usr/bin/dot
Dot version: dot - graphviz version 2.38.0 (20140413.2041)
Installation seems OK. File generation OK
```
