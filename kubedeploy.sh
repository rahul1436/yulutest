sed -i 's/{BUILD_NUMBER}/'${BUILD_NUMBER}'/g' test.yaml
sed 's/[$,]//g' test.yaml > test2.yaml
