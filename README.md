# RecrutaBoot
![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)
![Dart](https://img.shields.io/badge/dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white)
![Java](https://img.shields.io/badge/java-%23ED8B00.svg?style=for-the-badge&logo=openjdk&logoColor=white)
![Spring](https://img.shields.io/badge/spring-%236DB33F.svg?style=for-the-badge&logo=spring&logoColor=white)

# Sobre o projeto
RecrutaBoot é uma aplicação fullstack desenvolvida com Spring Boot no back-end e Flutter no mobile. A aplicação permite aos recrutadores visualizar seus candidatos registrados, seus detalhes, seus candidatos favoritos, editá-los e deletá-los.

### Tecnologias Utilizadas

- *Back end:* Spring Boot, com foco na administração de usuários, realiza todas as operações de CRUD e inclui um sistema de favoritos para candidatos selecionados.
- *Mobile:* No Flutter, a arquitetura da aplicação utiliza uma camada de Store para gerenciar o estado e a lógica de carregamento. A comunicação com a camada de dados é realizada através do repositório, que, por sua vez, interage com a camada HTTP. A Store é responsável por acionar os métodos do repositório e atualizar os estados de carregamento, erro e os dados exibidos na interface.

Durante o desenvolvimento, aprofundei meus conhecimentos em todas essas tecnologias, integrando-as para criar uma aplicação robusta e funcional.

## Layout mobile
![Mobile 1](/assetsRecrutaBoot/login.png) 
![Mobile 2](/assetsRecrutaBoot/home.png)
![Mobile 3](/assetsRecrutaBoot/drawer.png) 
![Mobile 4](/assertsReadme/candidates.png)

# Tecnologias utilizadas
## Back end
- Java
- Spring Boot
- JPA / Hibernate
- Maven
## Front end
- HTML / CSS / JS / TypeScript
- ReactJS
## Implantação em produção
- Back end: Heroku
- Front end web: Netlify
- Banco de dados: Postgresql

# Rotas
&#9679;	Produtos

| Método | Caminho                      | Descrição                                           | Role Necessária                  |
| ------ | ---------------------------- | -------------------------------------------------- | -------------------------------- |
| GET    | /products/{id}             | Retorna um produto específico pelo ID.              | Nenhuma                          |
| GET    | /products                  | Retorna uma lista paginada de produtos, podendo filtrar pelo nome. | Nenhuma            |
| POST   | /products                  | Adiciona um novo produto.                           | ROLE_ADMIN                     |
| PUT    | /products/{id}             | Atualiza os dados de um produto específico pelo ID. | ROLE_ADMIN                     |
| DELETE | /products/{id}             | Remove um produto específico pelo ID.               | ROLE_ADMIN                     |

&#9679;	Pedidos
| Método | Caminho                      | Descrição                                           | Role Necessária                      |
| ------ | ---------------------------- | -------------------------------------------------- | ------------------------------------ |
| GET    | /orders/{id}               | Retorna uma ordem específica pelo ID.              | ROLE_ADMIN ou ROLE_CLIENT        |
| POST   | /orders                    | Cria uma nova ordem.                               | ROLE_CLIENT                        |

&#9679;	Categorias
| Método | Caminho          | Descrição                                      | Role Necessária |
| ------ | ---------------- | --------------------------------------------- | --------------- |
| GET    | /categories    | Retorna a lista de todas as categorias.       | Nenhuma         |

&#9679;	Usuario
| Método | Caminho        | Descrição                                        | Role Necessária                      |
| ------ | -------------- | ----------------------------------------------- | ------------------------------------ |
| GET    | /users/me    | Retorna as informações do usuário autenticado.  | ROLE_ADMIN ou ROLE_CLIENT        |


# Como executar o projeto

## Back end
Pré-requisitos: Java 21

```bash
# clonar repositório
git clone https://github.com/Ital023/DSCommerce.git

# executar o projeto
./mvnw spring-boot:run
```

## Front end web
Pré-requisitos: npm / yarn

```bash
# clonar repositório
git clone https://github.com/Ital023/DSCommerce-FrontEnd.git

# instalar dependências
yarn install

# executar o projeto
yarn start
```
## 🤝 Colaboradores

Agradecemos às seguintes pessoas que contribuíram para este projeto:

<table>
  <tr>
    <td align="center">
      <a href="https://github.com/Ital023" title="Github do Ítalo Miranda">
        <img src="https://avatars.githubusercontent.com/u/113559117?v=4" width="100px;" alt="Foto do Ítalo Miranda no GitHub"/><br>
        <sub>
          <b>Ítalo Miranda</b>
        </sub>
      </a>
    </td>
  </tr>
</table>
