#!bin/bash
for ((;;))
  do
    for s in web-1 web-2 web-3
      do
        wget -O /dev/null 10.0.0.8
        wget -O /dev/null 10.0.0.9
        wget -O /dev/null 10.0.0.10
    done
done


 
