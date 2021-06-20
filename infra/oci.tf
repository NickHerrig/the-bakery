data "oci_identity_availability_domains" "ads" {
  compartment_id = "ocid1.tenancy.oc1..aaaaaaaaor5rtzfaz6jthjxca6cjxrnuqpez6r26sjrfv7e6ijpsajl5tfcq"
}

resource "oci_core_instance" "homelab_one" {
  availability_domain = data.oci_identity_availability_domains.ads.availability_domains[1].name
  compartment_id      = "ocid1.tenancy.oc1..aaaaaaaaor5rtzfaz6jthjxca6cjxrnuqpez6r26sjrfv7e6ijpsajl5tfcq"
  shape               = "VM.Standard.E2.1.Micro"  

  source_details {
    source_id         = "ocid1.image.oc1.iad.aaaaaaaadbfugk7yavmaoy2seyncuj23q4r7junesaxtt7iyokegifo574ia"
    source_type       = "image"
  }

  display_name        = "homelab_one" 

  create_vnic_details {
    subnet_id         = "ocid1.subnet.oc1.iad.aaaaaaaae3nvcyqmhczaiq6mq5hiyegz73kfp5hmn75xgnjwhdio52tgqvzq"
    assign_public_ip  = true
  }

  metadata = {
    ssh_authorized_keys = file("${path.module}/ssh_keys/nick.pub")
  }

  preserve_boot_volume = false
}

resource "oci_core_instance" "homelab_two" {
  availability_domain = data.oci_identity_availability_domains.ads.availability_domains[1].name
  compartment_id      = "ocid1.tenancy.oc1..aaaaaaaaor5rtzfaz6jthjxca6cjxrnuqpez6r26sjrfv7e6ijpsajl5tfcq"
  shape               = "VM.Standard.E2.1.Micro"  

  source_details {
    source_id         = "ocid1.image.oc1.iad.aaaaaaaadbfugk7yavmaoy2seyncuj23q4r7junesaxtt7iyokegifo574ia"
    source_type       = "image"
  }

  display_name        = "homelab_two" 

  create_vnic_details {
    subnet_id         = "ocid1.subnet.oc1.iad.aaaaaaaae3nvcyqmhczaiq6mq5hiyegz73kfp5hmn75xgnjwhdio52tgqvzq"
    assign_public_ip  = true
  }

  metadata = {
    ssh_authorized_keys = file("${path.module}/ssh_keys/nick.pub")
  }

  preserve_boot_volume = false
}


output "homelab_one_ip" {
  value = oci_core_instance.homelab_one.public_ip
}

output "homelab_two_ip" {
  value = oci_core_instance.homelab_two.public_ip
}
