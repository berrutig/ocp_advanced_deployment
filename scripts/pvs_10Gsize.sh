export GUID=`hostname|awk -F. '{print $2}'`

export volsize="5Gi"
mkdir /root/pvs

echo 'Now create the persistent volumes 26-20 of 10Gi each as RWM-Retain'

for volume in pv{26..50 ; do
cat << EOF > /root/pvs/${volume}
{
  "apiVersion": "v1",
  "kind": "PersistentVolume",
  "metadata": {
    "name": "${volume}"
  },
  "spec": {
    "capacity": {
        "storage": "${volsize}"
    },
    "accessModes": [ "ReadWriteMany" ],
    "nfs": {
        "path": "/srv/nfs/user-vols/${volume}",
        "server": "support1.${GUID}.internal"
    },
    "persistentVolumeReclaimPolicy": "Retain"
  }
}
EOF

echo  'Creation of persistent volumes 26-50 of 10Gi completed'
done;
