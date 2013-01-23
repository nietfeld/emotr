i=0
name=0
for files in *.jpg
 do
     file=$(basename $files .jpg)
     echo "INSERT INTO photos VALUES($file, 1, $i)";
     let i=i+1;
 done

