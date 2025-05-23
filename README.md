## Instalar Dependências Fedora

```bash
sudo dnf4 config-manager --add-repo https://rpm.releases.hashicorp.com/fedora/hashicorp.repo -y;
sudo dnf install awscli2 ansible-galaxy terraform -y;
```

#### Docker
```bash
sudo dnf install dnf-plugins-core -y;
sudo dnf4 config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo -y;
sudo dnf install docker-ce docker-ce-cli containerd.io -y;
sudo systemctl start docker;
#Só execute se você quiser que o docker seja sempre iniciado com systemd
sudo systemctl enable docker;
sudo docker run hello-world;  # Teste para verificar se tudo está correto
# Só execute os próximos passos se quiser executar o docker em seu usuário sem precisar do root(sudo)
sudo gpasswd -a ${USER} docker && sudo systemctl restart docker;
newgrp docker
```


**Mova a pasta .aws para o seu diretorio home.**

```bash 
mv .aws ~/
```

### ✅ Comandos Terraform

```bash
terraform init
terraform plan
terraform apply
```

Verifique se o bucket foi criado:

```bash
awslocal s3 ls
```
---

### ✅ Para rodar:
Salve esse conteúdo como docker-compose.yml.

No terminal, execute:

```bash
docker compose up -d
```

---

### ✅ Comandos Ansible

Instale a collection AWS:

```bash
ansible-galaxy collection install -r requirements.yml
```

Execute o playbook:

```bash
ansible-playbook -i inventory.yml list_buckets.yml
```

---

## Finalidade de Arquivos

| Arquivo             | Finalidade                                |
| ------------------  | ----------------------------------------- |
| `docker-compose.yml`| Iniciar container docker                  |
| `provider.tf`       | Provider AWS apontando para LocalStack    |
| `main.tf`           | Cria o bucket no LocalStack               |
| `versions.tf`       | Define versões do Terraform e do provider |
| `inventory.yml`     | Inventário Ansible (localhost)            |
| `list_buckets.yml`  | Playbook para listar buckets S3           |
| `requirements.yml`  | Dependências da collection amazon.aws     |

---

