
# Tuktoro Feedback
Willkommen bei der Tuktoro Feedback Flutter-App – einem Prototyp für Kidstoy TUKTORO. Diese innovative Anwendung wurde entwickelt, um zu erforschen, wie Feedback für Kinder während ihres Lernprozesses, insbesondere bei mathematischen Berechnungen, effektiv gestaltet werden kann. Unser Ziel ist es, ein interaktives und ansprechendes Lernerlebnis zu schaffen, das Kinder dazu ermutigt, ihre Rechenfähigkeiten durch konstruktives Feedback zu verbessern. Da es sich um einen Prototyp handelt, liegt der Fokus auf der Funktionalität des Feedbacksystems, nicht auf der ästhetischen Gestaltung der Benutzeroberfläche.

## Übersicht
Tuktoro Feedback nutzt die Kraft von Rive Animationen, um die Frontend-Entwicklung zu vereinfachen und die App-Oberfläche intuitiv und für junge Benutzer ansprechend zu gestalten. Die Rive-Datei finden Sie im Assets-Ordner.

Ein wesentlicher Aspekt unseres Projekts ist die Bewertung der Machbarkeit der Nutzung von OpenAI's GPT-3.5 API für schnelle und zuverlässige sprachbasierte Antworten. Diese Entscheidung wird von der Unfähigkeit unserer Zielgruppe zu lesen angetrieben, daher ist eine Sprachausgabe für die Interaktion notwendig. Unsere App zielt darauf ab, das Verständnis und die Lösung von einfachen bis mäßig komplexen mathematischen Problemen zu erleichtern, indem Berechnungen in kleinere, handhabbare Schritte unterteilt und sprachgeführtes Feedback sowie Animationen zur Veranschaulichung der Konzepte bereitgestellt werden.

## Merkmale
Sprachausgabe für Anweisungen: Alle Anweisungen und Feedbacks werden durch Sprachausgabe geliefert, ergänzt durch ansprechende Animationen, die Berechnungsschritte visuell darstellen.

Lernen durch Spielen: Die TUKTORO-App verkörpert eher einen freundlichen Begleiter als einen traditionellen Lehrer, um eine spielerische und angenehme Lernumgebung zu fördern. Dieser Ansatz zielt darauf ab, eine positive Einstellung zum Mathematiklernen zu fördern.

Adaptives Lernen: Durch die Analyse vergangener Berechnungen zielt Tuktoro Feedback darauf ab, Muster im Lernprozess des Benutzers zu identifizieren, um personalisiertes Feedback bereitzustellen, das auf spezifische Verbesserungsbereiche abzielt.

## Prototyp- und Implementierungsplan
Dieser Prototyp dient dazu, die Funktionalität und Wirksamkeit des Feedbacksystems zu testen. Sollte sich das Konzept als erfolgreich erweisen, ist geplant, den Code in die Produktionsapp zu übernehmen. Daher ist die Gestaltung der Benutzeroberfläche in dieser Phase von untergeordneter Bedeutung, während der Schwerpunkt auf der Entwicklung und Erprobung der Kernfunktionen liegt.


## Beispiele
### Einfache Berechnungen
Beispiel: 12 - 3 - 2 = 7
Feedbackansatz: Wir leiten das Kind an, zuerst 12 - 2 zu berechnen, um auf eine Zehnerzahl zu kommen und dann 3 abzuziehen, um auf 7 zu kommen. Dieser Ansatz erleichtert es, mit den Fingern zu zählen.
### Komplexere Berechnungen
Beispiel: 12 * 3 - 2 = 34
Feedbackansatz: Zuerst berechnen wir 12 * 3. Um dies zu vereinfachen, teilen wir die Aufgabe in 10 * 3 + 2 * 3 auf. Das ergibt zuerst 30 und dann 6. Zusammen ergibt das 36, und nach Abzug von 2 kommen wir auf 34. Diese Schritte werden durch Sprachausgabe und Handanimationsunterstützung vermittelt.
### Analyse vergangener Berechnungen
Beispiel: Ein Kind rechnet häufig falsch, z.B. 10 - 3 = 8, 14 - 5 = 10, 9 - 3 = 7.
Feedbackansatz: Wir könnten dem Kind aufzeigen, dass es immer mit der falschen Zahl beginnt. Zum Beispiel bei 10 - 3: Das Kind könnte denken "10, 9, 8... das sind 3 Schritte. Also muss 10 - 3 die zuletzt genannte Zahl sein, also 8." Wir können konstruktives Feedback geben, um zu erklären, dass dies nicht der korrekte Ansatz ist.

## App Erklärung
Die App besteht aus 3 Seiten. Diese sind ein kleiner ausschnitt aus unserer großen App. Daher ist diese auch nicht sauber programmiert, sondern dient eher als Beispiel.
## 1. Spiel Seite
![Game Page](page1.png)
Es handelt sich hier um das "verliebte Zahlen" Spiel. Dieses besteht darin immer die Zahl zu finden, die zu der anderen passt um 10 zu ergeben. Wenn du nun also auf die entsprechd richtige Zahl klickst, dreht sich das Rad. Nach dem 4. drehen poppt ein Fenster.
## 2.Übersicht Seite
![Overview Page](page2.png)
Hier siehst du die gesammelten Daten und kannst ein Thema an geben. Diese seite wird später dem Kind nciht ersichtlich sein. Jedes Spiel wird später ein Thema haben anhand die AI dann auch eine geschichte erzählen soll.
Beipiel: Thema: Blumen mit Blüten die abfallen
Dann soll die AI anhand blumen und blüten eine Geschichte erzählen, die mit dem Spiel zu tun hat. Der Input test kann nach belieben stark erweitert werden.
## 3. Feedback Seite
![Feedback Page](page3.png)
Hier bekommt das Kind nun das Feedback. Alles soll in sprache ausgegeben werden. Das kind kann sich es erneut anhören oder als zu einfach / zu schwer markieren und so ein einfacheres / schwereres feedback bekommen. Gemeinsam wird dann schritt für schritt das Tema erneut erklärt und mit den Fingern gemeinsam gerechnet bis mann anschließend zu einer Lösung kommt die dann wieder mit dem Thema erklärt wird. Optional wäre es cool, wenn das ergebnis der Aufgabe von dem Kind ausgesprochen werden kann. Ihr dürft euch hier voll austoben und alles anpassen.