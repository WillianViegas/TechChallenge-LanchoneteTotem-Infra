terraform {
  backend "s3" {
    bucket = "terraform-tfstates-totem-eks"
    key    = "totemLanchoneteEKS/terraform.tfstate"
    region = "${var.regionDefault}"
  }
}