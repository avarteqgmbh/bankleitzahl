[![Build Status](https://travis-ci.org/avarteqgmbh/bankleitzahl.png?branch=master)](https://travis-ci.org/avarteqgmbh/bankleitzahl)

# Bankleitzahl

- fetch Bankleitzahlendatei from bundesbank.de
- load and parse Bankleitzahlendatei

## Installation

Add this line to your application's Gemfile:

    gem 'bankleitzahl'

## Bankleitzahldatei

Get the current Bankleitzahldatei from
http://www.bundesbank.de/Navigation/DE/Kerngeschaeftsfelder/Unbarer_Zahlungsverkehr/Bankleitzahlen/bankleitzahlen.html

There is a *Merkblatt Bankleitzahlendatei* describing the file format.

## Examples

``` ruby
content_lines = Bankleitzahl::Fetcher.current_lines # remote http request

bank = Bankleitzahl::Parser.new(content_lines).all_banks.first
bank.blz #=> "100000001"
bank.name #=> "Bundesbank"
bank.short_name #=> "BBk Berlin"
bank.zip #=> "10591"
bank.city #=> "Berlin"
bank.bic #=> "MARKDEF1100"
```
