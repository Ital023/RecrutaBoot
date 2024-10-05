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
![Mobile 4](/assetsRecrutaBoot/candidates.png)
![Mobile 5](/assetsRecrutaBoot/candidateDetails.png)
![Mobile 6](/assetsRecrutaBoot/buttonFavorite.png)
![Mobile 7](/assetsRecrutaBoot/deleteUser.png)
![Mobile 8](/assetsRecrutaBoot/updateUser.png)
![Mobile 9](/assetsRecrutaBoot/register.png)
![Mobile 10](/assetsRecrutaBoot/validation.png)


# Tecnologias utilizadas
## Back end
- Java
- Spring Boot
- JPA / Hibernate
- Maven
## Front end
- Flutter
- Dart
- GoRouter
- Http Flutter
- SOLID

# Rotas
&#9679;	Candidates

| Método | Caminho                      | Descrição                                           | 
| ------ | ---------------------------- | -------------------------------------------------- |
| GET    | /candidate/{id}            | Retorna um candidato específico pelo ID.              |
| GET    | /candidate/pageable        | Retorna uma lista paginada de candidatos, permitindo o front end escolher quantos usuarios a serem exibidos, ordenando ou não pelo ultima atualização do usuário. |
| POST   | /candidate                  | Adiciona um novo candidato                          | 
| PUT    | /candidate/{id}             | Atualiza os dados de um candidato específico pelo ID. | 
| PUT    | /candidate/favorite/{id}    | Atualiza o status de favorito do candidadto. | 
| DELETE | /candidate/{id}             | Remove um produto específico pelo ID.               |

# Diferenciais
Neste projeto, desenvolvi uma lógica para preencher a foto do usuário com base no input do nome de usuário do GitHub. Utilizei a API oficial do GitHub para obter informações, como avatar_url e html_url, permitindo o uso da foto já disponível na web.

# Como executar o projeto

## Back end
Pré-requisitos: Java 21

```bash
# clonar repositório
git clone --branch main https://github.com/Ital023/RecrutaBoot.git

# navegar até RecrutaBootBackend

# executar o projeto
./mvnw spring-boot:run
```

## Front end Mobile Flutter
Pré-requisitos: Flutter

```bash
# clonar repositório
git clone --branch main https://github.com/Ital023/RecrutaBoot.git

# navegar até RecrutaBoot

# instalar dependências
flutter pub get

# executar o projeto
F5
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
