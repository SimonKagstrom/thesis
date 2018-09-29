#!/bin/sh

for file in `ls *-sun.dat`; do
    out=`echo $file | sed 's/.dat//g'`
    m4 -DIN_AXIS_NAME="Time (ms)" -DTITLE_POS="3.8,-0.2" -DIN_TITLE="Sun JVM" -DIN_FILENAME=$file plot-script.scr | ploticus /dev/stdin -eps -o $out.eps
    epstopdf $out.eps --outfile=$out.pdf
    rm -f $out.eps
done

for file in `ls *-kaffe.dat`; do
    out=`echo $file | sed 's/.dat//g'`
    m4 -DIN_AXIS_NAME="" -DTITLE_POS="2.65,-0.2" -DIN_TITLE="Kaffe" -DIN_FILENAME=$file plot-script.scr | ploticus /dev/stdin -eps -o $out.eps
    epstopdf $out.eps --outfile=$out.pdf
    rm -f $out.eps
done

for file in `ls *-sablevm.dat`; do
    out=`echo $file | sed 's/.dat//g'`
    m4 -DIN_AXIS_NAME="" -DTITLE_POS="3.8,-0.2" -DIN_TITLE="SableVM" -DIN_FILENAME=$file plot-script.scr | ploticus /dev/stdin -eps -o $out.eps
    epstopdf $out.eps --outfile=$out.pdf
    rm -f $out.eps
done

for file in `ls *-gij.dat`; do
    out=`echo $file | sed 's/.dat//g'`
    m4 -DIN_AXIS_NAME="" -DTITLE_POS="3.8,-0.2" -DIN_TITLE="Gij" -DIN_FILENAME=$file plot-script.scr | ploticus /dev/stdin -eps -o $out.eps
    epstopdf $out.eps --outfile=$out.pdf
    rm -f $out.eps
done

./build-plot.sh freemap.dat freemap.eps
epstopdf freemap.eps --outfile=freemap.pdf
rm -f freemap.eps
