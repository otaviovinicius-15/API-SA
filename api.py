from flask import Flask, request, jsonify
import mysql.connector

app = Flask(__name__)

# --------------------------------------------------
# CONEXÃO COM MYSQL
# --------------------------------------------------
def conectar():
    return mysql.connector.connect(
        host="127.0.0.1",
        user="root",
        password="", 
        database="supermercadosa",
        port=3306
    )

# --------------------------------------------------
# ROTA DE TESTE
# --------------------------------------------------
@app.get("/")
def home():
    return "API do Supermercado SA funcionando!, adicione /(nome da tabela) na barra de link"

# --------------------------------------------------
# LISTAR PRODUTOS
# --------------------------------------------------
@app.get("/produtos")
def listar_produtos():
    db = conectar()
    cursor = db.cursor(dictionary=True)

    cursor.execute("SELECT * FROM produto")
    produtos = cursor.fetchall()

    cursor.close()
    db.close()

    return jsonify(produtos)

# --------------------------------------------------
# BUSCAR PRODUTO PELO SKU
# --------------------------------------------------
@app.get("/produto/<produto_id>")
def buscar_produto(produto_id):
    db = conectar()
    cursor = db.cursor(dictionary=True)

    cursor.execute("SELECT * FROM produto WHERE sku = %s", (produto_id,))
    produto = cursor.fetchone()

    cursor.close()
    db.close()

    if produto:
        return jsonify(produto)
    else:
        return jsonify({"success": False, "mensagem": "Produto não encontrado"})


# -------------------------------------------------
# CADASTRAR PRODUTO
# -------------------------------------------------
@app.post("/produto")
def cadastrar_produto():
    dados = request.json
    sku = dados["sku"]
    nome = dados["nome"]
    descricao = dados["descricao"]
    preco = dados["preco"]
    estoque_atual = dados["estoque_atual"]
    estoque_minimo = dados["estoque_minimo"]
    exige_idade = dados["exige_idade"]

    db = conectar()
    cursor = db.cursor()

    cursor.execute("""
        INSERT INTO produto (sku, nome, descricao, preco, estoque_atual, estoque_minimo, exige_idade)
        VALUES (%s, %s, %s, %s, %s, %s, %s)
    """, (sku, nome, descricao, preco, estoque_atual, estoque_minimo, exige_idade))

    db.commit()

    cursor.close()
    db.close()

    return jsonify({"success": True, "mensagem": "Produto cadastrado com sucesso!"})

# --------------------------------------------------
# LISTAR FORNECEDOR 
# --------------------------------------------------
@app.get("/fornecedores")
def listar_fornecedores():
    db = conectar()
    cursor = db.cursor(dictionary=True)

    cursor.execute("SELECT * FROM fornecedor")
    fornecedores = cursor.fetchall()

    cursor.close()
    db.close()

    return jsonify(fornecedores)

# --------------------------------------------------
# LISTAR USUÁRIOS
# --------------------------------------------------
@app.get("/usuarios")
def listar_usuarios():
    db = conectar()
    cursor = db.cursor(dictionary=True)

    cursor.execute("SELECT * FROM usuario")
    usuarios = cursor.fetchall()

    cursor.close()
    db.close()

    return jsonify(usuarios)

# --------------------------------------------------
# LISTAR VENDAS
# --------------------------------------------------
@app.get("/venda")
def listar_venda():
    db = conectar()
    cursor = db.cursor(dictionary=True)

    cursor.execute("SELECT * FROM venda")
    venda = cursor.fetchall()

    cursor.close()
    db.close()

    return jsonify(venda)

# --------------------------------------------------
# LISTAR SUPERVISORES
# --------------------------------------------------
@app.get("/supervisor")
def listar_supervisor():
    db = conectar()
    cursor = db.cursor(dictionary=True)

    cursor.execute("SELECT * FROM supervisor")
    supervisor = cursor.fetchall()

    cursor.close()
    db.close()

    return jsonify(supervisor)

# --------------------------------------------------
# LISTAR PARCELAS
# --------------------------------------------------
@app.get("/parcela")
def listar_parcela():
    db = conectar()
    cursor = db.cursor(dictionary=True)

    cursor.execute("SELECT * FROM parcela")
    parcela = cursor.fetchall()

    cursor.close()
    db.close()

    return jsonify(parcela)

# --------------------------------------------------
# LISTAR OPERADORES DE CAIXA
# --------------------------------------------------
@app.get("/operadorcaixa")
def listar_operadorcaixa():
    db = conectar()
    cursor = db.cursor(dictionary=True)

    cursor.execute("SELECT * FROM operadorcaixa")
    operador = cursor.fetchall()

    cursor.close()
    db.close()

    return jsonify(operador)

# --------------------------------------------------
# LISTAR MOVIMENTAÇÃO DE ESTOQUE
# --------------------------------------------------
@app.get("/movimentacaoestoque")
def listar_movimentacaoestoque():
    db = conectar()
    cursor = db.cursor(dictionary=True)

    cursor.execute("SELECT * FROM movimentacaoestoque")
    movimentacoes = cursor.fetchall()

    cursor.close()
    db.close()

    return jsonify(movimentacoes)

# --------------------------------------------------
# LISTAR ITENS DE VENDA
# --------------------------------------------------
@app.get("/itemvenda")
def listar_itemvenda():
    db = conectar()
    cursor = db.cursor(dictionary=True)

    cursor.execute("SELECT * FROM itemvenda")
    itens = cursor.fetchall()

    cursor.close()
    db.close()

    return jsonify(itens)

# --------------------------------------------------
# INICIAR SERVIDOR
# --------------------------------------------------
if __name__ == "__main__":
    print("API rodando em http://localhost:5000")
    app.run(debug=True)
