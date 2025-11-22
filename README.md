# github-action-practice

This project demonstrates a **modular Terraform** setup for deploying Azure infrastructure in a clean, scalable way. It supports two environments — **development** and **production** — with all Terraform lifecycle steps (`init`, `fmt`, `validate`, `plan`, `apply`) automated using GitHub Actions. Production is protected with a **manual approval gate** to ensure safe deployment.

---

## **Key features**
- Modular Terraform architecture with reusable child modules  
- Dedicated **dev** and **prod** environment directories  
- GitHub Actions automation for every Terraform step  
- Production environment protected with manual approval  
- Workflows written using GitHub Action’s YAML syntax  
- Uses Terraform features like lifecycle blocks, import blocks, locals, dynamic blocks, and loops  

---

## **Branch-based workflow behavior (important)**
The GitHub Actions workflow is designed with a safe, real-world CI/CD approach:

### ✅ **When code is pushed to a feature branch / pull request to main**  
- Only the **init → fmt → validate → plan** jobs run.  
- This ensures Terraform correctness **without applying changes**.

### ✅ **When code is pushed to the `main` branch**  
- The **plan job** runs first  
- Then the **apply job runs**, but only after **manual approval** through GitHub Environments  

This prevents accidental infrastructure changes and ensures controlled deployment to production.

---

## **Automation workflow summary**
Both `dev.yml` and `prod.yml` workflows automatically perform:

- `terraform init`  
- `terraform fmt`  
- `terraform validate`  
- `terraform plan`  
- `terraform apply` (only on `main` branch with manual approval)

---

## **Local testing (optional)**
You can still test Terraform locally if needed:

```bash
cd environments/dev
terraform init
terraform fmt
terraform validate
terraform plan -var-file="terraform.tfvars"
terraform apply -var-file="terraform.tfvars"
```

Note: CI/CD already runs everything, so local apply is optional.

---

## **Best practices**
- Store sensitive values in GitHub Secrets
- Use manual approval gates for production safety
- Keep modules small and reusable
- Format and validate Terraform in every PR
- Use least-privilege Azure service principals

---

## **Author / Contact**
- Arpit Yadav
- Phone: 8307532971
- Email: arpit32971@gmail.com
- LinkedIn: https://www.linkedin.com/in/arpit-yadav-786b1622b
