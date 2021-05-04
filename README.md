# BuildX-purescript-api

An experiment into the viability of using purescript for the client side API in build-x. This takes Thomas Honeyman's Real World Halogen app as
a template. (https://thomashoneyman.com/guides/real-world-halogen/). His comments are left in for the sake of clarity.

We also were considering Elm.

Typescript is not ideal at dealing with optional values (and airtable, being less controleld than a standard postresql db, often has many optional values). 
Elm/Purescript have better capacity at dealing with this sort of remote data, potentially, although perhaps the effort required to integrate it is not worth it.

It seems as if purescript provides really good control and composbility as a client side API, but the 'prettyness' of the code is no great reason to choose
it over typescript. 
