CUSTOM_ROLE_NAME=CUSTOM_EDIT
CUSTOM_ROLE_BINDING_NAME=$1
CUSTO_ROLE_NAMESPACE=IDENTITY_NAMESPACE
for NAME_SPACE in $(oc get namespaces -o jsonpath='{.items[*].metadata.name}' | tr ' ' '\n')
do 
    for GROUP in $(oc get groups | awk '{print $2}');do
        oc adm policy add-role-to-group CUSTOM_ROLE_NAME  $GROUP --role-namespace=CUSTOM_ROLE_NAMESPACE --rolebinding-name=CUSTOM_ROLE_BINDING_NAME
    done
done