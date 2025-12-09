<!doctype html>
<html lang="pt-BR">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width,initial-scale=1" />
  <title>📦 Sistema AVA.SA — README</title>
</head>
<body>
  <h1>📦 Sistema AVA.SA</h1>
  <p><strong>Gestão de Vendas, Estoque e Administração</strong></p>

  <div class="section">
    <p>Este repositório contém o <strong>backend</strong> do sistema <strong>AVA.SA</strong>, uma solução desenvolvida para apoiar operações de vendas, controle de estoque, administração, relatórios e gestão de usuários. A API foi construída seguindo boas práticas e integra banco de dados relacional, regras de negócio documentadas e diagramas UML completos.</p>
  </div>

  <div class="section">
    <h2>📁 Estrutura do Projeto</h2>
    <pre>
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
    </pre>
  </div>

  <div class="section">
    <h2>🧠 Arquitetura</h2>
    <ul>
      <li class="badge">API</li> <span>API em Python — implementada com <code>Flask</code> ou <code>FastAPI</code> (ver <code>api.py</code>).</span>
      <li class="badge">Banco</li> <span>Banco de dados relacional — script em <code>SA/Banco da SA.sql</code>.</span>
      <li class="badge">Modelagem</li> <span>Modelo lógico do banco (arquivo <code>.webp</code>) e diagramas UML na pasta de documentação.</span>
    </ul>
  </div>

  <div class="section">
    <h2>⚙️ Funcionalidades Implementadas</h2>

    <h3>🔐 Administração</h3>
    <ul>
      <li>Cadastro de usuários</li>
      <li>Cadastro de fornecedores</li>
      <li>Login e validação via API</li>
    </ul>

    <h3>🛒 Vendas</h3>
    <ul>
      <li>Processamento de vendas</li>
      <li>Parcelamento</li>
      <li>Cancelamento</li>
      <li>Caixa rápido</li>
      <li>Fechamento de caixa</li>
      <li>Validação de idade</li>
      <li>Compra por funcionário</li>
    </ul>

    <h3>📦 Estoque</h3>
    <ul>
      <li>Cadastro de produtos</li>
      <li>Baixa de estoque automática</li>
      <li>Geração de relatórios</li>
      <li>Registro de movimentações (entrada / saída)</li>
    </ul>
  </div>

  <div class="section">
    <h2>🗄️ Banco de Dados</h2>
    <p>O projeto utiliza um banco relacional com tabelas principais como:</p>
    <ul>
      <li><code>produto</code></li>
      <li><code>movimentacaoestoque</code></li>
      <li><code>itemvenda</code></li>
      <li><code>venda</code></li>
      <li><code>usuario</code></li>
      <li><code>fornecedor</code></li>
      <li>etc.</li>
    </ul>
    <p>Script completo: <code>SA/Banco da SA.sql</code></p>
  </div>

  <div class="section">
    <h2>🧩 Documentação e Materiais</h2>
    <p>A pasta <code>AVA.SA - 2025</code> contém:</p>
    <ul>
      <li><strong>Regras de Negócio</strong> — processos, prioridades e validações.</li>
      <li><strong>Requisitos Funcionais</strong> — ex.: RF01, RF02, RF03...</li>
      <li><strong>Requisitos Não Funcionais</strong> — segurança, desempenho, manutenibilidade.</li>
      <li><strong>Diagramas UML</strong> — diagramas de atividade para Administração, Estoque e Vendas.</li>
    </ul>
  </div>

  <div class="section">
    <h2>▶️ Como Executar a API</h2>

    <p><strong>1. Instalar dependências (exemplo mínimo):</strong></p>
    <pre class="cmd">pip install flask
pip install mysql-connector-python</pre>

    <p><strong>2. Executar a API:</strong></p>
    <pre class="cmd">python api.py</pre>

    
  </div>

</body>
</html>
