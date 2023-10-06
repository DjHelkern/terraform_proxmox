# proxmox_terraform

# подготовка шаблона cloud-init 

# Установка libguestfs-tools (только один раз, перед первым запуском)

apt update -y
apt install libguestfs-tools -y

# Скачайте образ диска с Debian Cloud-init

wget http://cloud.debian.org/images/cloud/bullseye/latest/debian-11-generic-amd64.qcow2

# Установите qemu-guest-agent для образа диска

virt-customize -a debian-11-generic-amd64.qcow2 --install qemu-guest-agent

# Установитеимя вашей ОС для образа диска и создайте новую виртуальную машину в Proxmox с заданными параметрами:

qm create 100200 --name "debian11.vm" --memory 2048 --cores 2 --net0 virtio,bridge=vmbr0

# Импортируйте диск и настройте парааметры хранения:

qm importdisk 100200 debian-11-generic-amd64.qcow2 local-lvm

# Настройте память и использование жесткого диска:

qm set 100200 --scsihw virtio-scsi-pci --scsi0 local-lvm:vm-100200-disk-0

# Настройте параметры загрузки виртуальной машины:

qm set 100200 --boot c --bootdisk scsi0

# Настройте облачный инициализационный диск:

qm set 100200 --ide2 local-lvm:cloudinit

# Укажите параметры для последовательного порта и видеоадаптера виртуальной машины:

qm set 100200 --serial0 socket --vga serial0

# Включите qemu-guest-agent для улучшенной интеграции между хостом и гостевой ОС:

qm set 100200 --agent enabled=1

# Сделайте эту виртуальную машину шаблоном для дальнейшего использования:

qm template 100200

# Обязательно удалите скачанный образ диска:

rm debian-11-generic-amd64.qcow2
