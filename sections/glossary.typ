#import "../template.typ": *
#import "@preview/glossarium:0.5.10": make-glossary, register-glossary, print-glossary, gls, glspl

#show: make-glossary

#let entry-list = (
  (
    key: "kuleuven",
    short: "KU Leuven",
    long: "Katholieke Universiteit Leuven",
    description: "A university in Belgium.",
  ),
)

#register-glossary(entry-list)

This is a reference to #gls("kuleuven").

#print-glossary(
  entry-list,
  show-all: true,
)