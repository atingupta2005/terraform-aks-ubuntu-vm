subscription_id="acbda50e-8228-408d-90dd-1e3fc7b0c1e7"

az account set --subscription $subscription_id

mylocations=("eastus" "eastus2"  "japaneast" "westus" "northeurope" "uksouth")

for i in $(seq 1 6); do
    mylocation=${mylocations[$i]}
	VM_RG="rg-vm-$i"

	az group create --name $VM_RG --location $mylocation
	
	#azure network vnet create samplevnet -l $mylocation
done

for i in $(seq 1 3); do
    mylocation=${mylocations[$i]}
	VM_RG="rg-vm-$i"
	
	for j in $(seq 1 10); do
		VM_NAME="vm-$i-$j"

		echo az vm create -n $VM_NAME -g $VM_RG --image Ubuntu1804 --location $mylocation --size Standard_B1S   --admin-username tuser --admin-password "Azure@123456" --ssh-key-values terraform-azure.pub --accept-term --authentication-type all --custom-data app1-cloud-init.txt --subscription "$subscription_id" --public-ip-sku Basic --public-ip-address-allocation dynamic --public-ip-address-dns-name "lnx-hpqzdp-$i-$j"
	done
done
