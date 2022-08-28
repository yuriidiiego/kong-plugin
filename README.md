
![kong](https://user-images.githubusercontent.com/83776617/183530699-068d9374-a2f6-4c28-95ce-6a4ccd155112.png)

# Sobre o plugin

Este plugin faz a autenticação em um serviço externo e libera acesso a uma rota baseada em tal serviço.
O serviço externo precisa:

- Receber uma requisição POST;
- Tal requisição precisa receber o header "usuario" e o header "senha";
- Caso usuario/senha seja autorizado:
- Retorna um status 200 e um body no formato JSON com o seguinte conteúdo:

```json
{
"auth": "Bearer",
"token": "7fa99747e55a0b2c6c56a2de266087ed"
}
```
