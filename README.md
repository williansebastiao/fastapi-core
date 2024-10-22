
# FastAPI Core

Este projeto é um template desenvolvido em FastAPI para agilizar o desenvolvimento de aplicações. Ele fornece uma estrutura básica e ferramentas úteis para facilitar o trabalho com APIs em Python.


## Instalação

Para instalar o projeto, execute o seguinte comando:

```bash
  make scaffold
```

## Executando o projeto

Para rodar o projeto, utilize o seguinte comando:

```
make build
```

Esse comando irá construir os containers docker necessários para executar a aplicação.

## Linting e qualidade do código

O projeto inclui um conjunto de pacotes para verificar a qualidade do código. Para executar as ferramentas de linting, use:

```
make lint
```

Isso garante que o código esteja em conformidade com as melhores práticas e padrões de codificação.

## Makefile

Para facilitar diversos processos, o projeto inclui um arquivo Makefile. Você pode visualizar todas as funcionalidades disponíveis digitando o seguinte comando no terminal:

```
make
```

Aqui está uma lista das funcionalidades disponíveis:


| Comando                    | Descrição                                          |
|---------------------------|----------------------------------------------------|
| `scaffold`                | Inicia a configuração do projeto                    |
| `start`                   | Inicia todos os containers                          |
| `build`                   | Constrói todos os containers sem desanexar         |
| `stop`                    | Para todos os containers                            |
| `container`               | Acessa o container                                  |
| `pre-commit`              | Executa o pre-commit                               |
| `pre-commit-install`      | Instala o pre-commit                               |
| `pre-commit-update`       | Atualiza o pre-commit                              |
| `pylint-generate`         | Gera o arquivo de configuração do pylint           |
| `lint`                    | Executa todas as ferramentas de linting            |
| `test`                    | Executa os testes com Pytest dentro do container   |
| `flake`                   | Executa o Flake8                                   |
| `black`                   | Executa o Black                                    |
| `isort`                   | Executa o Isort                                    |
| `autoflake`               | Executa o Autoflake                                |
| `pylint`                  | Executa o Pylint                                   |

## Debugging

É possível realizar a depuração do projeto. Se você estiver utilizando o Visual Studio Code, siga estes passos:

- Clique no botão "Run and Debug" na barra lateral do programa.
- Clique no botão "Start Debugging".

Certifique-se de que o Docker está em execução.
Depois, defina um breakpoint e observe a execução do código em tempo real.

## Bibliotecas utilizadas

O projeto utiliza as seguintes bibliotecas:

- [FastAPI](https://fastapi.tiangolo.com/)
- [Poetry](https://python-poetry.org/)
- [Pydantic Settings](https://docs.pydantic.dev/latest/concepts/pydantic_settings/)
- [Uvicorn](https://www.uvicorn.org/)
- [Httpx](https://www.python-httpx.org/)
- [Pendulum](https://pendulum.eustace.io/)
- [Email validator](https://docs.pydantic.dev/latest/api/networks/#pydantic.networks.EmailStr)
- [Pre-commit](https://pre-commit.com/)
- [Flake8](https://flake8.pycqa.org/en/latest/user/index.html)
- [Black](https://black.readthedocs.io/en/stable/index.html)
- [Isort](https://pycqa.github.io/isort/)
- [Autoflake](https://github.com/PyCQA/autoflake)
- [Pylint](https://github.com/pylint-dev/pylint)
- [Debugpy](https://github.com/microsoft/debugpy/)

## Tarefas pendentes

- Adicionar suporte ao Mockon
- Implementar debug para PyCharm
- Criar uma camada de testes