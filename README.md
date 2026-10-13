# Banco Web Tests

Projeto de testes automatizados de ponta a ponta (E2E) para a aplicação web bancária, desenvolvido utilizando [Cypress](https://www.cypress.io/).

---

## Objetivo

Garantir a integridade, funcionalidade e confiabilidade dos fluxos críticos da aplicação web bancária por meio de testes end-to-end automatizados, validando desde o fluxo de autenticação até operações financeiras como transferências de valores.

---

## Contexto

Este projeto faz parte de um ambiente de desenvolvimento e testes integrados, onde a interface web consome os serviços disponibilizados pela API do banco. 

Para que a suíte de testes funcione corretamente, o ecossistema depende de duas aplicações externas que precisam estar ativas localmente:

* **API Backend**: [juliodelimas/banco-api](https://github.com/juliodelimas/banco-api)
* **Frontend Web**: [juliodelimas/banco-web](https://github.com/juliodelimas/banco-web) (executando em `http://localhost:4000`)

---

## Regras e Pré-requisitos

### Pré-requisitos

1. **Node.js** instalado na máquina (versão LTS recomendada).
2. **Aplicações dependentes em execução**:
   * A **API** ([banco-api](https://github.com/juliodelimas/banco-api)) deve estar rodando e acessível.
   * A **aplicação Web** ([banco-web](https://github.com/juliodelimas/banco-web)) deve estar em execução e respondendo em `http://localhost:4000`.

### Regras de Negócio Cobertas

* **Autenticação (Login)**:
  * Acesso permitido ao informar credenciais válidas.
  * Exibição de mensagem de erro (`Erro no login. Tente novamente.`) ao informar credenciais inválidas.
* **Transferências**:
  * Realização com sucesso de transferência com contas de origem/destino e valores válidos.
  * Bloqueio e solicitação de autenticação adicional para transferências com valor acima de R$ 5.000,00 sem token (`Autenticação necessária para transferências acima de R$5.000,00.`).

---

## Tecnologias Utilizadas

* **Node.js**
* **Cypress** (v16+)
* **cypress-mochawesome-reporter** (Geração de relatórios HTML)

---

## Como Executar

### 1. Clonar o repositório e instalar dependências

```bash
git clone https://github.com/thaliamariana/banco-web-tests.git
cd banco-web-tests
npm install
```

### 2. Garantir que os serviços dependentes estejam rodando

Certifique-se de ter iniciado a [banco-api](https://github.com/juliodelimas/banco-api) e a [banco-web](https://github.com/juliodelimas/banco-web) em terminais separados antes de rodar os testes.

### 3. Execução dos Testes

* **Modo Headless (linha de comando):**
  ```bash
  npm test
  ```

* **Modo Headed (com navegador visível):**
  ```bash
  npm run cy:headed
  ```

* **Modo Interativo (Cypress Test Runner):**
  ```bash
  npm run cy:open
  ```

---

## Relatórios de Execução

Após a execução dos testes via `npm test` ou `npm run cy:headed`, o relatório interativo em HTML gerado pelo *Mochawesome Reporter* estará disponível no seguinte caminho:

```plaintext
cypress/reports/html/index.html
```

---

## Estrutura do Projeto

```plaintext
banco-web-tests/
├── cypress/
│   ├── e2e/                # Especificações de testes (login, transferencia)
│   ├── fixtures/           # Massa de dados de teste (credenciais.json)
│   ├── reports/            # Relatórios gerados pelas execuções
│   └── support/            # Comandos customizados (custom commands) e configurações
├── cypress.config.js       # Arquivo de configuração do Cypress (baseUrl, plugins)
├── package.json            # Dependências e scripts de execução
└── README.md               # Documentação do projeto
```
