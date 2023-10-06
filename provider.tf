provider "proxmox" {
  pm_api_url          = "https://10.14.0.121:8006/api2/json"
  pm_api_token_id     = "root@pam!terraform"
  pm_api_token_secret = var.PROXMOX_API_SECRET
  pm_user             = "root@pam"
  pm_password         = "password"
  pm_tls_insecure     = true
}

