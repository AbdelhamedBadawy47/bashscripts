CUSTOM_ROLE_NAME=$1
CUSTO_ROLE_NAMESPACE=IDENTITY_NAMESPACE
for NAME_SPACE in $(oc get namespaces -o jsonpath='{.items[*].metadata.name}' | tr ' ' '\n')
do 
    for GROUP in $(oc get groups | awk '{print $2}');do

        echo " apllying the rolebinding '${CUSTOM_ROLE_NAME}_${NAME_SPACE}' for $GROUP on namespace $NAME_SPACE " |  \
         oc adm policy add-role-to-group CUSTOM_ROLE_NAME \
         $GROUP --role-namespace=CUSTOM_ROLE_NAMESPACE --rolebinding-name=${CUSTOM_ROLE_NAME}_${NAME_SPACE}
    done
done
