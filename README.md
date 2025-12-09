
📦 **Sistema AVA.SA**
**Gestão de Vendas, Estoque e Administração**

Este repositório contém o **backend** do sistema **AVA.SA**, uma solução desenvolvida para apoiar operações de vendas, controle de estoque, administração, relatórios e gestão de usuários. A API foi construída seguindo boas práticas e integra banco de dados relacional, regras de negócio documentadas e diagramas UML completos.

---

## 📁 Estrutura do Projeto

```
SA/
├── api.py               # Arquivo principal da API
├── Banco da SA.sql      # Script completo do banco relacional
├── Modelo logico banco.webp

AVA.SA - 2025/
├── CANVAS/
│   └── Modelo Canvas.pdf
├── REG_NEG/
│   └── Regras de Negócio.pdf
├── REQUI_FUN_NFUN/
│   ├── Requisitos Funcionais.pdf
│   └── Requisitos Não Funcionais.pdf
└── UML/
    ├── ADMINISTRAÇÃO/
    ├── ESTOQUE/
    └── VENDAS/
        # Diagramas de atividades dos principais processos
```

---

## 🧠 Arquitetura

* **API em Python** — implementada com Flask ou FastAPI (ver `api.py`).
* **Banco de dados relacional** — script completo em `SA/Banco da SA.sql`.
* **Modelagem** — modelo lógico do banco (`.webp`) e diagramas UML na pasta de documentação.

---

## ⚙️ Funcionalidades Implementadas

### 🔐 Administração

* Cadastro de usuários
* Cadastro de fornecedores
* Login e validação via API

### 🛒 Vendas

* Processamento de vendas
* Parcelamento
* Cancelamento
* Caixa rápido
* Fechamento de caixa
* Validação de idade
* Compra por funcionário

### 📦 Estoque

* Cadastro de produtos
* Baixa de estoque automática
* Geração de relatórios
* Registro de movimentações (entrada / saída)

---

## 🗄️ Banco de Dados

O projeto utiliza um banco relacional com tabelas como:

* `produto`
* `movimentacaoestoque`
* `itemvenda`
* `venda`
* `usuario`
* `fornecedor`
* etc.

Script completo: **SA/Banco da SA.sql**

---

## 🧩 Documentação e Materiais

A pasta **AVA.SA - 2025** contém:

* **Regras de Negócio** — processos, prioridades e validações.
* **Requisitos Funcionais** — ex.: RF01, RF02, RF03…
* **Requisitos Não Funcionais** — segurança, desempenho, manutenibilidade.
* **Diagramas UML** — diagramas de atividade para Administração, Estoque e Vendas.

---

## ▶️ Como Executar a API

### 1. Instalar dependências (exemplo mínimo):

```
pip install flask
pip install mysql-connector-python
```

### 2. Executar a API:

```
python api.py
```

---

