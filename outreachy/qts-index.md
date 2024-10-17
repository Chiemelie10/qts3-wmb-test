
# The QuickStatements home page

The QuickStatements home page is the user interface for the tool, QuickStaments, developed by Magnus Manske, for creating and editing Wikidata items using simple set of text commands. It greatly simplifies the process of editing bulk Wikidata items.

## Table of contents

1. The navigation buttons<br>
   1.1 Login<br>
   1.2 Git<br>
   1.3 New batch<br>
   1.4 QuickStatements 3.0

2. The new batch form<br>
   2.1 Command format<br>
    -    CSV command format<br>
    -    V1 command format<br>
   2.2 Custom bacth name<br>
   2.3 Text area for entering commands<br>
   2.4 Error message

## 1.0 The navigation buttons

Navigation buttons on the QuickStatements home page is used to redirect a user to another page or reload the same page in some cases. Below we will look at some of these buttons.

### 1.1 Login

The Login button is crucial for authentication and autorization of users, it is visible at the top right corner of the page but it gets replaced by the user's username and "Your last batches" button after a successful sign in. Clicking the button takes a user to a page that requests for login data that is usually known only by the user and the application. The application uses those details to identify the user, giving the user access to certain resources of the QuickStatements tool that are otherwise restricted.

### 1.2 Git

This button is a link to QuickStaments Github repository, which has some of the python code used to create the QuickStatements tool and a README.md file that teaches simple steps on how to run the QuickStaments tool on a local machine.

### 1.3 New batch

The two new batch buttons on the home page have the same functionality as they are both links to the same page. Clicking any of the two buttons redirects a user to a page that displays a form that can be used to create, edit and delete Wikidata items. Usage of the form is discussed in more details in the new batch form section.

### 1.4 QuickStatements 3.0
Clicking this button redirects the user to home page or reloads the home page if the user is currently on the home page. The purpose is to make it easier for users that are no longer on the home page to return to the page.

## 2.0 The new batch form

The new batch form has three input fields and a execute button for submitting the form. The input fields are:
- Command format
- Custom batch name
- Text area for entering commands

## 2.1 Command format

CSV and V1 are the command formats available on the QuickStamets tool. There is no advantage of using one over the other as they are efficient in handling few or bulk Wikidata edits. Each of the command formats has its syntax and structure which must be followed when entering commands in the text area of the form, we will look at the syntax and structure next.

## CSV

In all files with a .csv extension, commas seperate columns while new lines seperate rows, with the first row being the header. The QuickStatements CSV command format is structured that way, with the difference being that there are defined rules, specifically for the tool, that must be followed for the edit to be successful. The accepted values for header labels are:

- qid (item id)
- PXXXX (property id)
- LXXXX-FXXXX (form id)
- LXXXX (lexeme id)
- LXXXX-SXXXX (Sense id)
- SXXXX (Source id)
- sXXXX (Source)
- qalXXXX (qualifier)
- Len (label)
- Den (description)
- Aen (alias)
- Senwiki (sitelink)
- \# (comment)

The following should be noted about the header row:

-  Only qid is required and must be the label of the first column.
- "en" in Len, Den, Aen and Senwiki is a language code for English and can be changed to the language code of any other language.
- "XXXX" in PXXXX are used in place of unknown numbers, for example, property ID can be P12, P1234 or P5678, depending on the Property id being used.
- "XXXX" in SXXX and others are also used in place of numbers but the difference are that these numbers are numbers of a property ID without the P.
- The order of the columns must be in such a way that at least one of the entity types which includes an alias, description, label, sitelink or property must come before a qualifier, comment or source.

Example of a bad header arrangement:
qid,SXXXX,PXXXX,Len,Den,#

Example of a good header arrangement:
qid,P1234,Len,Den,SXXXX,sXXXX,#

#### qid

This the id of the item or entity to be edited and it must always be the label of the first column even when creating a new item. Its value can be of the form QXXXXX or MXXXXX, and must be used when editing an item. A new item is created when this value is ommited.

#### PXXXX

This is the label for the property id column, its value can be of the form QXXXX or MXXXX and it can be the next column after the qid column.

#### Len

The L in Len stands for label while the last two letters are any valid language code. Therefore, Len simply means the label of the item being created or edited is written in English.

#### Den

This means description written in english. Like Len, the last two letters shows the language used and it can be changed.

#### Aen

Aen is an alias written in english. Similar to Len and Den, its last two letters can changed.

#### SXXXX

This is the label for the source column and its value is of the form QXXXX.

#### sXXXX

This is the header for the source column and its value can be a string.

#### SenWiki

This is used for adding a sitelink.

#### \#
The number sign character is used for adding a comment. The value can be a string.

### Creation of a new item

To add a new item, qid must be the first column, its value should be omitted and The order of the columns must be in such a way that at least one of the entity types which includes an alias, description, label, sitelink or property must come before a qualifier, comment or source. See the example below:

qid,P1234,Len,Den,S1234,s1234,#
,Q5,Label of the item in English,Description in English,Q2345,source used,Comment about the new item being added

### Changing or adding a value to an item

The difference between creating a new item and editing an existing one is that the qid column will have a value when editing an existing item. Below is an example:

qid,P1234,Len,Den,S1234,s1234,#
Q123456,Q5,Label of the item in English,Description in English,Q2345,source used,Comment about the new item being added

### Deleting a value from an item

Adding hyphen sign to any value in the header row deletes that column and removes its value from the item after clicking the execute button of the form. Here is an example:

qid,P1234,Len,-Den,S1234,s1234,#
Q123456,Q5,Label of the item in English,Description in English,Q2345,source used,Comment about the new item being added

## V1

Using the V1 command format gives the same end result as the CSV command format but it has its own rules and structure which must be followed to get a successful edit or creation of Wikidata items. We will look at these rules and structures next.

- It uses "|" to seperate diferent parts of a statement and "||" to indicate a new line which seperates commands. Pressing the "enter" key on the keyboard can be used in place of "||" in the text area of the form.
- A statement must have at least an entity, property and value. An entity can be the qid of an item like Q123456 or the word "LAST", a property can be a valid property id like P1234, and a value can be the value of the property id like Q5, 
- A Command can have one or more words or be a statement, it must be on seperate lines or be seperated by "||".
- !SXXXX is used to add a reference to a property. !SXXXX and its value must not come before property id and its value in a statement. Example: Q12|P1234|Q5|!S123|Q76.
- `/* */` is used to add a comment to a command. Example: Q12|P1234|Q5|!S123|Q76|`/* Comment here */`

### Creation of a new item

To create a new item, the word "CREATE" must be the only statement on the first line, followed by one or more statements. The word "LAST" is used in place of the qid of an item to show the command on that line is for the item being created. Example:

CREATE<br>
LAST|P1234|Q5|`/* Comment here */`<br>
LAST|Len|"The label in English"<br>
LAST|Den|"The description in English"

This above example is the same as the following:

CREATE||LAST|P1234|Q5|`/* Comment here */`||LAST|Len|"The label in English"||LAST|Den|"The description in English"

### Changing or adding a value to an item

To edit an item, a statment that has the qid of the item, properity id to be added and the new value must be provided. Example:

Q34|P1234|Q7

The above example adds the value represented by Q7 to the item with qid Q34.

### Deleting a value from an item

To delete an a property from an item, a hyphen is prepended to the qid of the item. Example:

-Q34|P1234|Q7

## 2.2 Custom batch name

The custom batch name is the second input field of the form. This field allows the user to name the bacth of commands that will be execusted. If not provided, the batch name "user:anonymous {date and time of submition}" is given as the name for the batch of commands submitted.

## 2.3 Text area for entering commands

This is the field in which the user creates, adds, changes and deletes items and its values using the command formats explained above.

## 2.4 Error message

The new batch page displays errors that prevents the execute button from running successfully. The error us displayed in a position between the heading "New batch" and the form, it only displays if there is an error.
