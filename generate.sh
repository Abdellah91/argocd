#! /bin/bash

#export images='service1=image1:545 service2=image2:23 service3=image3:12'
# sh -c "./array2.sh '$images'"

#images=$1

if [[ -z "${images}" ]]
then
  echo "[INFO] No images override ... continue"
else
  while IFS="=" read -r service image; do
    echo "kustomize edit set image ${service}=${image}"
  done < <(
      echo "${images}" | xargs | tr ' ' '\n'
    )
fi

echo "kubectl kustomize . | myplugin"

