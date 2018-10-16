echo 'Create PVs from definition files'

cat /root/pvs/* | oc create -f -

echo 'Creation of PVs from definition files completed'
