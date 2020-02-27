*** Settings ***
# Ici on inclut les librairies requises
Documentation  Test exemple

*** Variables ***
# Ici on définit les variables au besoin

*** Test Cases ***
# Ici on va écrire le script de tests

Log Hello World
	[Documentation]  Simple test hello world
	Log  hello world!

Log Goodbye
	[Documentation]  Simple log goodbye
	Log  goodbye!