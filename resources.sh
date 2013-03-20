BASE_URL="http://localhost:8080/escenic-admin/publication-resources/${1:-publication}/escenic"
RESOURCE_DIRECTORY="META-INF/escenic/publication-resources/escenic"
for file in $(ls $RESOURCE_DIRECTORY)
do
  echo updating $file file...
  if wget -q -O - $BASE_URL/$file --post-file $RESOURCE_DIRECTORY/$file
  then
    echo $file file updated
  else
    echo Problem updating $file
  fi
  echo
done
