resource "netris_servercluster" "my-servercluster1" {
  name    = "my-servercluster1"
  adminid = data.netris_tenant.admin.id
  siteid  = netris_site.santa-clara.id
  # vpcid      = netris_vpc.my-vpc.id
  templateid = netris_serverclustertemplate.my-serverclustertemplate1.id
  tags       = ["boo", "foo"]

  # vpcmapping {
  #   postfix = "East-West"
  #   id      = netris_vpc.my-vpc.id
  # }

  # vpcmapping {
  #   postfix = "North-South-in-band-and-storage"
  #   id      = 0
  #   group   = "cluster-private"
  # }

  # vpcmapping {
  #   postfix = "OOB-Management"
  #   id      = 0
  #   group   = "cluster-private"
  # }

  servers = [
    netris_server.my-server01.id,
    netris_server.my-server02.id,
  ]

  # Only needed when the referenced template has a VNet whose VLAN mode is
  # "specify". One "vlan" block per such VNet postfix.
  vlan {
    postfix = "East-West"
    vlan_id = 100
  }
}
