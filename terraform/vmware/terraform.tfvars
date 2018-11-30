# vCenter connection
vsphere_vcenter = "10.127.83.176"

vsphere_user = ""

vsphere_password = ""

vsphere_unverified_ssl = "true"

vsphere_datacenter = "Datacenter"

vsphere_drs_cluster = "p-mk8s-cluster"

vsphere_resource_pool = "p-mk8s-cluster/Resources/kubernetes-kubespray"

vsphere_enable_anti_affinity = "true"

vsphere_vcp_user = ""

vsphere_vcp_password = ""

vsphere_vcp_datastore = "datastore1"

# Kubernetes infrastructure
vm_user = ""

vm_password = ""

vm_folder = "kubernetes-kubespray"

vm_datastore = "datastore1"

vm_network = "VM Network"

vm_template = "terraform-template/p-ubuntu-16.04-terraform-template"

vm_linked_clone = "true"

k8s_kubespray_url = "https://github.com/kubernetes-incubator/kubespray.git"

k8s_kubespray_version = "v2.5.0"

k8s_version = "v1.9.5"

k8s_master_ips = {
  "0" = "10.127.83.121"
  "1" = "10.127.83.122"
  "2" = "10.127.83.124"
}

k8s_worker_ips = {
  "0" = "10.127.83.131"
  "1" = "10.127.83.132"
  "2" = "10.127.83.133"
  "3" = "10.127.83.134"
}

k8s_haproxy_ip = "10.127.83.141"

k8s_netmask = "24"

k8s_gateway = "10.127.83.1"

k8s_dns = ["10.127.83.1", "8.8.8.8"] 

k8s_domain = ""

k8s_network_plugin = "flannel"

#k8s_weave_encryption_password = ""

k8s_dns_mode = "kubedns"

k8s_master_cpu = "1"

k8s_master_ram = "2048"

k8s_worker_cpu = "1"

k8s_worker_ram = "2048"

k8s_haproxy_cpu = "1"

k8s_haproxy_ram = "1024"

k8s_node_prefix = "k8s-kubespray"
