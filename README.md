## Instalar Dependências Fedora

```bash
sudo dnf4 config-manager --add-repo https://rpm.releases.hashicorp.com/fedora/hashicorp.repo -y;
sudo dnf install awscli2 ansible-galaxy terraform -y;
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

