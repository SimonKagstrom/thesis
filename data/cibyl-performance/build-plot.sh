#!/bin/sh

ploticus -textsize 11 -prefab vbars ylbldet="adjust=-0.16,0" yrange=0 data=$1 x=1 y=2 err=3 barwidth=0.45 vals=yes ylbl="Loop iterations" color="gray(0.4)" stubvert=yes "rectangle=1 1 3 2.5" -eps -o $2
