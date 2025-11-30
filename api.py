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
        password="",  # coloque sua senha caso tenha
        database="supermercadosa",
        port=3306
    )

# --------------------------------------------------
# ROTA DE TESTE
# --------------------------------------------------
@app.get("/")
def home():
    return "API do Supermercado SA funcionando!!!"

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


# --------------------------------------------------
# CADASTRAR PRODUTO
# --------------------------------------------------
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
# INICIAR SERVIDOR
# --------------------------------------------------
if __name__ == "__main__":
    print("API rodando em http://localhost:5000")
    app.run(debug=True)
