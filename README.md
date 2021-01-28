# Expenses_app

This app is the first project made in the course [
Flutter & Dart - The Complete Guide [2021 Edition]](https://www.udemy.com/course/learn-flutter-dart-to-build-ios-android-apps/) by [Maximilian Schwarzmüller](https://www.udemy.com/course/learn-flutter-dart-to-build-ios-android-apps/#instructor-2).

This project is just a way to experiment and learn Flutter and Dart by following the instructor step by step.

# Get Started

1. Clone the repository
2. Install all the dependencies (should be done automatically by your IDE)
3. You must have a simulator (iOS or Android) in order to run the app
4. Run the app without debugging
5. Have fun

# Screnshots

## Homepage

In the homepage there is a chart showing the last seven days and the expenses related to them. <br>
The current day is the first one on the right.
<br>
Through the 2 plus button you can enter a new transaction.
<br>
<br>

![Homepage](/screenshots/ExpensesApp_homepage.PNG)

## Add Transaction

In the new transaction modal you can add a title, amound and the date you have bought a certain item.
<br>
Validation is missing and the error management is basic.
Probably the next projects will be more refined, if not I will start my own project trying to bring all the best practices I use daily during my job.
<br>
<br>

![Add Transaction](/screenshots/ExpensesApp_new_transaction.PNG)

## Homepage With Transaction

After adding a transaction that's how the homepage will look.
<br>
The chart is well showing the change, considering the new transaction added.
<br>
It's possible to remvoe the transaction through the bin button.
<br>
<br>

![Homepage_With_Transaction](/screenshots/ExpensesApp_homepage_with_transaction.PNG)

## Landscape orientation
In landscape orientation the application displays a switch that allows the user to choose between the chart or the transaction list to improve the visibility given the reduced screen space.

### Landscape - transactions list
![Homepage_With_Transaction](/screenshots/ExpensesApp_landscape_transactions.PNG)

### Landscape - Chart
![Homepage_With_Transaction](/screenshots/ExpensesApp_landscape_show_chart.PNG)
