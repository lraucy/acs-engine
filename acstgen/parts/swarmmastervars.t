    "adminUsername": "[parameters('linuxAdminUsername')]",
    "agentStorageAccountsCount": 5,
    "agentCustomScript": "[concat('/usr/bin/nohup /bin/bash -c \"/bin/bash /opt/azure/containers/configure-swarm-cluster.sh ',variables('clusterInstallParameters'),' >> /var/log/azure/cluster-bootstrap.log 2>&1 &\" &')]",
    "agentRunCmd": "[concat('runcmd:\n -  [ /bin/bash, /opt/azure/containers/install-cluster.sh ]\n\n')]", 
    "agentRunCmdFile": "[concat(' -  content: |\n        #!/bin/bash\n        ',variables('agentCustomScript'),'\n    path: /opt/azure/containers/install-cluster.sh\n    permissions: \"0744\"\n')]",
    "clusterInstallParameters": "[concat(variables('masterCount'), ' ',variables('masterVMNamePrefix'), ' ',variables('masterFirstAddr'), ' ',variables('adminUsername'),' ',variables('postInstallScriptURI'),' ',split(variables('masterSubnet'),'0/24')[0])]", 
    "computeApiVersion": "2016-03-30", 
    "masterSubnet": "[parameters('masterSubnet')]", 
    "masterAvailabilitySet": "[concat(variables('orchestratorName'), '-master-availabilitySet-', variables('nameSuffix'))]", 
    "masterCount": {{.MasterProfile.Count}}, 
    "masterCustomScript": "[concat('/bin/bash -c \"/bin/bash /opt/azure/containers/configure-swarm-cluster.sh ',variables('clusterInstallParameters'),' >> /var/log/azure/cluster-bootstrap.log 2>&1\"')]", 
    "masterEndpointDNSNamePrefix": "[tolower(parameters('masterEndpointDNSNamePrefix'))]", 
    "masterFirstAddr": 5, 
    "masterLbBackendPoolName": "[concat(variables('orchestratorName'), '-master-pool-', variables('nameSuffix'))]", 
    "masterLbID": "[resourceId('Microsoft.Network/loadBalancers',variables('masterLbName'))]", 
    "masterLbIPConfigID": "[concat(variables('masterLbID'),'/frontendIPConfigurations/', variables('masterLbIPConfigName'))]", 
    "masterLbIPConfigName": "[concat(variables('orchestratorName'), '-master-lbFrontEnd-', variables('nameSuffix'))]", 
    "masterLbName": "[concat(variables('orchestratorName'), '-master-lb-', variables('nameSuffix'))]", 
    "masterPublicIPAddressName": "[concat(variables('orchestratorName'), '-master-ip-', variables('masterEndpointDNSNamePrefix'), '-', variables('nameSuffix'))]", 
    "masterStorageAccountName": "[concat(variables('storageAccountBaseName'), '0')]", 
    "masterSubnetName": "[concat(variables('orchestratorName'), '-masterSubnet')]", 
    "masterSubnetRef": "[concat(variables('vnetID'),'/subnets/',variables('masterSubnetName'))]", 
    "masterFirstAddrOctets": "[split(parameters('firstConsecutiveStaticIP'),'.')]",
    "masterFirstAddrOctet4": "[variables('masterFirstAddrOctets')[3]]",
    "masterFirstAddrPrefix": "[concat(variables('masterFirstAddrOctets')[0],'.',variables('masterFirstAddrOctets')[1],'.',variables('masterFirstAddrOctets')[2],'.')]",
    "masterVMNamePrefix": "[concat(variables('orchestratorName'), '-master-', variables('nameSuffix'), '-')]", 
    "masterVMSize": "[parameters('masterVMSize')]", 
    "nameSuffix": "{{GetUniqueNameSuffix}}", 
    "networkApiVersion": "2016-03-30", 
    "orchestratorName": "swarm", 
    "osImageOffer": "UbuntuServer", 
    "osImagePublisher": "Canonical", 
    "osImageSKU": "14.04.4-LTS", 
    "osImageVersion": "latest", 
    "postInstallScriptURI": "disabled", 
    "sshKeyPath": "[concat('/home/', variables('adminUsername'), '/.ssh/authorized_keys')]", 
    "sshRSAPublicKey": "[parameters('sshRSAPublicKey')]", 
    "storageAccountBaseName": "[uniqueString(concat(variables('masterEndpointDNSNamePrefix'),resourceGroup().location))]", 
    "storageAccountPrefixes": [ "0", "6", "c", "i", "o", "u", "1", "7", "d", "j", "p", "v", "2", "8", "e", "k", "q", "w", "3", "9", "f", "l", "r", "x", "4", "a", "g", "m", "s", "y", "5", "b", "h", "n", "t", "z" ],
    "storageAccountPrefixesCount": "[length(variables('storageAccountPrefixes'))]", 
    "storageApiVersion": "2015-06-15", 
    "virtualNetworkName": "[concat(variables('orchestratorName'), '-vnet-', variables('nameSuffix'))]", 
    "vmsPerStorageAccount": 20, 
    "vnetID": "[resourceId('Microsoft.Network/virtualNetworks',variables('virtualNetworkName'))]"
 