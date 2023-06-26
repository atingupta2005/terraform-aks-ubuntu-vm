subscription_id="Pay as you go - 19"

az account set --subscription "$subscription_id"

mylocations=("eastus" "eastus2"  "japaneast" "westus" "northeurope" "uksouth")

for i in $(seq 0 2); do
    mylocation=${mylocations[$i]}
	VM_RG="rg-vm-$i"

	ECHO az group create --name $VM_RG --location $mylocation
done

for i in $(seq 0 2); do
    mylocation=${mylocations[$i]}
	VM_RG="rg-vm-$i"
	
	for j in $(seq 0 9); do
		VM_NAME="vm-$i-$j"
		NSG_NAME="''"
		IMG_NAME="Canonical:0001-com-ubuntu-server-focal:20_04-lts:20.04.202006100"
		
		echo az vm create -n $VM_NAME -g $VM_RG --image $IMG_NAME --location $mylocation --size Standard_B1S --admin-username tuser --admin-password "Azure@123456" --ssh-key-values terraform-azure.pub --nsg $NSG_NAME --accept-term --authentication-type all --custom-data app1-cloud-init.txt --subscription "'$subscription_id'" --public-ip-sku Basic --public-ip-address-allocation dynamic --public-ip-address-dns-name "lnx-hpqzdp-$i-$j" --no-wait
	done
done
